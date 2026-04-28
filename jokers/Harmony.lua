SMODS.Atlas {
    key = 'Harmony',
    path = 'Harmony.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Harmony',
    loc_txt = {
        name = 'Harmony',
        text = {
            '{C:attention}+#1#{} hand size',
            '{C:green}#2# in #3#{} chance this card is destroyed at end of round',
        }
    },
    name = 'Harmony',
    atlas = 'Harmony',
    pos = { x = 0, y = 0 },
    config = { extra = { handSize = 1, numerator = 1, denominator = 5 } },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        G.GAME.harmony_destroyed = false
        local num, denom = SMODS.get_probability_vars(center, center.ability.extra.numerator, center.ability.extra.denominator)
        return { vars = { center.ability.extra.handSize, num, denom} }
    end,
    in_pool = function()
        if G.GAME.harmony_destroyed then
            return false
        elseif G.GAME.harmony_destroyed == false then
            return true
        end
    end,
    pools = { ["goob"] = true },
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.handSize)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.handSize)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.game_over == false then
            if SMODS.pseudorandom_probability(card, 'j_goob_Harmony', card.ability.extra.numerator, card.ability.extra.denominator) then
                G.GAME.harmony_destroyed = true
                return {
                    message = 'Goodbye!',
                    delay = 1.2,
                    SMODS.destroy_cards(card)
                }
            else
                return {
                    message = 'Stayin\' Alive!',
                    delay = 1.2
                }
            end
        end
    end,
}

