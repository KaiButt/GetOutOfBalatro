SMODS.Atlas {
    key = 'broBingles',
    path = 'broBingles.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'broBingles',
    name = 'broBingles',
    atlas = 'broBingles',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pools = { ["Meme"] = true, ["goob"] = true, ["goobNL"] = true},
    calculate = function(self, card, context)
        if context.debuff_card and context.debuff_card == card and not context.blueprint then
            return { prevent_debuff = true }
        end
        if context.playing_card_added then
            for k, v in ipairs(context.cards) do
                v:set_seal("goob_WondrousMagic")
            end
        end
    end
}