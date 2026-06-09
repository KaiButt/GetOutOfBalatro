GetOutOfBalatro = {}

local joker_common_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/jokers/Common/")
local joker_uncommon_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/jokers/Uncommon/")
local joker_rare_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/jokers/Rare/")
local joker_legendary_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/jokers/Legendary/")
local decks_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/decks/")
local tag_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/tags/")
local ach_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/achievements/")
local seal_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "content/seals/")
SMODS.Atlas({
	key = "modicon",
	path = "goob_icon.png",
	px = 32,
	py = 32,
})
SMODS.ObjectType({
	object_type = "ObjectType",
	key = "goob",
	weight = 10,
	default = "j_goob_Petyr",
	cards = {}
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
