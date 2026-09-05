SMODS.Atlas {
    key = 'PowerCore',
    path = 'PowerCore.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'PowerCore',
    name = 'PowerCore',
    atlas = 'PowerCore',
    pos = { x = 0, y = 0 },
    rarity = 3,
    config = { extra = { x_mult = 3 }, immutable = { cardsToPlay = 4 } },
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult, center.ability.immutable.cardsToPlay } }
    end,
    calculate = function(self, card, context)
        -- thanks bundle of fun 'the square' boss blind code
        if context.debuff_hand and not next(SMODS.find_card("j_goob_Marie")) then
            if not context.scoring_hand or #context.scoring_hand < card.ability.immutable.cardsToPlay then
                return {
                    card = card,
                    debuff = true
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end
}
