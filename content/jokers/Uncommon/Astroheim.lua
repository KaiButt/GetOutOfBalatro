SMODS.Atlas {
    key = 'Astroheim',
    path = 'Astroheim.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Astroheim',
    name = 'Astroheim',
    atlas = 'Astroheim',
    pos = { x = 0, y = 0 },
    config = {extra = { amountToLevel = 1 }},
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = {  ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.amountToLevel } }
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
           SMODS.upgrade_poker_hands({level_up = card.ability.extra.amountToLevel, from = card})
        end
    end,
    calculate = function(self, card, context)
        
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                mult = G.GAME.hands[context.scoring_name].level,
                colour = G.C.RED,
                card = card,
            }
        end
        if context.end_of_round and context.main_eval and context.game_over == false and context.beat_boss then
            SMODS.upgrade_poker_hands({instant = true, level_up = card.ability.extra.amountToLevel, from = card})
        end
    end
}
