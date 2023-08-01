local function setupScript()
    local function notification(e)    
        if e then
            -- Make sure AkaliNotif is loaded before using Notify
            local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
            local Notify = AkaliNotif.Notify

            Notify({
                Description = "Ai-Bot Control",
                Title = "V1.2",
                Duration = 5,
            })
        else 
            return nil
        end
    end

    local rp = game:GetService('ReplicatedStorage')

    repeat game:IsLoaded() until task.wait(1)

    local function createmsg(v)
        pcall(function()
            if not rp:FindFirstChild('DefaultChatSystemChatEvents') then
                local g = game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(v)
                g:SetExtraData("BubbleChatEnabled", false)
            else 
                rp:FindFirstChild('DefaultChatSystemChatEvents').SayMessageRequest:FireServer(tostring(v), "All")
            end
        end)
    end

    local settingsl = {
        prefix = '$',
        wht = {},
    }
    __index = settingsl

    local function changeprefix(x)
        settingsl.prefix = x
        return
    end

    local function add(b)
        table.insert(settingsl.wht, b)
        table.sort(settingsl.wht)
    end

    local predict
    local function addcommand(c, enable, user, callback, ...)
        for d, z in pairs(game.Players:GetChildren()) do
            local callback = callback or function() end
            local args = {...}
            z.Chatted:Connect(function(args)
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
                                local xa = tostring(string.split(args, " ")[2])
                                pcall(callback) 
                            end
                        end
                    end
                end
            end)
        end
    end

    local function b(x)
        for i, j in pairs(game.Players:GetChildren()) do
            if string.find(string.lower(j.Name), string.lower(x)) then
                return j.Name
            elseif string.find(string.lower(j.DisplayName), string.lower(x)) then
                return j.Name
            end
        end
    end

    local function addpredict(ch, num)
        if ch == 'variable' or ch == 'vr' then
            return tostring(string.split(predict, " ")[num])
        elseif ch == 'player' or ch == 'plr' then
            return b(tostring(string.split(predict, " ")[num]))
        end
    end

    return {
        notification = notification,
        changeprefix = changeprefix,
        add = add,
        addcommand = addcommand,
        b = b,
        addpredict = addpredict,
    }
end

local scriptFunctions = setupScript()

scriptFunctions.notification(true)
