--zombie variables
ze_Zombie_Name = "Zombie" --Zombie Name
zombie_spawn_interval = 5 --how many seconds until a new zombie spawns
ze_zombie_count = 0 --dont touch
ze_max_zombies = 40 --max zombies in the arena?

--players variables
ze_join_storage = 30451 --player join storage
ze_min_players = 2 --min players needed when time runout
ze_max_players = 25 --max players to join
ze_trophy = 7369 --trophy id
ze_trophy_desc =  "has won the zombie event." --winner description on the trophy

--other variables
ze_wait_minutes = 1 --when event has opened, how long until it starts?
ze_started = false --dont touch
ze_waiting_room_pos = {x = 1290, y = 1152, z = 7} --middle of waiting room
ze_zombie_arena = {x = 1307, y = 1125, z = 7} --when even start where should player be teleported in the zombie arena?
ze_Arena_fromPosition = {x = 1285, y = 1111, z = 7} --pos of top left corner
ze_Arena_toPosition = {x = 1331, y = 1140, z = 7} --pos of bottom right corner
ze_middle_zombie_arena = {x = 1307, y = 1125, z = 7} --Middle pos of the arena
ze_joined_count = 0 --dont touch
ze_waiting_room_radius_x = 15 --depends how big the waiting room is 20sqm to x
ze_waiting_room_radius_y = 11 --depends how big the waiting room is 20sqm to y
ze_zombie_arena_radius_x = 28 --Depends how big the zombie arena is 50sqm to x
ze_zombie_arena_radius_y = 44 --Depends how big the zombie arena is 50sqm to y

function startZombie()
    local specs = Game.getSpectators(ze_waiting_room_pos, false, true, 0, ze_waiting_room_radius_x, 0, ze_waiting_room_radius_y)
    if ze_joined_count >= ze_min_players then
        for i = 1, #specs do
            specs[i]:teleportTo(ze_zombie_arena, true)
        end
        broadcastMessage("The zombie event has started, good luck to all participants!", MESSAGE_STATUS_WARNING)
        ze_started = started
        doStartZombieEvasion()
    else
        for i = 1, #specs do
            specs[i]:teleportTo(specs[i]:getTown():getTemplePosition(), false)
            specs[i]:setStorageValue(ze_join_storage, 0)
        end
        resetVariables()
        broadcastMessage("The zombie event could not start because not enough players joined the event.", MESSAGE_STATUS_WARNING)
    end
end

function doSummonZombie()
    if ze_zombie_count < ze_max_zombies then
        local zomb = Game.createMonster(ze_Zombie_Name, {x = math.random(ze_Arena_fromPosition.x, ze_Arena_toPosition.x), y = math.random(ze_Arena_fromPosition.y, ze_Arena_toPosition.y), z = math.random(ze_Arena_fromPosition.z, ze_Arena_toPosition.z)})
        if zomb == false then
            Game.createMonster(ze_Zombie_Name, {x = math.random(ze_Arena_fromPosition.x, ze_Arena_toPosition.x), y = math.random(ze_Arena_fromPosition.y, ze_Arena_toPosition.y), z = math.random(ze_Arena_fromPosition.z, ze_Arena_toPosition.z)})
        end
        ze_zombie_count = ze_zombie_count + 1
    end
end

function doStartZombieEvasion()
    if ze_started == started then
        doSummonZombie()
        addEvent(doStartZombieEvasion, 5 * 1000)
    end
end

function resetVariables()
    ze_started = false
    ze_joined_count = 0
    ze_zombie_count = 0
end

function doClearZombieArena()
    local specs = Game.getSpectators(ze_middle_zombie_arena, false, false, 0, ze_zombie_arena_radius_x, 0, ze_zombie_arena_radius_y)
    for i = 1, #specs do
        if specs[i]:getName() == ze_Zombie_Name then
            specs[i]:remove()
        end
    end
end