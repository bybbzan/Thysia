local config = {
	{storageKey = 35001, bossName = 'Hide'},
	{storageKey = 35002, bossName = 'Deathbine'},
	{storageKey = 35006, bossName = 'Fleshcrawler'},
	{storageKey = 35009, bossName = 'Thul'},
	{storageKey = 35010, bossName = 'The Old Widow'},
	{storageKey = 35012, bossName = 'Tormentor'},
	{storageKey = 35013, bossName = 'Flameborn'},
	{storageKey = 35014, bossName = 'Fazzrah'},
	{storageKey = 35018, bossName = 'The Many'},
	{storageKey = 35019, bossName = 'The Noxious Spawn'},
	{storageKey = 35020, bossName = 'Gorgo'},
	{storageKey = 35021, bossName = 'Stonecracker'},
	{storageKey = 35022, bossName = 'Leviathan'},
	{storageKey = 35023, bossName = 'Kerberos'},
	{storageKey = 35024, bossName = 'Ethershreck'},
	{storageKey = 35025, bossName = 'Paiz the Pauperizer'},
	{storageKey = 35027, bossName = 'Zanakeph'},
	{storageKey = 35030, bossName = 'Pirate Bosses'},
	{storageKey = 35032, bossName = 'The Horned Fox'},
	{storageKey = 37001, bossName = 'Uruk\'Hai'},
	{storageKey = 37002, bossName = 'Flameborn Foulscale'},
	{storageKey = 37003, bossName = 'Fire Overlord'},
	{storageKey = 37004, bossName = 'Sir Desrik'},
	{storageKey = 37005, bossName = 'Mr.Punish'},
	{storageKey = 37006, bossName = 'Dementor'},
	{storageKey = 37007, bossName = 'Obujos'},
	{storageKey = 37008, bossName = 'Hirintror'},
	{storageKey = 37009, bossName = 'Zarabustor'}
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
        local player, modalWindow = Player(cid), ModalWindow(2, 'Task System', 'Select a boss:')
        for i = 1, #config do
                if player:getStorageValue(config[i].storageKey) == 1 then
                        modalWindow:addChoice(i, config[i].bossName)
                end
        end
         if modalWindow:getChoiceCount() == 0 then
                        player:say('You have to finish the task and report it to Taina in order to choose which boss to face.', TALKTYPE_MONSTER_SAY)
        return true
                end
 
        modalWindow:addButton(1, 'Select')
        modalWindow:setDefaultEnterButton(1)
 
        modalWindow:addButton(2, 'Cancel')
        modalWindow:setDefaultEscapeButton(2)
 
        modalWindow:sendToPlayer(player)
        return true
end