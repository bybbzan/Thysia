local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                              npcHandler:onThink()                                    end
 
local function creatureSayCallback(cid, type, msg)
        if not npcHandler:isFocused(cid) then
                return false
        end
       
        local player, firstTaskStorage, secondTaskStorage = Player(cid), 1004, 1005
 
        if msgcontains(msg, 'task') then
                if player:getStorageValue(firstTaskStorage) == -1 then
                        npcHandler:say('Yes, actually I have a task. I want you to slay 50 dragons for me, can you do that?', cid)
                        npcHandler.topic[cid] = 1
                elseif player:getStorageValue(firstTaskStorage) >= 0 and player:getStorageValue(firstTaskStorage) < 50 then
                        npcHandler:say('I\'m sorry, but it seems like you are not done yet.', cid)
                elseif player:getStorageValue(firstTaskStorage) == 50 then
                        npcHandler:say('Have you killed the 50 dragons I asked about?', cid)
                        npcHandler.topic[cid] = 2
                elseif player:getStorageValue(secondTaskStorage) == -1 and player:getStorageValue(firstTaskStorage) == 51 then
                        npcHandler:say('Yes, ofcourse I have another task for you. But this is my final task & it will be a bit harder. I need you to slain 60 dragon lords for me. Can you do that?', cid)
                        npcHandler.topic[cid] = 3
                elseif player:getStorageValue(secondTaskStorage) >= 0 and player:getStorageValue(secondTaskStorage) < 60 then
                        npcHandler:say('I\'m sorry, but it seems like you are not done yet.', cid)
                elseif player:getStorageValue(secondTaskStorage) == 60 then
                        npcHandler:say('Have you slain the 60 dragon lords I asked you to?', cid)
                        npcHandler.topic[cid] = 4
                else
                        npcHandler:say('Sorry, you have done all my tasks already, I might have more tasks for you later.', cid)
                end
 
        elseif msgcontains(msg, 'yes') then
                if npcHandler.topic[cid] == 1 then
                if player:getStorageValue(1003) ~= 1 then
                        player:setStorageValue(1003, 1)
                end
                        player:setStorageValue(firstTaskStorage, 0)
                        npcHandler:say('Great, come back once you have slaughthered 50 dragons.', cid)
                elseif npcHandler.topic[cid] == 2 then
                        player:addExperience(250000, true)
                        player:addMoney(50000)
                        player:setStorageValue(firstTaskStorage, 51)
                        npcHandler:say('Awesome! Here\'s your reward.', cid)
                elseif npcHandler.topic[cid] == 3 then
                        player:setStorageValue(secondTaskStorage, 0)
                        npcHandler:say('Great, come back once you have slaugthered 60 dragon lords.', cid)
                elseif npcHandler.topic[cid] == 4 then
                        player:addExperience(350000, true)
                        player:addMoney(100000)
                        player:setStorageValue(secondTaskStorage, 61)
                        npcHandler:say('Great! Here\'s your reward.', cid)
                end
                npcHandler.topic[cid] = 0
 
        elseif msgcontains(msg, 'no') and npcHandler.topic[cid] ~= 0 then
                npcHandler:say('Maybe another time.', cid)
                npcHandler.topic[cid] = 0
        end
       
        return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())