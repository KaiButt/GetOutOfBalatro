SMODS.Atlas {
    key = 'Blaze',
    path = 'Blaze.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Blaze',
    loc_txt = {
        name = 'Blaze',
        text = {
            'Every card you {C:attention}play{}',
            'Will be {C:attention}shuffled back{} into your {C:attention}deck{}',
        },
    },
    name = "Blaze",
    atlas = "Blaze",
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    pools = { ["goob"] = true},
    calculate = function(self, card, context)
        if context.stay_flipped and context.from_area == G.play and (context.other_card.ability.set=="Default" or context.other_card.ability.set=="Enhanced") then
            return {
                modify = {to_area = G.deck}
            }
        end
    end
}