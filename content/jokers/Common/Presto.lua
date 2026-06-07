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
            Mult = 0,
            scalingMult = 1,
        },
    },
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Mult, center.ability.extra.scalingMult } }
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
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_seal() == "goob_WondrousMagic" then
                card.ability.extra.Mult = card.ability.extra.Mult + card.ability.extra.scalingMult
                card:juice_up()
            end
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                mult = card.ability.extra.Mult,
                colour = G.C.RED,
                card = card,
            }
        end
    end
}
