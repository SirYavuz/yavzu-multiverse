local isJoined = false
local joinedVerseId = nil

RegisterCommand("multiverse-create", function(source, args, rawCommand)
    if config.debug then 
        if not isJoined then 
            local verseId = tonumber(args[1])
            local setCoords = false
            local coords = args[3]
            if verseId ~= nil then 
                TriggerServerEvent("Multiverse:Create", verseId, setCoords, coords)
            else 
                print("^1[Multiverse]^0 Invalid arguments")
            end
        else 
            debug("You are already in a verse")
        end
    end
end)

RegisterCommand("multiverse-join", function(source, args, rawCommand)
    if config.debug then 
        if not isJoined then 
            local verseId = tonumber(args[1])
            local setCoords = false
            local coords = args[3]
            if verseId ~= nil then 
                TriggerServerEvent("Multiverse:Join", verseId, setCoords, coords)
            else 
                print("^1[Multiverse]^0 Invalid arguments")
            end
        else 
            debug("You are already in a verse")
        end
    end
end)

RegisterCommand("multiverse-leave", function(source, args, rawCommand)
    if config.debug then 
        if isJoined then 
            debug("triggered server leave event")
            TriggerServerEvent("Multiverse:Leave", joinedVerseId, setCoords, coords)
        else 
            debug("You are not in a verse")
        end
    end
end)

RegisterNetEvent("Multiverse:SetCoords", function(coords)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
    SetEntityHeading(PlayerPedId(), coords.h) 
end)

function debug(msg)
    if config.debug then 
        print("^1[Multiverse]^0 "..msg.."	")
    end
end

RegisterNetEvent("Multiverse:SetJoinData", function(data, verseId)
    isJoined = data
    joinedVerseId = verseId
end)

AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    TriggerServerEvent("Multiverse:goMainVerseFromClient", verseId, 0)
    print("Multiverse started")
end)