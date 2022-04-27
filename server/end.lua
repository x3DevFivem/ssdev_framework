local function GetFramework(framework)
    if(framework ~= nil and framework ~= '') then
        local localFramework = {}
        dofile(GetResourcePath(GetCurrentResourceName()) .. '/server/frameworks/' .. framework .. '.lua')
        return localFramework
    end

    return Framework
end
exports("GetFramework", GetFramework)

local function CheckForUpdates(resource)
    if(not Config.UpdateChecking.Enabled) then
        FrameworkLogger:Warning("Resource Update checking is disabled. Skipping check for " .. resource)
        return
    end

    local version = GetResourceMetadata(resource, "version")
    local url = Config.UpdateChecking.UpdateServer .. "/api/Resource/" .. resource .. "/CheckForUpdate?myVersion=" .. version
    PerformHttpRequest(url, function (errorCode, resultData, resultHeaders)
        FrameworkLogger:Info("[Update Checker] Resource: " .. resource)
        if(resultData) then
            local result = json.decode(resultData).data
            if(result.needsUpdate) then
                local latestVersion = result.missingUpdates[#result.missingUpdates]
                FrameworkLogger:Warning("Current version: " .. version)
                FrameworkLogger:Warning("Latest version: " .. latestVersion.version)
                FrameworkLogger:Warning(resource .. " has an update available to: " .. latestVersion.version .. "!")
                FrameworkLogger:Warning("|------------------------------| " .. resource .. " Update Notes" .. " |------------------------------|")
                FrameworkLogger:Warning(result.combinedUpdateMessage)
                FrameworkLogger:Warning("|------------------------------------------------------------------------------------------|")
            else
                FrameworkLogger:Info(resource .. " is up to date!")
            end
        else
            FrameworkLogger:Error("[Update Checker] Error getting update information: " .. errorCode)
        end
    end)
end
exports("CheckForUpdates", CheckForUpdates)