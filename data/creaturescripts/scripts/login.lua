local eventNames = {
        "PlayerDeath",
        "ZE_Death",
        "PlayerTasks",
        "KillingInTheNameOfKills",
        "ModalwindowTwo",
        "Wyda",
        "Raging Mage",
        "Raging Mage2",
        "White Deer",
        "White Deer2",
        "Northern Pike",
        "Gaz'haragoth Heal",
        "Omrafir Explode",
        "Shlorg Tp",
        "Welter Egg",
        "The Pale Count Tp",
        "Test Heal",
        "Zavarash Hide",
        "Monster Heal",
        "Monster Heal2",
        "Nomad",
        "Modalwindow",
		"AdvanceSave",
		"taskbossOnKill"
}
 
function onLogin(cid)
        local player = Player(cid)
 
        local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
        if player:getLastLoginSaved() <= 0 then
                loginStr = loginStr .. " Please choose your outfit."
                player:sendOutfitWindow()
        else
                if loginStr ~= "" then
                        player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
                end
 
                loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
        end
 
        player:addAchievement(1)
        player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
 
        if player:getStorageValue(30400) == 1 then --write ze_join_storage number here
                player:setStorageValue(30400, 0) --write ze_join_storage number here
        end
 
        for i = 1, #eventNames do
                player:registerEvent(eventNames[i])
        end
        return true
end