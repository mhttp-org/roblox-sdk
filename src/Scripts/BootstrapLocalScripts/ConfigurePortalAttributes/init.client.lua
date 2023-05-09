local runService = game:GetService("RunService");
local PlayersService = game:GetService("Players");
local LocalPlayer = PlayersService.LocalPlayer;
local portal = script:WaitForChild("PortalReference").Value;
local configuration = portal.Configuration;

local titlePart = portal:WaitForChild("Title");

local playerCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();

local titleText = configuration.Title;

titlePart:WaitForChild("SurfaceGui"):WaitForChild("TitleLabel").Text = titleText;
