local Maid = {
    Connections = {}
}

Maid.AddConnection = function(Specific, Type, Callback)
    local Connection = Type:Connect(Callback)

    Specific = Specific or #Maid.Connections + 1
    Maid.Connections[Specific] = Connection
    
    return Connection
end

Maid.DelConnection = function(Specific)
    Maid.Connections[Specific]:Disconnect()
end

Maid.DisconnectAll = function()
    for Idx, Val in pairs(Maid.Connections) do
        Val:Disconnect()
    end
end

return Maid