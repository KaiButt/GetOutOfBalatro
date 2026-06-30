SMODS.Atlas {
    key = 'Kabi',
    path = 'Kabi.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Kabi',
    name = 'Kabi',
    atlas = 'Kabi',
    unlocked = false,
    pos = { x = 0, y = 0 },
    rarity = 3,
    config = { extra = { x_mult = 4, anteUp = 1 } },
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult, center.ability.extra.anteUp } }
    end,
    in_pool = function() -- can't get kabi in endless mode
        return not G.GAME.won
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            G.GAME.win_ante = G.GAME.win_ante + card.ability.extra.anteUp
            card_eval_status_text(card, "extra", nil, nil, nil, {
                message = "Ante Up!",
                delay = 1.2,
                colour = G.C.PURPLE,
            })
            return {
                play_sound('goob_clockTick', 1, 1.2)
            }
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end,
    check_for_unlock = function(self, args) 
        if args.type == 'round_win' then
            return (G.GAME.round_resets.blind_ante == 9 and G.GAME.blind.boss)
        end
    end
}
