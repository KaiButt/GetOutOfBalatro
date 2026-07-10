SMODS.Atlas {
    key = 'Sgt',
    path = 'Sgt.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Sgt',
    name = 'Sgt',
    atlas = 'Sgt',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 1.5
        },
        immutable = {
            negative_rate = 2.5
        },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.immutable.negative_rate, center.ability.extra.x_mult } }
    end,
    pools = { ["goob"] = true, ["goobNL"] = true },
    add_to_deck = function(self, card, from_debuff)
        local oldenegativegetweight = G.P_CENTERS.e_negative.get_weight
        SMODS.Edition:take_ownership('e_negative', {
            get_weight = function(self)
                local weight = oldenegativegetweight(self)
                for k, v in pairs(SMODS.find_card('j_goob_Sgt')) do
                    weight = weight * card.ability.immutable.negative_rate
                end
                return weight
            end
        }, true)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.Edition:take_ownership('e_negative', {
            get_weight = function(self)
                for k, v in pairs(SMODS.find_card('j_goob_Sgt')) do
                    weight = weight / card.ability.immutable.negative_rate
                end
                return weight
            end
        }, true)
    end,
    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.edition and card ~= context.other_joker and context.other_joker.edition.negative then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end,
}
