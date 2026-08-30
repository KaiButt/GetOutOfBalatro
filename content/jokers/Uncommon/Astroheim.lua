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
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.game_over == false and context.beat_boss then
            SMODS.upgrade_poker_hands({hands = GET_mostplayed_hand(), level_up = card.ability.extra.amountToLevel, from = card})
            card:juice_up()
        end
    end
}
