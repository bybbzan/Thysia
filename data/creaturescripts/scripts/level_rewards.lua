local t = {
  39001, {
    [50] = {2160, 2, "You have been awarded with 2 crystal coins for reaching level 50!", 1},
    [100] = {2160, 5, "You have been awarded with 5 crystal coins for reaching level 100!", 2},
    [130] = {2160, 10, "You have been awarded with 10 crystal coins for reaching level 130!", 3},
    [150] = {2160, 15, "You have been awarded with 15 crystal coins for reaching level 150!", 4, "Curious of Nature"},
    [200] = {2160, 20, "You have been awarded with 20 crystal coins for reaching level 200!", 5, "I'm Addicted"}
    }
}

function onAdvance(cid, skill, oldlevel, newlevel)
    local player = Player(cid)
    for level, v in pairs(t[2]) do
        if skill == 8 and oldlevel < level and player:getLevel() >= level and player:getStorageValue(t[1]) < v[4] then
            player:addItem(v[1], v[2])
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, v[3])
            player:setStorageValue(t[1], v[4])
        if v[5] then
            player:addAchievement(v[5])
        end
            break
        end
    end
    player:save()
    return true
end