SMODS.Atlas {
    key = 'Ante',
    path = 'Ante.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Ante',
    name = "Ante",
    atlas = "Ante",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.25
        },
    },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    pools = { ["goob"] = true, ["goobL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.xmult_gain, center.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.goob_dice_rolled then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                 message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
            }
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                x_mult = card.ability.extra.xmult,
                colour = G.C.RED,
                card = card
            }
        end
    end
}