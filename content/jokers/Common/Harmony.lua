SMODS.Atlas {
    key = 'Harmony',
    path = 'Harmony.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Harmony',
    name = 'Harmony',
    atlas = 'Harmony',
    pos = { x = 0, y = 0 },
    config = { extra = { handSize = 1, diceToRoll = 1, sidesOfDice = 5 } },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        G.GAME.harmony_destroyed = false
        return { vars = { center.ability.extra.handSize, center.ability.extra.diceToRoll, center.ability.extra.sidesOfDice} }
    end,
    in_pool = function()
        return not G.GAME.pool_flags.goob_harmony_dead
    end,
    pools = { ["goob"] = true, ["goobNL"] = true},
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.handSize)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.handSize)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.game_over == false then 
            if roll_die(card.ability.extra.diceToRoll, card.ability.extra.sidesOfDice) == card.ability.extra.sidesOfDice then
                G.GAME.pool_flags.goob_harmony_dead = true
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

