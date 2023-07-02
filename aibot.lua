local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

local rp = game:GetService('ReplicatedStorage')

repeat game:IsLoaded() until task.wait(1)

local function notification(e)	
	if e then
		Notify({
			Description = "Ai-Bot Control";
			Title = "V1.2";
			Duration = 5;
		});
	else 
		return nil;
	end
end

local function createmsg(v)
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

local function changeprefix(x)
	return string.gsub(settingsl.prefix, settingsl.prefix, x);
end

local function add(b)
	table.insert(settingsl.wht, b); table.sort(settingsl.wht)
end

local predict
local function addcommand(c, enable, user, callback, ...)
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

local function b(x)
	for x, j in pairs (game.Players:GetChildren()) do
		if string.find(string.lower(x.Name), string.lower(x)) and string.find(string.lower(x.DisplayName) then
			return x.Name
		elseif string.find(string.lower(x.DisplayName), string.lower(x)) then
			return x.Name
		end
	end
end

local function addpredict(ch, num)
	if ch == 'variable' or ch == 'vr' then
		return tostring(string.split(predict," ")[num]);
	elseif ch == 'player' or ch == 'plr' then
		return b(tostring(string.split(predict," ")[num]));
	end
end

local function addplayer(num)
	return tostring(string.split(predict," ")[num]);
end
