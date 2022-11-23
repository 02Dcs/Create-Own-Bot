
local ChatBotApi = {}

local Prefix = {"PrefixCmd"}
local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");
local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering");

local prefix; local msg;

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

function ChatBotApi.P(String)
local properties = {}
for _, v in pairs(Prefix) do 
properties[v] = String[v]
prefix = String; print("Changed Prefix " .. "[" .. prefix .. "]")
         
if String ~= nil then
function Msg(m) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(m), "All") end
function AddCmd(y, cl) local cl = cl or function() end  onMessageDoneFiltering.OnClientEvent:Connect(function(messageData)local speaker, message = players[messageData.FromSpeaker], messageData.Message if string.match(message,"^"..prefix..tostring(y)) then pcall(cl) ; v = y msg = message;  end end) end end end
end
