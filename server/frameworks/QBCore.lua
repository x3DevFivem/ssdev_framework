if(not FrameworkLoader:IsFrameworkLoaded("qb-core")) then return end

QBCore = FrameworkLoader:GetCoreObject()

function Framework:RegisterServerCallback(name, cb)
    Logger:Debug("[ssdev] Framework.RegisterServerCallback: " .. name)
    QBCore.Functions.CreateCallback(name, cb)
end

function Framework:NotifyPlayer(source, title, message, color, icon)
    TriggerClientEvent("QBCore:Notify", source, message, (color == "green" and "success" or "error"))
end

function Framework:CheckInventoryForItem(source, item)
    local player = QBCore.Functions.GetPlayer(source)
    return player.Functions.HasItem(item)
end

function Framework:RemoveItemFromInventory(source, item, amount)
    local player = QBCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem(item, amount)
end

function Framework:AddItemToInventory(source, item, amount)
    local player = QBCore.Functions.GetPlayer(source)
    player.Functions.AddItem(item, amount)
end

function Framework:CanCarryItem(source, item, amount)
    Logger:Warning("Framework:CanCarryItem is not implemented yet!")
    return false
end

function Framework:GetItemInventoryInfo(source, item)
    local player = QBCore.Functions.GetPlayer(source)
    return player.Functions.GetItemByName(item)
end

function Framework:AddMoney(source, account, amount, reason)
    local player = QBCore.Functions.GetPlayer(source)
    player.Functions.AddMoney(account, amount, reason)
end

function Framework:RemoveMoney(source, account, amount, reason)
    local player = QBCore.Functions.GetPlayer(source)
    player.Functions.RemoveMoney(account, amount, reason)
end

function Framework:GetAmountOfMoney(source, account)
    local player = QBCore.Functions.GetPlayer(source)
    return player.Functions.GetMoney(account)
end

-- Return identifier, player name
-- The identifier is used for internal checking, the player name will be shown on the horse screen when betted on.
function Framework:GetPlayerInfo(source)

    local xPlayer = QBCore.Functions.GetPlayer(source)
    return xPlayer.PlayerData.citizenid, (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname)

    -- if(Config.Framework == "ESX") then
    --     local xPlayer = ESX.GetPlayerFromId(source)
    --     return xPlayer.identifier, xPlayer.name
    -- elseif(Config.Framework == "QBCore") then
    --     local xPlayer = QBCore.Functions.GetPlayer(source)
    --     return xPlayer.PlayerData.citizenid, (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname)
    -- elseif(Config.Framework == "Custom") then
    --     return source, "Player"
    -- end
end