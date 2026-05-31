GetOutOfBalatro = {}

local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers")
local tag_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "tags")
SMODS.Atlas({
	key = "modicon",
	path = "goob_icon.png",
	px = 32,
	py = 32,
})
for _, file in ipairs(joker_src) do
    assert(SMODS.load_file("jokers/" .. file))()
end

for _, file in ipairs(tag_src) do
	assert(SMODS.load_file("tags/" .. file))()
end