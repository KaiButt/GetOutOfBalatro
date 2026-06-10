SMODS.Atlas {
    key = 'Skull',
    path = 'Skull.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Skull',
    unlocked = false,
    name = "Skull",
    atlas = "Skull",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            multGain = 0,
            scalingMult = 2,
        },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.multGain, center.ability.extra.scalingMult } }
    end,
    calculate = function(self, card, context)
        if context.selling_card and not context.selling_self and context.card.ability.set == "Joker" and not context.blueprint then
            card.ability.extra.multGain = card.ability.extra.multGain + card.ability.extra.scalingMult
            return {
                message = 'Skull Appeased',
                colour = G.C.RED,
                delay = 1
            }
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                mult = card.ability.extra.multGain,
                colour = G.C.RED,
                card = card,
            }
        end
    end,
    locked_loc_vars = function(self, info_queue, card)
        return { vars = { G.PROFILES[G.SETTINGS.profile].career_stats.c_jokers_sold } }
    end,
    check_for_unlock = function(self, args)
        if args.type == 'career_stat' and args.statname == 'c_jokers_sold' then
            return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 30
        end
        return false
    end
}