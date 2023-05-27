# yavzu-multiverse
Fivem Multiverse script

[yavzu.space](https://yavzu.space/)

if you are using config.debug == true you can use chat commands.

Create New Universe Event
TriggerServerEvent("Multiverse:Create", verseId, setCoords, coords)

Join any universe Event
TriggerServerEvent("Multiverse:Join", verseId, setCoords, coords)

Leave and back to main universe Event
TriggerServerEvent("Multiverse:Leave", joinedVerseId, setCoords, coords)

verseId = int
setCoords = boolen
coords = x,y,z,h


