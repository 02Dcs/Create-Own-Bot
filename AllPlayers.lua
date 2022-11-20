local function PredictUser(shortName)
	shortName = string.lower(shortName)
	for _,Player in pairs(game.Players:GetPlayers()) do
		local playerName = string.lower(Player.Name)
		if string.match(playerName, "^"..shortName) then
		    print(Player);
		   return Player
		end
	end
end
