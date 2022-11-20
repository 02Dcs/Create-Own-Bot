--- >> Create Bot << ---

-- >> Handle 
loadstring(game:HttpGet("https://raw.githubusercontent.com/02Dcs/Create-Own-Bot/main/BotHandle.lua", true))()

-- >> Costum prefix
Addprefix = '/'

-- >> WhitelistSym
AddWhitelist = {
Whitelist = true,
'PlayerNameHere',
}

-- >> MsgChat
addCommand("say", function()
Msg("test")
end)

-- >> addCommand
addCommand("test", function()
print("a")
end)

-- >> PredictUser
addCommand("to", function() -- Command: test
maxsplit = 2; -- Spilt The Msg
local Args = PredictUser(tostring(string.split(msg," ")[maxsplit])); -- Handle
print(Args) -- Prints player name!
end)


-- More Coming Soon!
