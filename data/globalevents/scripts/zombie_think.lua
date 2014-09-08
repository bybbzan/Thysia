dofile('data/zombie_system.lua')

function onTime(interval)
    if ze_started == false then
        ze_started = true
        print("Zombie event has started and we are waiting for players to join! Min: "..ze_min_players.."/"..ze_max_players..".")
        broadcastMessage("The zombie event has started! You have "..ze_wait_minutes.." minutes to join!", MESSAGE_STATUS_CONSOLE_ORANGE)
        addEvent(startZombie, ze_wait_minutes * 60 * 1000)
    end
    return true
end