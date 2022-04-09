if(FrameworkLoader:IsFrameworkLoaded("qb-core")) then return end

QBCore = FrameworkLoader:GetCoreObject()

function Framework:TriggerServerCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb, ...)
end

function Framework:NotifyPlayer(title, message, color, icon)
    QBCore.Functions.Notify(title .. ": " .. message, (color == "green" and "success" or "error"))
end