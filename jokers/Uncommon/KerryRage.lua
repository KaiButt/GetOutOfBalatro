SMODS.Atlas {
    key = 'Kerry_rage',
    path = 'Kerry_rage.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Kerry_rage',
    name = 'Kerry_rage',
    atlas = 'Kerry_rage',
    pos = { x = 0, y = 0 },
    config = { extra = { enrageGain = 2.5 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.enrageGain } }
    end,
    in_pool = function()
        return false
    end,
    rarity = 2,
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.debuff_card and context.debuff_card == card and not context.blueprint then
            if card.ability.extra_value < 3 then
                card.ability.extra_value = 3
                card:set_cost()
            end
            return { prevent_debuff = true }
        end
        if context.joker_type_destroyed and context.card == card and not context.blueprint then
            card:juice_up()
            if card.ability.extra_value < 3 then
                card.ability.extra_value = 3
                card:set_cost()
            end
            return { no_destroy = true }
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                x_mult = card.ability.extra.enrageGain,
                colour = G.C.RED,
                card = card,
            }
        end
    end
}