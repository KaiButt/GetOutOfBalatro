SMODS.Atlas {
    key = 'Inversi',
    path = 'Inversi.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Inversi',
    unlocked = false,
    name = "Inversi",
    atlas = "Inversi",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            diceToRoll = 5,
            sidesOfDice = 30,
        },
    },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { string.reverse(tostring(center.ability.extra.diceToRoll)), string.reverse(tostring(center.ability.extra.sidesOfDice)) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                chips = roll_die(card.ability.extra.diceToRoll, card.ability.extra.sidesOfDice),
                colour = G.C.CHIPS,
                card = card,
            }
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and GET_selected_deck() == 'b_erratic'
    end
}