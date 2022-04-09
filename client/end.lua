local function GetFramework(framework)
    if(framework ~= nil and framework ~= '') then
        local localFramework = {}
        dofile(GetResourcePath(GetCurrentResourceName()) .. '/client/frameworks/' .. framework .. '.lua')
        return localFramework
    end

    return Framework
end
exports("GetFramework", GetFramework)