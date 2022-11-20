repeat task.wait(.25) until game:IsLoaded()

Addprefix = '/'
local StartApiBot = {}

local function PredictUser(shortName, callback)
	local callback = callback or function() end
	shortName = string.lower(shortName)
	for _,Player in pairs(game.Players:GetPlayers()) do
		local playerName = string.lower(Player.Name)
		if string.match(playerName, "^"..shortName) then
		    print(Player);
		   pcall(callback)
		   return Player
		end
	end
end

local msg
local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");
local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering");

function addCommand(y, callback)
local callback = callback or function() end
onMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
local speaker, message = players[messageData.FromSpeaker], messageData.Message
		
if AddWhitelist.Whitelist == true then 
		for z, K in pairs(AddWhitelist) do 
			if speaker.Name == K then 
			print('')
		end
	end
end
		

function Msg(b)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(b), "All")
end
		
if string.match(message,"^"..Addprefix..tostring(y)) then
			pcall(callback) ;v = y
			msg = message
			local PredictUser = PredictUser(tostring(string.split(msg," ")[maxsplit]))
		end
	end)
end
