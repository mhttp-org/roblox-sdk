<h1 align="center">mPortal</h1>

<h3 align="center">A battery included, customizable Roblox teleporter</h3>

<div align="center"><img src="./repo_resources/hero.gif" alt="example" /></div>

## Usage Instruction

### Installation
1. go to https://create.roblox.com/marketplace/asset/13345082484/m-Portal and click "GET MODEL", or search for "m Portal" on the roblox toolbox marketplace
1. drag the portal from the toolbox into the main window, if you alredy saved the model to your inventory in the previous step, you can find it in the inventory tab in the toolbox

### Configuration
1. drag/move the portal to your disired location
1. click on the portal, and in the "Explorer" window, you will see the "Configuration" folder
1. input the destination place id to the the `Value` property of "PlaceID", under the "Configuration" > "Destination" folder
    1. the destination is where this portal will leads to, for example, it could be your friend's game, or a different experience you created
    1. to find the place id, the easiest way is to find link of your game, e.g. `https://www.roblox.com/games/1818/Classic-Crossroads`, the number after "games/" (`1818` in this example) is the place id

### Why does my portal not work

1. if you are testing it in Roblox Stuido, the roblox teleport API isn't support. test it in Roblox instead.
1. make sure the user can normally go in the destination world. The portal respect the "Playability" permission of roblox, i.e. if the destination is "Private", only the developers of the destination game will be able to teleport.
1. if you are NOT the developer of the destination world, the destination must have "Allow Third Party Teleports" enabled in "Game Settings" > "Security"

## Local Development

This project use [rojo](https://github.com/rojo-rbx/rojo) to develop the roblox model, most component of the portal are in rojo's json representation. Since rojo [doesn't support Ref yet](https://github.com/rojo-rbx/rojo/issues/427), we use [rbxmk](https://github.com/Anaminus/rbxmk) to update the necessary object.

### build m-portal.rbxmx locally

1. download [rojo](https://github.com/rojo-rbx/rojo) and [rbxmk](https://github.com/Anaminus/rbxmk) and put both executable in `./bin` for convenience
1. run `.\bin\rojo.exe build . -o ./build/m-portal.rbxmx`
1. run `.\bin\rbxmk.exe run .\scripts\update_model_refs.lua .\build\m-portal.rbxmx`
