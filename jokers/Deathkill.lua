SMODS.Atlas {
    key = 'Deathkill',
    path = 'Deathkill.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Deathkill',
    loc_txt = {
        name = 'Deathkill 4.0',
        text = {
            '{X:mult,C:white}X#1#{} Mult',
            'When {C:attention}Blind{} is selected',
            '{C:attention}Lose all {C:gold}Gold{}'
        }
    },
    name = 'Deathkill',
    atlas = 'Deathkill',
    pos = { x = 0, y = 0 },
    config = { extra = { x_mult = 3 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false, -- sounds unfun
    perishable_compat = true,
    pools = { ["goob"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult } }
    end,
    weight = 10,
    get_weight = function(self)
        if next(SMODS.find_card("j_goob_Boblin")) then
            return self.weight * 10000
        elseif not next(SMODS.find_card("j_goob_Boblin")) then
            return self.weight
        end
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.GAME.dollars > 0 then
                return {
                    message = 'DEATHKILL ONLINE',
                    ease_dollars(-G.GAME.dollars),
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
    end
}
