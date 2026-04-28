SMODS.Atlas {
    key = 'Fox',
    path = 'Fox.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Fox',
    loc_txt = {
        name = 'Blessed Fox',
        text = {
            'When gained, creates a random {X:grey,C:edition}negative{} G.O.O.B Joker',
            'Other G.O.O.B Jokers each give {X:mult,C:white}X#1#{} Mult',
        }
    },
    name = 'Fox',
    atlas = 'Fox',
    pos = { x = 0, y = 0 },
    config = { extra = { x_mult = 1.5 } },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult } }
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.add_card {
            set = 'goob',
            key_append = "bff",
            edition = "e_negative"
        }
    end,
    calculate = function(self, card, context)
        if context.other_joker and card ~= context.other_joker and string.find(context.other_joker.config.center.key, "j_goob") ~= nil then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end
}
