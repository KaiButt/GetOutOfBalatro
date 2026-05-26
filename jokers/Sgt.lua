SMODS.Atlas {
    key = 'Sgt',
    path = 'Sgt.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Sgt',
    loc_txt = {
        name = 'Sgt',
        text = {
            '{X:grey,C:edition}Negative{} Jokers are {C:attention}#1#X{} more likely to show up',
            'Other {X:grey,C:edition}Negative{} Jokers gives {X:mult,C:white}X#2#{} Mult',
        }
    },
    name = 'Sgt',
    atlas = 'Sgt',
    pos = { x = 0, y = 0 },
    config = { extra = { negative_rate = 50, x_mult = 1.5} },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
       return { vars = { center.ability.extra.negative_rate, center.ability.extra.x_mult } }
    end,
    pools = { ["goob"] = true },
    add_to_deck = function(self, card, from_debuff)
        SMODS.Edition:take_ownership("negative", {
            get_weight = function(self)
                return self.weight * (card.ability.extra.negative_rate)
            end,
        }, true)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.Edition:take_ownership("negative", {
            get_weight = function(self)
                return self.weight / (card.ability.extra.negative_rate)
            end,
        }, true)
    end,
    calculate = function(self, card, context)
        if context.other_joker and card ~= context.other_joker and context.other_joker.edition.type == 'negative' then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end,
}