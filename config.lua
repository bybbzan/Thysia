-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp"
hotkeyAimbotEnabled = "yes"
protectionLevel = 50
killsToRedSkull = 5
killsToBlackSkull = 10
pzLocked = 10000
removeAmmoWhenUsingDistanceWeapon = "yes"
removeChargesFromRunes = "yes"
timeToDecreaseFrags = 12 * 60 * 60 * 1000
whiteSkullTime = 5 * 60 * 1000
stairJumpExhaustion = 2000
experienceByKillingPlayers = "no"
expFromPlayersLevelRange = 75
noDamageToSameLookfeet = "no"

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
ip = "213.64.162.49"
bindOnlyGlobalAddress = "no"
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 0
motd = "Welcome to RPG Project v1.0!"
onePlayerOnlinePerAccount = "yes"
allowClones = "no"
serverName = "RPG Project"
statusTimeout = 5000
replaceKickOnLogin = "yes"
maxPacketsPerSecond = 25

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
housePriceEachSQM = 1000
houseRentPeriod = "never"

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "Halfard"
mapAuthor = "Komic"

-- Market
marketOfferDuration = 30 * 24 * 60 * 60
premiumToCreateMarketOffer = "yes"
checkExpiredMarketOffersEachMinutes = 60
maxMarketOffersAtATimePerPlayer = 100

-- MySQL
mysqlHost = "127.0.0.1"
mysqlUser = "rpgproject"
mysqlPass = "efb098123"
mysqlDatabase = "rpgproject"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"

-- Misc.
allowChangeOutfit = "yes"
freePremium = "yes"
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
emoteSpells = "yes"

-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
rateExp = 5
rateSkill = 12
rateLoot = 3
rateMagic = 10
rateSpawn = 1

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = "yes"

-- Scripts
warnUnsafeScripts = "no"
convertUnsafeScripts = "no"

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process priority.
defaultPriority = "high"
startupDatabaseOptimization = "no"

-- Status server information
ownerName = "Naxtie"
ownerEmail = ""
url = "http://otland.net/"
location = "Sweden"
