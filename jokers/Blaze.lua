SMODS.Atlas {
    key = 'Blaze',
    path = 'Blaze.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Blaze',
    unlocked = false,
    loc_txt = {
        name = 'Blaze',
        text = {
            '{C:blue}+#1#{} hand per round',
            'Every card you {C:attention}play{}',
            'Will be {C:attention}shuffled back{} into your {C:attention}deck{}',
        },
        unlock = {
            'Beat a {C:attention}Boss Blind{} with at most {C:attention}5{} cards in your deck'
        }
    },
    name = "Blaze",
    atlas = "Blaze",
    config = {
        extra = {
            handPerRound = 1
        },
    },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
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
    pools = { ["goob"] = true},

    calculate = function(self, card, context)
        if context.stay_flipped and context.from_area == G.play then
            return {
                modify = {to_area = G.deck}
            }
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'ante_up' and #G.playing_cards <= 5
    end,
}