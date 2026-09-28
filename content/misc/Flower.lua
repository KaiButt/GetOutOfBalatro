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
    config = {repetition = 1, mult = 1},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.repetition, card.ability.mult } }
    end,
    calculate = function(self, card, context) 
        if context.repetition and context.cardarea == G.play then
            return {
                repetitions = card.ability.repetition
            }
        end
    end
}