--- >> Create Bot << ---

-- >> Handle 
loadstring(game:HttpGet("https://raw.githubusercontent.com/02Dcs/Create-Own-Bot/main/api.lua", true))()

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
addcommand("chat", true, 'everyone', function()
createmsg('test')
end)

-- >> addCommand
addcommand("command", true, 'everyone', function()
print('hello!')
end)

-- >> Whitelist
add('User1'); add('User2');

addcommand('whitelist', false, 'whitelist', function()
createmsg('hi whitelist user!')
end)

-- >> PredictUser
addcommand("predict", true, 'everyone', function() -- Handle
createmsg('We found: ' .. addpredict('player', 2)) -- addpredict('variable', 2))
end)

-- More Coming Soon!
