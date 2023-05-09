-- This is a portal that teleport players who step in it to a different roblox place

-- 1. Configuration
--   1.1. Destination:
--        Change the value under "Portal > Configuration > Destination > PlaceId" 
--        to change the place this portal will teleport to
--   1.2. Portal Title:
--        Chnage the value under "Portal > Configuration > Title" to change the
--        displayed title of the portal, leave blank to not show any title
--        the title won't be changed in the editor, but you can preview it after you press the "Play" button

-- 2. Look and Feels
--   2.1. Portal Mesh/Model
--        Change the Mesh to a different mesh of you choice, and adjust the 
--        size of the "Trigger" to match your new mesh
--   2.2. Loading Screen
--        Change the content of the ScreenGui under the "LoadingScreens" folder

-- 3. Common Gotcha
--   3.1. The destination place must allows others/3rd party to 
--        teleport in, specifically through the "TeleportService".
--        The destination place can change the setting in
--        "File > Game Settings > Security > Allow Third Party Teleports"
--        see https://create.roblox.com/docs/mechanics/teleporting-between-places#enabling-cross-experience-teleportation
--        for details
--   3.2. Teleporte does not works in roblox studio, and will display an error