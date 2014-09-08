function onStepIn(cid, item, position, fromPosition)
    local player = Player(cid)
    if not player then
        return false
    end
    if player:getGroup():getAccess() then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "I'm sorry, but no Gamemasters are allowed to participate in this event.")
        player:teleportTo(fromPosition, true)
        return false
    end
    if ze_started == started then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "The zombie event has already been started.")
        player:teleportTo(fromPosition, true)
        return false
    end
    if ze_started == true then
        if ze_joined_count < ze_max_players then
            player:teleportTo(ze_waiting_room_pos, false)
            ze_joined_count = ze_joined_count + 1
            broadcastMessage(player:getName().." has joined the zombie event! ["..ze_joined_count.."/"..ze_max_players.."].", MESSAGE_STATUS_WARNING)
            player:setStorageValue(ze_join_storage, 1)
        else
            player:teleportTo(fromPosition, true)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "I'm sorry, but the zombie event is currently full. ["..ze_joined_count.."/"..ze_max_players.."]")
        end
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "The zombie event has not started yet.")
        player:teleportTo(fromPosition, true)
    end
end