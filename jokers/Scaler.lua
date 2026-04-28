SMODS.Atlas {
    key = 'Scaler',
    path = 'Scaler.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Scaler',
    loc_txt = {
        name = 'Scaler',
        text = {
            '{C:mult}+#1#{} Mult',
            'Gains {C:mult}+#2#{} Mult after every {C:attention}Boss Blind{}',
        },
    },
    name = "Scaler",
    atlas = "Scaler",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            Mult = 3,
            scalingMult = 3,
        },
    },
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    pools = { ["goob"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Mult, center.ability.extra.scalingMult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                mult = card.ability.extra.Mult,
                colour = G.C.RED,
                card = card,
            }
        end
        if context.end_of_round and context.main_eval and context.game_over == false and context.beat_boss and not context.blueprint then
            card.ability.extra.Mult = card.ability.extra.Mult + card.ability.extra.scalingMult
            return {
                message = "Scaled Up!",
                colour = G.C.RED,
                card = card,
            }
        end
    end
}
