--local TeleportService = game:GetService('TeleportService');
--local StarterGui = game:GetService("StarterGui");

--local portal = script.Parent.Parent;
--local portalTrigger = portal:FindFirstChild("Trigger", false);
--local configuration = portal.Configuration;
--local titleLabel = portal:FindFirstChild("TitleLabel", true);


--local portalJson = portal:GetAttribute("json");

--local titleText = configuration.Title.Value;
--titleLabel.Text = titleText;

--local destinationPlaceIdRef = configuration.Destination.PlaceId;


--local teleportingPlayersDebounce = {};

--portalTrigger.Touched:Connect(function (otherPart)
--	local partParent = otherPart.Parent;

--	local humanoid = partParent:FindFirstChildWhichIsA("Humanoid");
--	if humanoid then
--		local player = game.Players:GetPlayerFromCharacter(partParent);
--		local teleportData = nil;

--		if teleportingPlayersDebounce[player] then
--			return;
--		end

--		portal.Events.Teleport:FireClient(player);

--		TeleportService:TeleportAsync(
--			destinationPlaceIdRef.Value,
--			{ player }
--		);

--		teleportingPlayersDebounce[player] = true;

--		task.delay(
--			8,
--			function() 
--				teleportingPlayersDebounce[player] = false;
--			end
--		);

--	end
--end)
