SMODS.Atlas {
    key = 'Deathkill',
    path = 'Deathkill.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Deathkill',
    unlocked = false,
    name = 'Deathkill',
    atlas = 'Deathkill',
    pos = { x = 0, y = 0 },
    config = { extra = { x_mult = 2.5 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false, -- sounds unfun
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.GAME.dollars > 0 then
                return {
                    message = 'DEATHKILL ONLINE',
                    ease_dollars(-G.GAME.dollars, true),
                    colour = G.C.MONEY,
                    delay = 1.2,
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end,
    check_for_unlock = function(self,args)
        return args.type == 'win_custom' and G.GAME.dollars==0
    end
}
