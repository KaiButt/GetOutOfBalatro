SMODS.Atlas {
    key = 'flower',
    path = 'Flower.png',
    px = 71,
    py = 95
}

SMODS.Enhancement {
    key = 'flower',
    atlas = "flower",
    pos = { x = 0, y = 0 },
    config = {extra = {repetitionDieToRoll = 1, repetitionSidesOfDie = 3, mult = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitionDieToRoll, card.ability.extra.repetitionSidesOfDie, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context) 
        if context.repetition and context.cardarea == G.play then
            return {
                repetitions = roll_die(card.ability.extra.repetitionDieToRoll, card.ability.extra.repetitionSidesOfDie )
            }
        end
    end
}