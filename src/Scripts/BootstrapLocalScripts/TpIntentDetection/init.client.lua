local TeleportService = game:GetService("TeleportService");
local ContentProvider = game:GetService("ContentProvider");
local LocalPlayer = game:GetService("Players").LocalPlayer;
local portal = script:WaitForChild("PortalReference").Value;
local portalTrigger = portal:FindFirstChild("Trigger", false);

local loadingScreen = nil;
local debouncing = false;

function loadLoadingScreen() 
	if (loadingScreen == nil) then 
		loadingScreen = portal.LoadingScreens.Start:Clone();
		local destinationScreen = portal.LoadingScreens.Destination:Clone();
		ContentProvider:PreloadAsync({ loadingScreen, destinationScreen });

		loadingScreen.Parent = LocalPlayer.PlayerGui;

		TeleportService.TeleportInitFailed:Once(function(player, teleportResult, errorMessage, placeId, teleportOptions)
			-- https://create.roblox.com/docs/reference/engine/classes/TeleportService#TeleportInitFailed
			-- this event does fire in client side
			loadingScreen:Destroy();
			loadingScreen = nil;
		end);

		TeleportService:SetTeleportGui(destinationScreen);
	end	
end

portalTrigger.Touched:Connect(function (otherPart)
	if debouncing then
		return nil;
	end
	
	local partParent = otherPart.Parent;

	local humanoid = partParent:FindFirstChildWhichIsA("Humanoid");
	if humanoid then
		local player = game.Players:GetPlayerFromCharacter(partParent);
		
		if otherPart == partParent.HumanoidRootPart then

			if player == LocalPlayer then

				loadLoadingScreen();

				portal.Events.Teleport:FireServer();
				debouncing = true;

				task.delay(
					4,
					function() 
						debouncing = false;
					end
				);
			end
			
		end
	end
end);
