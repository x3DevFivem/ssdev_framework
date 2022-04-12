local loggingLevels = {
    [0] = "^8[ERROR]^7",
    [1] = "^3[WARNING]^7",
    [2] = "^7[INFO]^7",
    [3] = "^2[DEBUG]^7",
    [4] = "^9[TRACE]^7"
}

Logger = {
    Prefix = '[' .. GetCurrentResourceName() .. '] ',
    Level = 3
}

function Logger:Info(message)
    if(Logger.Level >= 2) then
        print(Logger.Prefix .. loggingLevels[2] .. ": " .. message)
    end
end

function Logger:Debug(message)
    if(Logger.Level >= 3) then
        print(Logger.Prefix .. loggingLevels[3] .. ": " .. message)
    end
end

function Logger:Error(message)
    if(Logger.Level >= 0) then
        print(Logger.Prefix .. loggingLevels[0] .. ": " .. message)
    end
end

function Logger:Warning(message)
    if(Logger.Level >= 1) then
        print(Logger.Prefix .. loggingLevels[1] .. ": " .. message)
    end
end

function Logger:Trace(message)
    if(Logger.Level >= 4) then
        print(Logger.Prefix .. loggingLevels[4] .. ": " .. message)
    end
end

exports("GetLogger", function (prefix, level)
    local logger = Logger
    logger.Prefix = (prefix or Logger.Prefix) .. ' '
    logger.Level = level or Logger.level

    return logger
end)