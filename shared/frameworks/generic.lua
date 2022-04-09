function Framework:GetRandomString(length)
    local chars = {}
    for i = 1, length do
        table.insert(chars, string.char(math.random(65, 90)))
    end

    return table.concat(chars)
end