if(not FrameworkLoader:IsFrameworkLoaded("ox_inventory")) then return end

local oxInventory = FrameworkLoader:GetCoreObject("ox_inventory")

function Framework:CheckInventoryForItem(source, item, amount)
    amount = amount or 0
    return oxInventory:Search(source, "count", item) > amount
end

function Framework:RemoveItemFromInventory(source, item, amount)
    return oxInventory:RemoveItem(source, item, amount)
end

function Framework:AddItemToInventory(source, item, amount)
    return oxInventory:AddItem(source, item, amount)
end

function Framework:CanCarryItem(source, item, amount)
    return oxInventory:CanCarryItem(source, item, amount)
end

function Framework:GetItemInventoryInfo(source, item)
    return oxInventory:GetItem(source, item, nil, false)
end