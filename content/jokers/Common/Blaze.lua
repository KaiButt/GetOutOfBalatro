SMODS.Atlas {
    key = 'Blaze',
    path = 'Blaze.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Blaze',
    unlocked = false,
    name = "Blaze",
    atlas = "Blaze",
    config = {
        extra = {
            handPerRound = 1
        },
    },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.handPerRound} }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.handPerRound
        ease_hands_played(card.ability.extra.handPerRound)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.handPerRound
        ease_hands_played(-card.ability.extra.handPerRound)
    end,
    blueprint_compat = false,
    pools = { ["goob"] = true, ["goobNL"] = true},

    calculate = function(self, card, context)
        if context.stay_flipped and context.from_area == G.play then
            return {
                modify = {to_area = G.deck},
                G.deck:shuffle("goob_blaze")
            }
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'ante_up' and #G.playing_cards <= 5
    end,
}