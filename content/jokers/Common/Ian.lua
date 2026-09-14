SMODS.Atlas {
    key = 'Ian',
    path = 'Ian.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Ian',
    name = 'Ian',
    atlas = 'Ian',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    config = { extra = { extraCards = 1 } },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    attributes = { "passive" },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.extraCards } }
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(card.ability.extra.extraCards)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(-card.ability.extra.extraCards)
    end,
    pools = { ["goob"] = true, ["goobNL"] = true },
}
