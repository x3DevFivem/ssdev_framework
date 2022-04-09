function Framework:HasEnoughMoney(source, account, amount)
    return Framework:GetAmountOfMoney(source, account) >= amount
end

function Framework:BanPlayer(source, reason)
    reason = (reason or "You have been banned for an unknown reason")
    DropPlayer(source, reason)
    -- exports["sabs"]:banPlayer(source, reason)
end