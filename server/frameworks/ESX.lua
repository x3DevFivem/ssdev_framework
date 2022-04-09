if(FrameworkLoader:IsFrameworkLoaded("es_extended")) then return end

Framework.RegisterServerCallback = ESX.RegisterServerCallback

ESX = FrameworkLoader:GetCoreObject()

function Framework:RegisterServerCallback(name, cb)
    Logger:Debug("Framework.RegisterServerCallback: " .. name)
    ESX.RegisterServerCallback(name, cb)
end

function Framework:NotifyPlayer(source, title, message, color, icon)
    TriggerClientEvent(
            "esx:showAdvancedNotification",
            source,
            title,
            message,
            icon,
            color,
            3
        )
end

function Framework:CheckInventoryForItem(source, item, amount)
    amount = amount or 0
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getInventoryItem(item).count > amount
end

function Framework:RemoveItemFromInventory(source, item, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, amount)
end

function Framework:AddItemToInventory(source, item, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, amount)
end

function Framework:CanCarryItem(source, item, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.canCarryItem(item, amount)
end

function Framework:GetItemInventoryInfo(source, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getInventoryItem(item)
end

function Framework:AddMoney(source, account, amount, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney(account, amount)
end

function Framework:RemoveMoney(source, account, amount, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney(account, amount)
end

function Framework:GetAmountOfMoney(source, account)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getAccount(Config.PayinCurrency).money
end

-- Return identifier, player name
function Framework:GetPlayerInfo(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.identifier, xPlayer.name
end