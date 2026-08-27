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
    config = { extra = { x_mult = 5, anteUp = 1 }, immutable = { kabiTriggered = false } },
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult, center.ability.extra.anteUp } }
    end,
    in_pool = function() -- can't get kabi in endless mode
        return not G.GAME.won
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            if card.ability.immutable.kabiTriggered == false then
                card.ability.immutable.kabiTriggered = true
                if next(SMODS.find_card("j_goob_Marie")) then
                    return {
                        message = "Pretty Lady!",
                        delay = 1.3,
                        colour = G.C.GREEN,
                        x_mult = card.ability.extra.x_mult
                    }
                else
                G.GAME.win_ante = G.GAME.win_ante + card.ability.extra.anteUp
                return {
                    message = "Ante Up!",
                    x_mult = card.ability.extra.x_mult,
                    delay = 1.2,
                    colour = G.C.PURPLE,
                    play_sound('goob_clockTick', 1, 1.2)
                }
            end
            end
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
