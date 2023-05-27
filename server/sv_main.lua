Multiverses = {
    [0] = {
        playerCount = 1,
        isActive = true,
    }
}

RegisterServerEvent("Multiverse:Create", function(setCoords, coords)
    local src = source
    local verseId = getAvailabeVerse()
    if verseId ~= nil then 
        Multiverses[verseId] = {
            playerCount = 1,
            isActive = true
        }
        SetPlayerRoutingBucket(src, verseId);
        -- if setCoords then 
        --     TriggerClientEvent("Multiverse:SetCoords", src, coords)
        -- end
        debug("Verse created with id "..verseId)
        TriggerClientEvent("Multiverse:SetJoinData", src, true, verseId)
    else 
        debug("No available verses")
    end
end)

RegisterServerEvent("Multiverse:Join", function(verseId, setCoords, coords)
    local src = source
    print(json.encode(Multiverses))
    if Multiverses[verseId] ~= nil and Multiverses[verseId].playerCount > 0 and Multiverses[verseId].isActive then 
        SetPlayerRoutingBucket(src, verseId);
        Multiverses[verseId] = {
            playerCount = Multiverses[verseId].playerCount + 1,
            isActive = true
        }
        -- if setCoords then 
        --     TriggerClientEvent("Multiverse:SetCoords", src, coords)
        -- end
        debug("Joined verse "..verseId)
        TriggerClientEvent("Multiverse:SetJoinData", src, true, verseId)
    else 
        debug("Verse does not exist or is not active")
    end
end)

RegisterServerEvent("Multiverse:Leave", function(verseId, setCoords, coords)
    local src = source
    if Multiverses[verseId] ~= nil then 
        if Multiverses[verseId].playerCount > 0 and Multiverses[verseId].isActive then 
            SetPlayerRoutingBucket(src, 0);
            Multiverses[verseId] = {
                playerCount = Multiverses[verseId].playerCount - 1,
                isActive = true
            }
            if Multiverses[verseId].playerCount == 0 then -- delete verse if no players are in it
                Multiverses[verseId] = nil
            end
            -- if setCoords then 
            --     TriggerClientEvent("Multiverse:SetCoords", src, coords)
            -- end
            debug("Left verse "..verseId)
            TriggerClientEvent("Multiverse:SetJoinData", src, false, verseId)
        else 
            debug("Verse does not exist or is not active")
        end
    end
end)

function debug(msg)
    if config.debug then 
        print("^1[Multiverse]^0 "..msg.."	")
    end
end

function isAvailable(verseId)
    if Multiverses[verseId] ~= nil then 
        return true
    else 
        return false
    end
end

function getAvailabeVerse()
    local count = 0
    local found = false 
    while not found do 
        if Multiverses[count] == nil then 
            found = true 
            return count
        else 
            count = count + 1
        end
        Wait(0)
    end
end

RegisterServerEvent("Multiverse:goMainVerseFromClient", function(verseId)
    local src = source
    SetPlayerRoutingBucket(src, 0);
    TriggerClientEvent("Multiverse:SetJoinData", src, false, verseId)
end)