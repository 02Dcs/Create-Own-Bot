--- >> Create Bot << ---

-- >> Handle 
local bot = loadstring(game:HttpGet("https://raw.githubusercontent.com/02Dcs/Create-Own-Bot/main/ai.lua", true))()

--[[
everyone/all = All Users!
whitelist/wht = Whitelist Users!
player/plr = Find Player!
variable/vr = Say The Index!
]]

-->> Notification
notification(false);
-- >> Costum prefix
changeprefix('$');

-- >> MsgChat
bot:addcommand("chat", true, 'everyone', function()
createmsg('test')
end)

-- >> addCommand
bot:addcommand("command", true, 'everyone', function()
print('hello!')
end)

-- >> Whitelist
add('User1'); add('User2');

bot:addcommand('whitelist', false, 'whitelist', function()
createmsg('hi whitelist user!')
end)

-- More Coming Soon!
