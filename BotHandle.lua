repeat task.wait(.25) until game:IsLoaded()

Addprefix = '/'
local StartApiBot = {}

if syn then 
syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/02Dcs/Create-Own-Bot/main/BotHandle.lua", true))()') 
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
         table.insert(StartApiBot, speaker.Name)
		end
	end
end
			
function PredictUser(NameVariable)
    local Table = game.Players:GetChildren()
    for i,v in pairs (Table) do
        if string.find(string.lower(v.Name), string.lower(NameVariable)) then
	print(v.Name)
	end
    end
end
		
function Msg(b)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(b), "All")
end
		
if string.match(message,"^"..Addprefix..tostring(y)) then
			pcall(callback) ;v = y
			msg = message
		end
	end)
end

