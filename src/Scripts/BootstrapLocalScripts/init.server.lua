local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");
local StarterPlayer = game:GetService("StarterPlayer");
local CollectionService = game:GetService("CollectionService");
local portal = script.Parent.Parent;

local rootFolderName = "PortalClient";


local rootFolder = StarterPlayer.StarterCharacterScripts:FindFirstChild(rootFolderName);
local idCounter;
if rootFolder == nil then
	rootFolder = Instance.new("Folder");
	rootFolder.Name = rootFolderName;
	rootFolder.Parent = StarterPlayer.StarterCharacterScripts;
	rootFolder:SetAttribute("IDCounter", 0);
end

local currentId = rootFolder:GetAttribute("IDCounter") + 1;
rootFolder:SetAttribute("IDCounter", currentId);

local folder = Instance.new("Folder");
folder.Name = currentId;
folder.Parent = rootFolder;

for _, localObject in ipairs(script:getChildren()) do
	--local shouldClone = (
	--	(not localObject:GetAttribute("IsSingleton")) or
	--	(folder:FindFirstChild(localObject.Name) == nil)
	--);
	if true then
		local newObj = localObject:Clone();
		newObj.Parent = folder;
		if newObj.ClassName == "LocalScript" then
			newObj.Disabled = false;
			newObj:WaitForChild("PortalReference").Value = portal;
		end
	end
end

local connection;
connection = Workspace.DescendantRemoving:Connect(function(part) 
	if (portal == part) then
		folder:Destroy();
		connection:Disconnect();
		
		for _, player in Players:GetChildren() do
			if not player:IsA("Player") then
				continue
			end
			
			player.Character:FindFirstChild(rootFolderName):FindFirstChild(currentId):Destroy();
		end
	end
end);
