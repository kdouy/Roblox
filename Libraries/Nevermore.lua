local Nevermore = {
    Remotes = {}
}

for Index, Value in next, getgc(true) do
    if type(Value) == "table" and rawget(Value, "Remote") then
        Nevermore.Remotes[Value.Name] = Value.Remote
    end
end

function Nevermore:Get(Name)
    return Nevermore.Remotes[Name]
end

function Nevermore:Fire(Name, Args)
    Nevermore.Remotes[Name]:FireServer(Args)
end

function Nevermore:Invoke(Name, Args)
    Nevermore.Remotes[Name]:InvokeServer(Args)
end

return Nevermore