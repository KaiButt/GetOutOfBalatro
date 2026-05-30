SMODS.Atlas {
    key = 'Gelbon',
    path = 'Gelbon.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Gelbon',
    unlocked = false,
    loc_txt = {
        name = 'Gelbon The Nerd',
        text = {
            'Gains {C:mult}+#2#{} Mult',
            'if played hand',
            'contains a {C:attention}Straight{}',
            '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)',
        },
        unlock = {
            'Win a run with a {C:attention}Straight{}'
        }
    },
    name = 'Gelbon',
    atlas = 'Gelbon',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            mult = 0,
            scalingMult = 4
        }
    },
    rarity = 1,
     loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.mult, center.ability.extra.scalingMult } }
    end,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true },
    calculate = function(self, card, context)
       if context.before and not context.blueprint and next(context.poker_hands['Straight']) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.scalingMult
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'round_win' then
            return (G.GAME.last_hand_played == 'Straight' or G.GAME.last_hand_played == 'Straight Flush') and G.GAME.blind.boss
        end
        return false
    end
}