SMODS.Atlas {
    key = 'Barry',
    path = 'Barry.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Barry',
    name = "Barry",
    atlas = "Barry",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            Mult = 0,
            scalingMult = 2,
            totalityBonus = 1
        },
    },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true },
    attributes = { "mult", "scaling" },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Mult, center.ability.extra.scalingMult, center.ability.extra.totalityBonus } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                mult = card.ability.extra.Mult,
                colour = G.C.RED,
                card = card,
            }
        end
        if context.end_of_round and context.main_eval and context.game_over == false and (#G.jokers.cards == G.jokers.config.card_limit or #G.consumeables.cards == G.consumeables.config.card_limit) and not context.blueprint then
            if (#G.consumeables.cards < G.consumeables.config.card_limit) or (#G.jokers.cards < G.jokers.config.card_limit) then
                card.ability.extra.Mult = card.ability.extra.Mult + card.ability.extra.scalingMult
                return {
                    message = "What a collection!",
                    colour = G.C.RED,
                    delay = 1.15,
                    card = card,
                }
            else
                card.ability.extra.Mult = card.ability.extra.Mult + card.ability.extra.scalingMult +
                    card.ability.extra.totalityBonus
                return {
                    message = "Complete collection!",
                    colour = G.C.RED,
                    delay = 1.15,
                    card = card
                }
            end
        end
    end
}
