SMODS.Atlas {
    key = 'GoldBot',
    path = 'GoldBot.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'Gold_Bot',
    loc_txt = {
        name = 'Gold Bot',
        text = {
            'When {C:attention}Blind{} is skipped',
            'Gain {C:gold}$#1#d#2#{} Gold',
        }
    },
    name = 'Gold_Bot',
    atlas = 'GoldBot',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            diceToRoll = 1,
            sidesOfDice = 6,
            moneyEarned = 0
        }
    },
    rarity = 2,
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.diceToRoll, center.ability.extra.sidesOfDice} }
    end,
    calculate = function(self,card,context)
        if context.skip_blind then
            card.ability.moneyEarned = 0
            for i = 1, card.ability.extra.diceToRoll, 1 do
                local random_number = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice)
                if next(SMODS.find_card("j_goob_StarAce")) and random_number < card.ability.extra.sidesOfDice then
                    local random_number_2 = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice) -- if you have oops all 6's rolls with advantage
                    if random_number_2 > random_number then
                        random_number = random_number_2
                    end
                end
                card.ability.moneyEarned = random_number
            end
            card:juice_up()
            return {
                message = localize('$')..card.ability.moneyEarned,
                ease_dollars(card.ability.moneyEarned),
                colour = G.C.MONEY,
                delay = 1.2,
            }
        end
    end
}