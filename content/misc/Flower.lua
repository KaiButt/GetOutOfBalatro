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
    config = {bonus = 15, mult = 2},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus, card.ability.mult } }
    end,
}