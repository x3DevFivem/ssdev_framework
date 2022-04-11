if(not FrameworkLoader:IsFrameworkLoaded("es_extended")) then return end

ESX = FrameworkLoader:GetCoreObject()

function Framework:TriggerServerCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb, ...)
end

function Framework:NotifyPlayer(title, message, color, icon)
    ESX.ShowAdvancedNotification(title, '', message, icon, color, 3)
end