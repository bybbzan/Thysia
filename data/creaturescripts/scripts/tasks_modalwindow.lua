function onModalWindow(player, modalWindowId, buttonId, choiceId)
        if modalWindowId ~= 1 or buttonId == 2 then
                return false
        end
        local targetTask = tasks[choiceId]
        if not targetTask then
                return true
        end
 
        if player:canStartTask(targetTask.raceName) then
                if #player:getStartedTasks() >= tasksByPlayer then
                        taskNpc:say('Sorry, but you have already started ' .. tasksByPlayer .. ' tasks. You can check their {status} or {cancel} a task.', TALKTYPE_PRIVATE_NP, false, player, taskNpc:getPosition())
                        return true
                end
 
                if player:getStorageValue(QUESTSTORAGE_BASE + choiceId) > 0 then
                        return false
                end
 
                player:setStorageValue(QUESTSTORAGE_BASE + choiceId, 1)
                player:setStorageValue(KILLSSTORAGE_BASE + choiceId, 0)
               
                taskNpc:say('Excellent! In this task you must defeat ' .. targetTask.killsRequired .. ' ' .. targetTask.raceName .. '. You can check the {status} of your task saying {report} to me. Also you can {cancel} tasks to.', TALKTYPE_PRIVATE_NP, false, player, taskNpc:getPosition())
        end
        return true
end