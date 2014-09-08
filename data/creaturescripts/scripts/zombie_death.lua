dofile('data/zombie_system.lua')

function onDeath(cid, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    local monster = Monster(cid)
    monster:say("OH SH*T! >.<", TALKTYPE_ORANGE_2)
    monster:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
    doSummonZombie()
    ze_zombie_count = ze_zombie_count - 1
end

function onPrepareDeath(cid, killer)
    local player = Player(cid)
    local winner = 0
    if player:getStorageValue(ze_join_storage) == 1 then
        ze_joined_count = ze_joined_count - 1
        player:teleportTo(player:getTown():getTemplePosition(), false)
        player:setStorageValue(ze_join_storage, 0)
        player:addHealth(player:getMaxHealth())
        if ze_joined_count <= 1 then --Event ended, someone won!
            local players = Game.getPlayers()
            for _, tmpPlayer in ipairs(players) do
                local stor = tmpPlayer:getStorageValue(ze_join_storage)
                if stor == 1 then
                    winner = tmpPlayer:getId()
                end
            end
            winner = Player(winner)
            if winner ~= nil then
			    local rewardId = { 15546, 5919, itemId, itemId }
                winner:addItem(rewardId[math.random(#rewardId)], 1)
                winner:teleportTo(winner:getTown():getTemplePosition(), false)
                local trophy = winner:addItem(ze_trophy, 1)
                trophy:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "["..winner:getName().."] "..ze_trophy_desc)
                broadcastMessage(""..winner:getName().." is the winner of zombie event versus "..ze_zombie_count.." Zombies!", MESSAGE_STATUS_WARNING)
            end
            doClearZombieArena()
            resetVariables()
        end
        return false
    end
    return true
end