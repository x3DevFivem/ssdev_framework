local loadedFrameworks = {}
FrameworkLoader = {}

local predefinedFrameworks = {
    ["es_extended"] = {
        CoreObjectName = "ESX",
        CoreObjectFunc = function()
            return exports['es_extended']:getSharedObject()
        end,
        State = "missing"
    },
    ["qb-core"] = {
        CoreObjectName = "QBCore",
        CoreObjectFunc = function()
            return exports['qb-core']:GetCoreObject()
        end,
        State = "missing",
    }
}

function FrameworkLoader:LoadDefaults()
    for key, value in pairs(predefinedFrameworks) do
        local resourceState = GetResourceState(key)
        predefinedFrameworks[key].State = resourceState == 'started' and 'exists' or 'missing'
        if(resourceState == 'missing') then
            Logger:Warning("FrameworkLoader:LoadDefaults: " .. key .. " is not found. Skipping...")
        else
            FrameworkLoader:LoadFramework(key)
        end
    end
end

function FrameworkLoader:LoadFramework(resourceName)
    local resourceExists = GetResourceState(resourceName) ~= 'missing'
    if(not resourceExists) then
        Logger:Warning("FrameworkLoader:LoadFramework: " .. resourceName .. " not found. Skipping...")
        return false
    end

    Logger:Info("Loading '^4" .. resourceName .. "^7' Framework into SSDev_Framework")

    Framework[resourceName] = {}

    Logger:Info("'^4" .. resourceName .. "^7' loaded into SSDev_Framework")

    loadedFrameworks[resourceName] = true
    Logger:Debug("LOADED " .. resourceName)
    return true
end

local activeFramework = ''
function FrameworkLoader:GetActiveFramework()
    if(activeFramework ~= '') then
        return activeFramework
    end

    for key, value in pairs(predefinedFrameworks) do
        if(value.State == 'exists') then
            activeFramework = key
            return key
        end
    end

    return nil
end

function FrameworkLoader:IsFrameworkLoaded(framework)
    return not loadedFrameworks[framework]
end

function FrameworkLoader:GetCoreObject(framework)
    framework = framework or FrameworkLoader:GetActiveFramework()
    return predefinedFrameworks[framework].CoreObjectFunc()
end