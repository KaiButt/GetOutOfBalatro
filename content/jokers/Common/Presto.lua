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
            repetitions = 1,
        },
    },
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.repetitions } }
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            local _card = G.deck.cards[#G.deck.cards]
            _card:set_seal("goob_WondrousMagic")
        end
    end,
    pools = { ["goob"] = true, ["goobNL"] = true },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:get_seal() == "goob_WondrousMagic" then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end
}
