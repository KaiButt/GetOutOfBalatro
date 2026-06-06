SMODS.Atlas {
    key = 'Mancomb',
    path = 'Mancomb.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Mancomb',
    unlocked = false,
    name = 'Mancomb',
    atlas = 'Mancomb',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            rerollBonus = 10,
            totalChips = 0
        },
    },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.rerollBonus, center.ability.extra.totalChips } }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.totalChips = card.ability.extra.totalChips + card.ability.extra.rerollBonus
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { center.ability.extra.totalChips } },
                colour = G.C.CHIPS,
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.totalChips
            }
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'run_redeem' then
            if G.GAME.used_vouchers['v_reroll_surplus'] and G.GAME.used_vouchers['v_reroll_glut'] then
                return true
            end
        end
    end
}
