SMODS.Atlas {
    key = 'KaiCard',
    path = 'KaiCard.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'KaiFace',
    path = 'KaiFace.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Kai',
    name = 'Kai',
    atlas = 'KaiCard',
    pos = { x = 0, y = 0 },
    soul_atlas = 'KaiFace',
    soul_pos = { x = 0, y = 0 },
    rarity = 4,
    cost = 20,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobL"] = true},
    attributes = { "passive" },
    in_pool = function(self,args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card:get_seal() == 'goob_WondrousMagic' then
                return true
            end
        end
        return false
    end
}
