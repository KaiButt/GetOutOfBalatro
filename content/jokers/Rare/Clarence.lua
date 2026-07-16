SMODS.Atlas {
    key = 'Clarence',
    path = 'Clarence.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Clarence',
    name = "Clarence",
    atlas = "Clarence",
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
    pools = { ["goob"] = true, ["goobNL"] = true},
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.mod_probability and G.GAME.current_round.hands_played == 0 then
            return {
                numerator = context.denominator
            }
        end
    end
}
