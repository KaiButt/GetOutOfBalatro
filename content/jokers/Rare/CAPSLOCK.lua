SMODS.Atlas {
    key = 'MASTERCAPSLOCK',
    path = 'MASTERCAPSLOCK.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'MASTERCAPSLOCK',
    name = 'MASTERCAPSLOCK',
    atlas = 'MASTERCAPSLOCK',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 7,
    config = {
        immutable = {
            amountToModify = 1,
        },
    },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.immutable.amountToModify } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true },
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.game_over == false then
            local other_Joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    if (G.jokers.cards[i + 1] ~= nil) then
                        other_Joker = G.jokers.cards[i + 1]
                    end
                end
            end
            Spectrallib.manipulate(other_Joker,
                {value = card.ability.immutable.amountToModify, type = "+"})
            if other_Joker ~= nil then
                return {
                    message = 'CAPSLOCK ON',
                    colour = G.C.GREEN,
                    delay = 1.2,
                }
            end
        end
    end,
}
