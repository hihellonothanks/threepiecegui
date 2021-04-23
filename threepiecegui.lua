-- https ://xheptcofficial.gitbook.io/kavo-library/

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Three Piece", "DarkTheme")

local Tab = Window:NewTab("Main")

local Section = Tab:NewSection("Autofarm")

local VUser = game:GetService('VirtualUser') 

local Plr = game:GetService("Players").LocalPlayer

local child = game.Players.LocalPlayer.Backpack:GetChildren()

local toolname = nil

local fruitt = Plr.DFStats.DFUse
local fruittt = Plr.DFStats.DFUse.Value

local ds = {}
    for i,v in pairs(child) do
       table.insert(ds, v.Name)
    end
Section:NewDropdown("Select Tool", "DropdownInf", ds, function(currentOption)
    toolname = currentOption
end)

_G.autoequip = nil
Section:NewToggle("Auto Equip Tools", "ToggleInfo", function(state)
    if state then
        _G.autoequip = true
while _G.autoequip do
    wait()
    pcall(function()
        if Plr.Backpack:FindFirstChild(toolname) and Plr.Character:FindFirstChild(toolname) == nil then
            local tool = Plr.Backpack:FindFirstChild(toolname)
            Plr.Character.Humanoid:EquipTool(tool)
        end
    end)
end
    else
        _G.autoequip = false
    end
end)

Section:NewToggle("Auto Attack", "ToggleInfo", function(state)
    _G.autoattack = nil
    if state then
_G.autoattack = true
    else
_G.autoattack = false
    end
    
    while _G.autoattack do
wait(0.15)
VUser:Button1Down(Vector2.new(math.huge,math.huge));
VUser:Button1Up(Vector2.new(math.huge,math.huge));
end
end)

Section:NewToggle("Auto Z Skill", "ToggleInfo", function(state3)
    if state3 then
_G.autozskill = true
    else
_G.autozskill = false
    end
    
        while _G.autozskill do
            wait(0.8)
            if(Plr ~= nil) then
                if(Plr.Character ~= nil) then
Plr.Character[fruittt].SkillZ.Fire:FireServer()
end
end
end
    end)

Section:NewToggle("Auto X Skill", "ToggleInfo", function(state3)
    if state3 then
_G.autoxskill = true
    else
_G.autoxskill = false
    end
    
        while _G.autoxskill do
            wait(0.8)
            if(Plr ~= nil) then
                if(Plr.Character ~= nil) then
Plr.Character[fruittt].SkillX.Fire:FireServer()
end
end
end
    end)

Section:NewToggle("Auto C Skill", "ToggleInfo", function(state3)
    if state3 then
_G.autocskill = true
    else
_G.autocskill = false
    end
    
        while _G.autocskill do
                wait(4)
            if(Plr ~= nil) then
                if(Plr.Character ~= nil) then
Plr.Character[fruittt].SkillC.Fire:FireServer()
end
end
end
end)

Section:NewToggle("Auto V Skill", "ToggleInfo", function(state3)
    if state3 then
_G.autovskill = true
    else
_G.autovskill = false
    end
    
        while _G.autoxskill do
            wait(0.8)
            if(Plr ~= nil) then
                if(Plr.Character ~= nil) then
Plr.Character[fruittt].SkillV.Fire:FireServer()
end
end
end
    end)

local target = nil
Section:NewDropdown("Select Target", "DropdownInf", {
    "WhiteBeard",
    "Akainub",
    "God Lightning",
    "Fuji",
    "BaconClown",
    "Enelu",
    "KizaWick",
    "SeaBeast"
}, function(currentOption)
    print(currentOption)
    target = currentOption
end)



_G.tping = nil
Section:NewToggle("Autofarm Target", "ToggleInfo", function(state2)
if state2 then
    _G.tping = true
    else
    _G.tping = false
end
    while _G.tping do wait()
            Plr.Character.Humanoid:ChangeState(11)
    for _,v in pairs(game.Workspace:GetDescendants()) do
  if string.find(v.Name, target) and v:FindFirstChild("HumanoidRootPart") ~= nil then
      if v:FindFirstChild("Humanoid").Health > 0 then
      Plr.Character:WaitForChild("HumanoidRootPart").CFrame = v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 0, 5)
      end
  end
    end
    end
end)

local Tab = Window:NewTab("Other")

local Section = Tab:NewSection("Other")

Section:NewButton("Buy Random Fruit (1.5m)", "Buys a random fruit.", function()
    fireclickdetector(game:GetService("Workspace")["Random fruit"].FruitSeller.ClickPart.ClickDetector)
end)

Section:NewButton("Get Mink", "Gets Mink race.", function()
fireclickdetector(game:GetService("Workspace").Carrot.ClickPart.ClickDetector)
end)

Section:NewButton("Get EXP", "Gets EXP", function()
        while wait() do
 game:GetService("ReplicatedStorage").AddExpRe:FireServer()
end
        end)
