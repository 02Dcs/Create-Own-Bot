function PredictUser(NameVariable)
    local Table = game.Players:GetChildren()
    for i,v in pairs (Table) do
        if string.find(string.lower(v.Name), string.lower(NameVariable)) then
            return v.Name
        elseif string.find(string.lower(v.DisplayName), string.lower(NameVariable)) then
            return v.Name
        end
    end
end
