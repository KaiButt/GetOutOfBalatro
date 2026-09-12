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
    config = { extra = { extraCards = 3 } },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    attributes = { "passive" },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.extraCards } }
    end,
    pools = { ["goob"] = true, ["goobNL"] = true },
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
            if G.GAME.current_round.discards_used == 0 then
                SMODS.change_discard_limit(card.ability.extra.extraCards)
            end
        end
        if context.hand_drawn and not context.first_hand_drawn then
            if G.GAME.current_round.discards_used == 1 then
                SMODS.change_discard_limit(-card.ability.extra.extraCards)
            end
        end
    end
}
