--[[
	   _____      __    _             _     __   _    _____ 
  / ___/_____/ /_  (_)___  ____  (_)___/ /  | |  / /__ \
  \__ \/ ___/ __ \/ /_  / / __ \/ / __  /   | | / /__/ /
 ___/ / /__/ / / / / / /_/ /_/ / / /_/ /    | |/ // __/ 
/____/\___/_/ /_/_/ /___/\____/_/\__,_/     |___//____/ 
                                                        
]]

--// Schizoid v2. Version: 2.0.3. This project is a remake of an old project I made back in June that had pretty bad code.
--// Credits to: Catto (for the anti-fling), gui2lua
--// Game load shit
repeat task.wait() until game:IsLoaded()

if not isfolder("Schizoid") then makefolder("Schizoid") end
--// Bot stuff
local bots = {"Name1"} -- Add your bots' usernames here. Would it be a better idea to use ID though?
local botPrefix = ">" -- You can execute bot commands through the console, chat or a GUI (Maybe I won't add it). IMO, the best option for executing bot commands is the console.. Or the chat if you want to flex it. 
local managerUserId = 0000000 -- Your userid; should I add multiple managers support?
local managerName = "CryptX" -- Your Roblox username
local botCommands = {}
local addPrefix = false
local defaultBotMessagePrefix = "[CryptEcks] " -- This message will appear at the start of your messages.

--// Services
local playerService = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

--// Variables n other stuff
local player = playerService.LocalPlayer

function findPlayer(player)
    local p = nil
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            local w = v.DisplayName
            if string.sub(player, 1, 1) == "@" then w = v.Name end
            
            local filtered = player
            filtered = string.gsub(filtered, "@", "")
            
            if string.sub(w:lower(), 1, #filtered) == filtered:lower() then
                p = v
            end
        end
    end
    return p
end

function chatBots(msg)
	if addPrefix then
		replicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(defaultBotMessagePrefix..msg, "All")
	else
		replicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
	end
end

--// Anti-fling
task.spawn(function() -- Made by Catto
    while true do
        for _, x in next, game:GetService("Players"):GetPlayers() do
            if x and x ~= game:GetService("Players").LocalPlayer and x.Character then
                pcall(
                    function()
                        for _, v in next, x.Character:GetDescendants() do
                            if v:IsA("BasePart") or v:IsA("MeshPart") and v.CanCollide then
                                v.CanCollide = false
                                if v.Name == "Torso" then
                                    v.Massless = true
                                end
                                v.Velocity = Vector3.new()
                                v.RotVelocity = Vector3.new()
                            end
                        end
                    end
                )
            end
        end
        game:GetService("RunService").Stepped:Wait()
    end
end)

--// Commands
botCommands.rejoin = function(args)
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end

botCommands.bring = function(args)
	player.Character.HumanoidRootPart.CFrame = playerService[managerName].Character.HumanoidRootPart.CFrame
end

local insults = {"ur a poopy head!", "is dumb", "is a noob XD", "is a dingus", "you're bonkers lad", "you're bad at this game", "so bad LOL", "touch grass"}

botCommands.insult = function(args)
	
end

local compliments = {"you're cute", "wow ur cool", "so cool", "is very cool", "i really like him", "is the coolest", "is pretty cool ngl"}

botCommands.compliment = function(args)
end

local randomSentences = {""}

botCommands.accountage = function(args)
	chatBots("Bot account age: "..player.AccountAge)
end

botCommands.saveaudio = function(args) --// saveaudio name id
	writefile("Schizoid//"..tostring(args[1])..".txt", tostring(args[2]))
end

botCommands.playaudio = function(args) --// playaudio name
	for _,v in next, player.Character:GetChildren() do
		if v.Name == "BoomBox" then
			v.Remote:FireServer(readfile("Schizoid//"..tostring(args[1])..".txt"))
		end
	end
end

botCommands.runscript = function(args)
	if loadfile then loadfile(tostring(args[1]))() end
end

botCommands.wave = function(args)
	chatBots("/e wave")
end

botCommands.shutdown = function(args)
	game:Shutdown()
end

botCommands.dance = function(args)
	chatBots("/e dance")
end

botCommands.floodchat = function(args)
	for i = 1, 5 do
		chatBots("ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
	end
end

botCommands.insane = function(args)
	insaneanim = Instance.new("Animation")
	insaneanim.AnimationId = "rbxassetid://33796059"
	insane = player.Character.Humanoid:LoadAnimation(insaneanim)
	insane:Play()
	insane:AdjustSpeed(99)
end

local banging = false

botCommands.bang = function(args)
	local target = findPlayer(tostring(args[1]))
	banganim = Instance.new("Animation")
	banganim.AnimationId = "rbxassetid://148840371"
	bang = player.Character.Humanoid:LoadAnimation(banganim)
	bang:AdjustSpeed(2)
	if banging == false then
		banging = true
		bang:Play()
		task.spawn(function()
			while banging == true do
				player.Character.HumanoidRootPart.CFrame = playerService[target.Name].Character.HumanoidRootPart.CFrame
				task.wait()
			end
		end)
	else
		banging = false
		bang:Stop()
		banganim:Destroy()
		player.Character.Humanoid.Health = 0
	end
end

botCommands.walkspeed = function(args)
	player.Character.Humanoid.WalkSpeed = tonumber(args[1])
end

botCommands.re = function(args)
	player.Character.Humanoid.Health = 0
end

botCommands.to = function(args)
	local target = findPlayer(tostring(args[1]))
	if player.Character and target then
		player.Character.HumanoidRootPart.CFrame = playerService[target.Name].Character.HumanoidRootPart.CFrame
	end
end

botCommands.removearms = function(args)
	if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
		for i,v in next, player.Character:GetChildren() do
			if v.Name == "RightUpperArm" or v.Name == "RightUpperArm" then v:Destroy() end
		end
	else
		for i,v in next, player.Character:GetChildren() do
			if v.Name == "Right Arm" or v.Name == "Left Arm" then v:Destroy() end
		end
	end
end

botCommands.removelegs = function(args)
	if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
		for i,v in next, player.Character:GetChildren() do
			if v.Name == "RightUpperLeg" or v.Name == "LeftUpperLeg" then v:Destroy() end
		end
	else
		for i,v in next, player.Character:GetChildren() do
			if v.Name == "Right Leg" or v.Name == "Left Leg" then v:Destroy() end
		end
	end
end

botCommands.sit = function(args)
	if player.Character.Humanoid.Sit == false then
		player.Character.Humanoid.Sit = true
	else
		player.Character.Humanoid.Sit = false
	end
end

local following = false

botCommands.tpfollow = function(args)
	local target = findPlayer(tostring(args[1]))
	if following == false and target and player.Character then
		following = true
		task.spawn(function()
			while following == true do
				player.Character.HumanoidRootPart.CFrame = playerService[target.Name].Character.HumanoidRootPart.CFrame
				task.wait()
			end
		end)
	else
		following = false
	end
end

local walkfollow = false

botCommands.walkfollow = function(args)
	local target = findPlayer(tostring(args[1]))
	if walkfollow == false and target and player.Character then
		walkfollow = true
		task.spawn(function()
			while walkfollow == true do
				player.Character.Humanoid.WalkToPoint = playerService[target.Name].Character.HumanoidRootPart.Position
				task.wait()
			end
		end)
	else
		walkfollow = false
	end
end


local copying = false
botCommands.copychat = function(args)
	local target = findPlayer(tostring(args[1]))
	if copying == false and target then
		copying = true
		if copying == true then
			playerService[target.Name].Chatted:Connect(function(msg)
				chatBots(msg)
			end)
		end
	else
		copying = false
	end
end

botCommands.jump = function(args)
	game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
end

--// Bots

if table.find(bots, player.Name) then
	loadstring(game:HttpGet("https://pastebin.com/raw/sgCFtrnU"))(); setfpscap(10) -- Performance
	--// Anti afk
	repeat
		task.wait()
	until game:IsLoaded()
	task.wait()
	
	if getconnections then
		for _, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
			v:Disable()
		end
	end
	
	if not getconnections then
		game:GetService("Players").LocalPlayer.Idled:connect(
			function()
				game:GetService("VirtualUser"):ClickButton2(Vector2.new())
			end
		)
	end
	
	for _,v in next, playerService:GetPlayers() do
		if v.UserId == managerUserId then
			v.Chatted:Connect(function(msg)
				local split = msg:split(" ")
				local slash = split[1]
				local cmd = slash:split(botPrefix)
				local cmdname = cmd[2]

				if botCommands[cmdname] then
					local args = {}
					for i = 2, #split, 1 do
						table.insert(args, split[i])
					end
					botCommands[cmdname](args)
				end
			end)
		end
	end
end
