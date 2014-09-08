--[[

Achievements Lib Created By Eduardo Montilva (Darkhaos) for TFS 1.0

LAST UPDATE: 16 July 2014 (Tibia Update 10.50)

Functions:
	getAchievementInfoById(achievement_id)
	getAchievementInfoByName(achievement_name)
	getSecretAchievements()
	getPublicAchievements()
	getAchievements()
	Player:addAchievement(achievement_id/name[, showMsg])
	Player:removeAchievement(achievement_id/name)
	Player:hasAchievement(achievement_id/name)
	Player:addAllAchievements([showMsg])
	Player:removeAllAchievements()
	Player:getSecretAchievements()
	Player:getPublicAchievements()
	Player:getAchievements()
	isAchievementSecret(achievement_id/name)
	Player:getAchievementPoints()

Note: 	This lib was created following the data found in tibia.wikia.com.
		Achievements with no points (or points equal to 0) are achievements with no available info about points in tibia.wikia.com. These achievements should be updated
]]

ACHIEVEMENTS_BASE = 40000 -- base storage
ACHIEVEMENTS_ACTION_BASE = 20000 	--this storage will be used to save the process to obtain the certain achievement
									--(Ex: this storage + the id of achievement 'Allowance Collector' to save...
									-- ...how many piggy banks has been broken

achievements =
{
	[1] = {name = "Woohoo, I'm Online!", grade = 1, points = 1, description = "You have successfuly created a character and logged in to our server."},
	[2] = {name = "I'm Addicted", grade = 1, points = 5, description = "You have successfuly reached level 200 and have been rewarded with 20 crystal coins for your great effort, congratulations!"},
	[3] = {name = "Curious of Nature", grade = 1, points = 2, description = "You have successfuly reached level 150 and have been rewarded with 15 crystal coins for your great effort, congratulations!"}

}

ACHIEVEMENT_FIRST = 1
ACHIEVEMENT_LAST = #achievements

function getAchievementInfoById(id)
	for k, v in pairs(achievements) do
		if k == id then
			local t = {}
			t.id = k
			t.actionStorage = ACHIEVEMENTS_ACTION_BASE + k
			for inf, it in pairs(v) do
				t[inf] = it
			end
			return t
		end
	end
	return false
end

function getAchievementInfoByName(name)
	for k, v in pairs(achievements) do
		if v.name:lower() == name:lower() then
			local t = {}
			t.id = k
			t.actionStorage = ACHIEVEMENTS_ACTION_BASE + k
			for inf, it in pairs(v) do
				t[inf] = it
			end
			return t
		end
	end
	return false
end

function getSecretAchievements()
	local t = {}
	for k, v in pairs(achievements) do
		if v.secret then
			table.insert(t, k)
		end
	end
	return t
end

function getPublicAchievements()
	local t = {}
	for k, v in ipairs(achivements) do
		if not v.secret then
			table.insert(t, k)
		end
	end
	return t
end

function getAchievements()
	return achievements
end

function isAchievementSecret(ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	return achievement.secret
end

function Player.hasAchievement(self, ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	return self:getStorageValue(ACHIEVEMENTS_BASE + achievement.id) > 0
end

function Player.getAchievements(self)
	local t = {}
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) then
			table.insert(t, k)
		end
	end
	return t
end

function Player.addAchievement(self, ach, denyMsg)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	if not self:hasAchievement(achievement.id) then
		self:setStorageValue(ACHIEVEMENTS_BASE + achievement.id, 1)
		if not denyMsg then
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You earned the achievement \"" .. achievement.name .. "\".")
		end
	end
	return true
end

function Player.removeAchievement(self, ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	if self:hasAchievement(achievement.id) then
		self:setStorageValue(ACHIEVEMENTS_BASE + achievement.id, -1)
	end
	return true
end

function Player.addAllAchievements(self, denyMsg)
	for i = ACHIEVEMENT_FIRST, ACHIEVEMENT_LAST do
		self:addAchievement(i, denyMsg)
	end
	return true
end

function Player.removeAllAchievements(self)
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) then
			self:removeAchievement(k)
		end
	end
	return true
end

function Player.getSecretAchievements(self)
	local t = {}
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) and v.secret then
			table.insert(t, k)
		end
	end
	return t
end

function Player.getPublicAchievements(self)
	local t = {}
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) and not v.secret then
			table.insert(t, k)
		end
	end
	return t
end

function Player.getAchievementPoints(self)
	local points = 0
	local list = self:getAchievements()
	if #list > 0 then --has achievements
		for _, id in ipairs(list) do
			local a = getAchievementInfoById(id)
			if a.points > 0 then --avoid achievements with unknow points
				points = points + a.points
			end
		end
	end
	return points
end