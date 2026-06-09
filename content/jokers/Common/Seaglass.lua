SMODS.Atlas {
    key = 'Seaglass',
    path = 'Seaglass.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Seaglass',
    name = 'Seaglass',
    atlas = 'Seaglass',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 8,
    config = { extra = { sellBonus = 6, dollars = 2 } },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.dollars } }
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            card.ability.extra_value = card.ability.extra_value + card.ability.extra.sellBonus
            card:set_cost()
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}
