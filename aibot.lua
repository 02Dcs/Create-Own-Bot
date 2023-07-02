local aibot = {}
local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

local rp = game:GetService('ReplicatedStorage')

repeat game:IsLoaded() until task.wait(1)

function notification(e)	
	if e then
		Notify({
			Description = "Ai-Bot Control";
			Title = "V1.2";
			Duration = 5;
		});
	else 
		print('...')
	end
end

function createmsg(v)
	pcall(function()
		if not rp:FindFirstChild('DefaultChatSystemChatEvents') then
			local g = game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(v)
			g:SetExtraData("BubbleChatEnabled", false)
		else 
			rp:FindFirstChild('DefaultChatSystemChatEvents').SayMessageRequest:FireServer(tostring(v), "All");
		end
	end)
end

local settingsl = {
	prefix = '$',
	wht = {},
}; __index = settingsl;

function changeprefix(x)
	string.gsub(settingsl.prefix, settingsl.prefix, x);
end

function add(b)
	table.insert(settingsl.wht, b); table.sort(settingsl.wht)
end

local predict
function aibot:addcommand(c, enable, user, callback, ...)
	for d, z in pairs(game.Players:GetChildren()) do
		local callback = callback or function() end
		local args = {...}
		z.Chatted:connect(function(args)
			if #args > 0 then
				predict = args
				if args:match(settingsl.prefix .. tostring(c)) then
					if not enable then
						--table.insert(wht, user);
						if user == 'whitelist' or user == 'wht' then
							if table.find(settingsl.wht, z.Name) then
								pcall(callback)	
							end
						end
					else 
						if user == 'everyone' or user == 'all' then
							local xa = tostring(string.split(args," ")[2])
							pcall(callback); 

						end
					end
				end
			end
		end)
	end
end

return aibot
