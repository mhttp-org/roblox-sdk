local args = {...};

local model = fs.read(args[1], "rbxmx"):GetChildren();
local portal = model[1];

local scripts = portal:FindFirstChild("Scripts"):FindFirstChild("BootstrapLocalScripts");

scripts:FindFirstChild("ConfigurePortalAttributes"):FindFirstChild("PortalReference").Value = portal;
scripts:FindFirstChild("TpIntentDetection"):FindFirstChild("PortalReference").Value = portal;

fs.write(args[1], model, "rbxmx");