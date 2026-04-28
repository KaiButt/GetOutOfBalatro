SMODS.Atlas {
    key = 'StarAce',
    path = 'StarAce.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'StarAce',
    loc_txt = {
        name = 'Star Ace',
        text = {
            '{C:mult}+#1#d#2#{} Mult',
            'When any G.O.O.B die is rolled, it is rolled with {C:attention}advantage{}',
        },
    },
    name = "StarAce",
    atlas = "StarAce",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            diceToRoll = 1,
            sidesOfDice = 12,
        },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    pools = { ["goob"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.diceToRoll, center.ability.extra.sidesOfDice } }
    end,
    calculate = function(self, card, context)
       if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
        local multGain = 0
        for i = 1, card.ability.extra.diceToRoll, 1 do
            local random_number = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice)
            if random_number < card.ability.extra.sidesOfDice then
                local random_number_2 = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice)
                if random_number < random_number_2 then
                    random_number = random_number_2
                end
            end
            multGain = multGain + random_number
        end
            return {
                mult = multGain,
                colour = G.C.RED,
                card = card,
            }
        end
    end
}