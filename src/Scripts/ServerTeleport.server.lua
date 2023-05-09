local runService = game:GetService("RunService");
local TeleportService = game:GetService('TeleportService');
local StarterGui = game:GetService("StarterGui");

local portal = script.Parent.Parent;
local portalTrigger = portal:FindFirstChild("Trigger", false);
local configuration = portal.Configuration;
local titleLabel = portal:FindFirstChild("TitleLabel", true);


local portalJson = portal:GetAttribute("json");

local titleText = configuration.Title.Value;
titleLabel.Text = titleText;

local destinationPlaceIdRef = configuration.Destination.PlaceId;


local Events = portal:WaitForChild("Events");

local overlapParams = OverlapParams.new();
overlapParams.FilterType = Enum.RaycastFilterType.Whitelist;
overlapParams.FilterDescendantsInstances = { portalTrigger };

Events.Teleport.OnServerEvent:Connect(function(player)
	local playerCFrame, playerSize = player.Character:GetBoundingBox();
	local velocity = player.Character.HumanoidRootPart.Velocity;
	local delay = player:GetNetworkPing() + 0.200;
	local scaledCFrame = CFrame.new(playerCFrame.Position + velocity * delay, playerCFrame.LookVector);

	local localVelocity = scaledCFrame:vectorToObjectSpace(player.Character.PrimaryPart.Velocity);
	local graceSize = Vector3.new(
		math.max(math.abs(localVelocity.x) / portalTrigger.Size.x, 1),
		math.max(math.abs(localVelocity.y) / portalTrigger.Size.y, 1),
		math.max(math.abs(localVelocity.z) / portalTrigger.Size.z, 1)
	);

	local overlap = workspace:GetPartBoundsInBox(
		scaledCFrame,
		playerSize * graceSize,
		overlapParams
	);
	if next(overlap) ~= nil then
		TeleportService:TeleportAsync(
			destinationPlaceIdRef.Value,
			{ player }
		);
	else
		portal.Events.Teleport:FireClient(player, false);
	end
end);

