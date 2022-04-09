local function GetFramework(framework)
    if(framework ~= nil and framework ~= '') then
        local localFramework = {}
        dofile(GetResourcePath(GetCurrentResourceName()) .. '/server/frameworks/' .. framework .. '.lua')
        return localFramework
    end

    return Framework
end
exports("GetFramework", GetFramework)