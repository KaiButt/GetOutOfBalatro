SMODS.Atlas {
    key = 'StarAce',
    path = 'StarAce.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'StarAce',
    unlocked = false,
    name = "StarAce",
    atlas = "StarAce",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            diceToRoll = 1,
            sidesOfDice = 18,
        },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.diceToRoll, center.ability.extra.sidesOfDice } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                mult = roll_die(card.ability.extra.diceToRoll, card.ability.extra.sidesOfDice),
                colour = G.C.RED,
                card = card,
            }
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'round_win' then
            local luckyNumber = pseudorandom("goob_seed", 1, 12)
            if luckyNumber == 12 then
                return true
            else
                return false
            end
        end
    end
}