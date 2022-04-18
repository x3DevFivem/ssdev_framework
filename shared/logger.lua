local loggingLevels = {
    [0] = "^8[ERROR]^7",
    [1] = "^3[WARNING]^7",
    [2] = "^7[INFO]^7",
    [3] = "^2[DEBUG]^7",
    [4] = "^9[TRACE]^7"
}

Logger = {
    Create = function(prefix, level)
        local self = {
            Prefix = '[' .. prefix .. '] ',
            Level = level
        }

        function self:Info(message)
            if(self.Level >= 2) then
                print(self.Prefix .. loggingLevels[2] .. ": " .. message)
            end
        end

        function self:Debug(message)
            if(self.Level >= 3) then
                print(self.Prefix .. loggingLevels[3] .. ": " .. message)
            end
        end

        function self:Error(message)
            if(self.Level >= 0) then
                print(self.Prefix .. loggingLevels[0] .. ": " .. message)
            end
        end

        function self:Warning(message)
            if(self.Level >= 1) then
                print(self.Prefix .. loggingLevels[1] .. ": " .. message)
            end
        end

        function self:Trace(message)
            if(self.Level >= 4) then
                print(self.Prefix .. loggingLevels[4] .. ": " .. message)
            end
        end

        return self
    end
}

exports("GetLogger", function (prefix, level)
    local logger = Logger.Create(prefix, level)
    return logger
end)