GetOutOfBalatro = {}

local joker_common_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/jokers/Common/")
local joker_uncommon_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/jokers/Uncommon/")
local joker_rare_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/jokers/Rare/")
local joker_legendary_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/jokers/Legendary/")
local decks_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/decks/")
local tag_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/tags/")
local ach_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/achievements/")
local misc_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/misc/")
local seal_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/seals/")
SMODS.Atlas({
	key = "modicon",
	path = "goob_icon.png",
	px = 32,
	py = 32,
})
SMODS.ObjectType({ -- goob pool, contains ALL of them
	object_type = "ObjectType",
	key = "goob",
	weight = 10,
	default = "j_goob_Petyr",
	cards = {}
})
SMODS.ObjectType({ -- goob pool, contains all non-legendaries.
	object_type = "ObjectType",
	key = "goobNL",
	weight = 10,
	default = "j_goob_Digger",
	cards = {}
})
SMODS.ObjectType({ -- goob pool, contains all legendaries. For the menu.
	object_type = "ObjectType",
	key = "goobL",
	weight = 10,
	default = "j_goob_Kai",
	cards = {}
})
--these two are mainly used to prevent fox and goblin party tag from generating legendaries, unless you have Charles then the tag can
SMODS.Sound({
	key = "clockTick",
	path = "clockTick.wav"
})
SMODS.Sound({
	key = "clockOut",
	path = "clockOut.wav"
})
for _, file in ipairs(seal_src) do
	assert(SMODS.load_file("content/seals/" .. file))()
end
for _, file in ipairs(joker_common_src) do
	assert(SMODS.load_file("content/jokers/Common/" .. file))()
end
for _, file in ipairs(joker_uncommon_src) do
	assert(SMODS.load_file("content/jokers/Uncommon/" .. file))()
end
for _, file in ipairs(joker_rare_src) do
	assert(SMODS.load_file("content/jokers/Rare/" .. file))()
end
for _, file in ipairs(joker_legendary_src) do
	assert(SMODS.load_file("content/jokers/Legendary/" .. file))()
end
for _, file in ipairs(tag_src) do
	assert(SMODS.load_file("content/tags/" .. file))()
end
for _, file in ipairs(decks_src) do
	assert(SMODS.load_file("content/decks/" .. file))()
end
for _, file in ipairs(ach_src) do
	assert(SMODS.load_file("content/achievements/" .. file))()
end
for _, file in ipairs(misc_src) do
	assert(SMODS.load_file("content/misc/" .. file))()
end
-- menu card
SMODS.current_mod.menu_cards = function()
	return {
		{ set = "goobL" },
	}
end

-- rolling die
function roll_die(_amountToRoll, _sidesOfDice)
	local amountToRoll = _amountToRoll or 1
	local advantage = next(SMODS.find_card("j_goob_StarAce"))
	local sidesOfDice = _sidesOfDice or 6
	SMODS.calculate_context{goob_dice_rolled = true, amountToRoll = amountToRoll, sidesOfDice = sidesOfDice}
	local accum = 0
	for i = 1, amountToRoll, 1 do 
		local smallResult = pseudorandom("goob_seed", 1, sidesOfDice ) 
		accum = accum + smallResult
		end
	if accum<sidesOfDice and advantage then
		local accum2 = 0 
		for i = 1, amountToRoll, 1 do accum2 = accum2 + pseudorandom("goob_seed", 1, sidesOfDice ) end
		if accum<accum2 then
			accum = accum2
		end
	end
	
	return accum
end
