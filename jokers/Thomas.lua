SMODS.Atlas {
    key = 'Thomas',
    path = 'Thomas.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Thomas',
    unlocked = false,
    loc_txt = {
        name = 'Thomas',
        text = {
            'Every discarded {C:attention}card{}',
            'permanently gains',
            '{C:chips}+#1#{} Chips when scored'
        },
        unlock = {
            "Discard a",
            "{E:1,C:attention}Flush Five",
        }
    },
    name = 'Thomas',
    atlas = 'Thomas',
    config = { extra = { chips = 4 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    pools = { ["goob"] = true },
    calculate = function(self, card, context)
        if context.discard then
            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
            card.ability.extra.chips
            print(G.PROFILES[G.SETTINGS.profile].career_stats['c_reroll'])
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'discard_custom' then
            local eval = evaluate_poker_hand(args.cards)
            
            if next(eval['Flush Five']) then
                    return true
            end
        end
        return false
    end
}
