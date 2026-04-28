SMODS.Atlas {
    key = 'Ante',
    path = 'Ante.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Ante',
    loc_txt = {
        name = 'Ante',
        text = {
            '{X:mult,C:white}X#1#d#2#{} Mult',
        },
    },
    name = "Ante",
    atlas = "Ante",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            diceToRoll = 3,
            sidesOfDice = 3,
        },
    },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    pools = { ["goob"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.diceToRoll, center.ability.extra.sidesOfDice } }
    end,
    weight = 10,
     get_weight = function(self)
        if next(SMODS.find_card("j_goob_Boblin")) then
            return self.weight * 10000
        elseif not next(SMODS.find_card("j_goob_Boblin")) then
            return self.weight
        end
    end,
    calculate = function(self, card, context)
       if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
        local multGain = 0
        for i = 1, card.ability.extra.diceToRoll, 1 do
            local random_number = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice)
            if next(SMODS.find_card("j_goob_StarAce")) and random_number < card.ability.extra.sidesOfDice then
                local random_number_2 = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice)
                if random_number < random_number_2 then
                    random_number = random_number_2
                end
            end
            multGain = multGain + random_number
        end
            return {
                x_mult = multGain,
                colour = G.C.RED,
                card = card,
            }
        end
    end
}