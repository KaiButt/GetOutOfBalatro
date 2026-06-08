SMODS.Atlas {
    key = 'Presto',
    path = 'Presto.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Presto',
    name = 'Presto',
    atlas = 'Presto',
    pos = { x = 0, y = 0 },
    rarity = 1,
    config = {
        extra = {
            Mult = 1,
        },
    },
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Mult } }
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            local _card = SMODS.add_card {
                set = "Base",
                seal = "goob_WondrousMagic",
                key_append = "goob_Presto",
                area = G.deck
            }
            SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
        end
    end,
    pools = { ["goob"] = true },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_seal() == "goob_WondrousMagic" then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.Mult
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}
