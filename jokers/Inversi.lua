SMODS.Atlas {
    key = 'Inversi',
    path = 'Inversi.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Inversi',
    loc_txt = {
        name = 'Inversi',
        text = {
            string.reverse('Chips')..' {C:chips}#2#d#1#+{}'
        },
    },
    name = "Inversi",
    atlas = "Inversi",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            diceToRoll = 5,
            sidesOfDice = 20,
        },
    },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    pools = { ["goob"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { string.reverse(tostring(center.ability.extra.diceToRoll)), string.reverse(tostring(center.ability.extra.sidesOfDice)) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            local chipsEarned = 0
            for i = 1, card.ability.extra.diceToRoll, 1 do
                random_number = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice)
                if next(SMODS.find_card("j_goob_StarAce")) and chipsEarned < card.ability.extra.sidesOfDice then
                    local random_number_2 = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice) -- if you have oops all 6's rolls with advantage
                    if random_number_2 > random_number then
                        random_number = random_number_2
                    end
                end
                chipsEarned = chipsEarned + random_number
            end
            return {
                chips = chipsEarned,
                colour = G.C.CHIPS,
                card = card,
            }
        end
    end
}