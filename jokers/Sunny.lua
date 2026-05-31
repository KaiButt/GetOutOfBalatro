SMODS.Atlas {
    key = 'Sunny',
    path = 'Sunny.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Sunny',
    unlocked = false,
    loc_txt = {
        name = 'Loyal Guardian Sunny',
        text = {
            'When this Joker, or an adjacent Joker would be debuffed',
            '{C:green}prevents it{}. Adjacent Jokers give {X:mult,C:white}X#1#{} Mult',
            'G.O.O.B Jokers give {X:mult,C:white}X#2#{} Mult instead',
        },
        unlock = {
            'Lose a run'
        }
    },
    name = 'Sunny',
    atlas = 'Sunny',
    pos = { x = 0, y = 0 },
    config = { extra = { x_mult_nongoob = 1.5, x_mult_goob = 2 } },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult_nongoob, center.ability.extra.x_mult_goob } }
    end,
    calculate = function(self, card, context)
        if context.debuff_card then
            local other_Joker_left, other_Joker_right = nil, nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    if (G.jokers.cards[i + 1] ~= nil) then
                        other_Joker_right = G.jokers.cards[i + 1]
                    end
                    if (G.jokers.cards[i - 1] ~= nil) then
                        other_Joker_left = G.jokers.cards[i - 1]
                    end
                end
            end
            if context.debuff_card and (context.debuff_card == card or context.debuff_card == other_Joker_right or context.debuff_card == other_Joker_left) then
                return { prevent_debuff = true }
            else
                return { prevent_debuff = false }
            end
        end
        if context.other_joker and card ~= context.other_joker then
            local other_Joker_left, other_Joker_right = nil, nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    if (G.jokers.cards[i + 1] ~= nil) then
                        other_Joker_right = G.jokers.cards[i + 1]
                    end
                    if (G.jokers.cards[i - 1] ~= nil) then
                        other_Joker_left = G.jokers.cards[i - 1]
                    end
                end
            end
            if (other_Joker_left ~= nil and context.other_joker == other_Joker_left) then
                if string.find(other_Joker_left.config.center.key, "j_goob") ~= nil then
                    return {
                        x_mult = card.ability.extra.x_mult_goob,
                        colour = G.C.RED,
                        card = card
                    }
                elseif string.find(other_Joker_left.config.center.key, "j_goob") == nil then
                    return {
                        x_mult = card.ability.extra.x_mult_nongoob,
                        colour = G.C.RED,
                        card = card
                    }
                end
            elseif other_Joker_right ~= nil and context.other_joker == other_Joker_right then
                if string.find(other_Joker_right.config.center.key, "j_goob") ~= nil then
                    return {
                        x_mult = card.ability.extra.x_mult_goob,
                        colour = G.C.RED,
                        card = card
                    }
                elseif string.find(other_Joker_right.config.center.key, "j_goob") == nil then
                    return {
                        x_mult = card.ability.extra.x_mult_nongoob,
                        colour = G.C.RED,
                        card = card
                    }
                end
            end
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'career_stat' and args.statname == 'c_losses' then
            return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 1
        end
        return false
    end
}
