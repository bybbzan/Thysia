function onSay(cid, words, param)
    local player = Player(cid)
    if player:getGroup():getAccess() then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "We are sorry, but no gamemasters can participate in this event.")
        return false
    end
    if ze_started == started then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "The zombie event has already started.")
        return false
    end
    if ze_started == true then
        if ze_joined_count < ze_max_players then
            if not player:isPzLocked() then
                player:teleportTo(ze_waiting_room_pos, false)
                ze_joined_count = ze_joined_count + 1
                broadcastMessage(player:getName().." has joined the Zombie Event! ["..ze_joined_count.."/"..ze_max_players.."].", MESSAGE_STATUS_WARNING)
                player:setStorageValue(ze_join_storage, 1)
            else
                player:sendCancelMessage("You can't join the zombie event while you are in a fight!")
            end
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, "The zombie event is already full! ["..ze_joined_count.."/"..ze_max_players.."]")
        end
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "The zombie event has not started yet.")
    end
    return false
end