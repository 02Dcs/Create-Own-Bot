repeat task.wait(.25) until game:IsLoaded()

Addprefix = '/'
local StartApiBot = {}

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
		end
	end
end
		

function Msg(b)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(b), "All")
end
		
if string.match(message,"^"..Addprefix..tostring(y)) then
			pcall(callback) ;v = y
			msg = message
			--local PredictUser = PredictUser(tostring(string.split(msg," ")[2]))
		end
	end)
end

user;
function PredictUser(NameVariable)
    local Table = game.Players:GetChildren()
    for i,v in pairs (Table) do
        if string.find(string.lower(v.Name), string.lower(NameVariable)) then
	      --print(v.Name)
        elseif string.find(string.lower(v.DisplayName), string.lower(NameVariable)) then
             --print(v.Name)
	     user = v.Name
        end
    end
end
