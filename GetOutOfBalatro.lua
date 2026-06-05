GetOutOfBalatro = {}

local joker_common_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers/Common/")
local joker_uncommon_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers/Uncommon/")
local joker_rare_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers/Rare/")
local joker_legendary_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers/Legendary/")
local decks_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "decks/")
local tag_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "tags/")
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
for _, file in ipairs(joker_common_src) do
    assert(SMODS.load_file("jokers/Common/" .. file))()
end
for _, file in ipairs(joker_uncommon_src) do
    assert(SMODS.load_file("jokers/Uncommon/" .. file))()
end
for _, file in ipairs(joker_rare_src) do
    assert(SMODS.load_file("jokers/Rare/" .. file))()
end
for _, file in ipairs(joker_legendary_src) do
    assert(SMODS.load_file("jokers/Legendary/" .. file))()
end
for _, file in ipairs(tag_src) do
	assert(SMODS.load_file("tags/" .. file))()
end

for _, file in ipairs(decks_src) do
	assert(SMODS.load_file("decks/" .. file))()
end