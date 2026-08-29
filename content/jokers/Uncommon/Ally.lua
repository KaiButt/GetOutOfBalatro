SMODS.Atlas {
    key = 'Ally',
    path = 'Ally.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Ally',
    name = "Ally",
    atlas = "Ally",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            Gold = 2,
        },
    },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Gold } }
    end,
    calculate = function(self, card, context)
        if context.goob_dice_rolled then
           return {
                message = localize('$')..card.ability.extra.Gold,
                ease_dollars(card.ability.extra.Gold),
                colour = G.C.MONEY,
            }
        end
    end
}
