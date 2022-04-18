FrameworkLogger = Logger.Create(GetCurrentResourceName(), 2)
local loadedFrameworks = {}
FrameworkLoader = {}

local predefinedFrameworks = {
    ["es_extended"] = {
        CoreObjectName = "ESX",
        CoreObjectFunc = function()
            return exports['es_extended']:getSharedObject()
        end,
        FrameworkType = 'main',
        State = "missing"
    },
    ["qb-core"] = {
        CoreObjectName = "QBCore",
        CoreObjectFunc = function()
            return exports['qb-core']:GetCoreObject()
        end,
        FrameworkType = 'main',
        State = "missing",
    },
    ["ox_inventory"] = {
        CoreObjectName = "OxInventory",
        CoreObjectFunc = function()
            return exports.ox_inventory
        end,
        FrameworkType = 'inventory',
        State = "missing",
    }
}

function FrameworkLoader:LoadDefaults()
    for key, value in pairs(predefinedFrameworks) do
        local resourceState = GetResourceState(key)
        predefinedFrameworks[key].State = resourceState == 'started' and 'exists' or 'missing'
        if(resourceState == 'missing') then
            FrameworkLogger:Warning("FrameworkLoader:LoadDefaults: " .. key .. " is not found. Skipping...")
        else
            FrameworkLogger:Info("FrameworkLoader:LoadDefaults: " .. key .. " is found. Loading framework...")
            FrameworkLoader:LoadFramework(key)
        end
    end
end

function FrameworkLoader:LoadFramework(resourceName)
    local resourceExists = GetResourceState(resourceName) ~= 'missing'
    if(not resourceExists) then
        FrameworkLogger:Warning("FrameworkLoader:LoadFramework: " .. resourceName .. " not found. Skipping...")
        return false
    end

    FrameworkLogger:Info("Loading '^4" .. resourceName .. "^7' Framework into SSDev_Framework")

    Framework[resourceName] = {}

    FrameworkLogger:Info("'^4" .. resourceName .. "^7' loaded into SSDev_Framework")

    loadedFrameworks[resourceName] = true
    return true
end

function FrameworkLoader:GetActiveFramework(type)
    type = type or 'main'
    for key, value in pairs(predefinedFrameworks) do
        if(value.State == 'exists' and value.FrameworkType == type) then
            return key
        end
    end

    return nil
end

function FrameworkLoader:IsFrameworkLoaded(framework)
    return loadedFrameworks[framework]
end

function FrameworkLoader:GetCoreObject(framework)
    framework = framework or FrameworkLoader:GetActiveFramework()
    return predefinedFrameworks[framework].CoreObjectFunc()
end