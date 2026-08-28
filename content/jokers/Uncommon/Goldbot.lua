SMODS.Atlas {
    key = 'GoldBot',
    path = 'GoldBot.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'Gold_Bot',
    name = 'Gold_Bot',
    atlas = 'GoldBot',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            diceToRoll = 1,
            sidesOfDice = 8,
        }
    },
    rarity = 2,
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.diceToRoll, center.ability.extra.sidesOfDice} }
    end,
    calculate = function(self,card,context)
        if context.skip_blind then
            local sum = roll_die(card.ability.extra.diceToRoll, card.ability.extra.sidesOfDice)
            card:juice_up()
            return {
                message = localize('$')..sum,
                ease_dollars(sum),
                colour = G.C.MONEY,
                delay = 1.2,
            }
        end
    end
}