local config = {
        ['troll'] = {storageKey = 1001, killsRequired = 45},
        ['rotworm'] = {storageKey = 1002, killsRequired = 60},
        ['dragon'] = {storageKey = 1004, killsRequired = 50},
        ['dragon lord'] = {storageKey = 1005, killsRequired = 60}
}
 
function onKill(cid, target, lastHit)
        local targetCreature = Creature(target)
        if targetCreature:isPlayer() or targetCreature:getMaster() then
                return true
        end
 
        local targetName = config[targetCreature:getName():lower()]
        if not targetName then
                return true
        end
       
        local player = Player(cid)
        local killAmount = player:getStorageValue(targetName.storageKey)
        if killAmount >= 0 and killAmount < targetName.killsRequired then
                player:setStorageValue(targetName.storageKey, killAmount + 1)
        end
        return true
end