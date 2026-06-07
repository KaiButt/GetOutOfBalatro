SMODS.Atlas {
    key = 'Kai',
    path = 'Kai.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Kai',
    name = 'Kai',
    atlas = 'Kai',
    pos = { x = 0, y = 0 },
    rarity = 4,
    config = {
        extra = {
            Mult = 0,
            scalingMult = 1,
        },
    },
    cost = 20,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Mult, center.ability.extra.scalingMult } }
    end,
    add_to_deck = function(self, card, from_debuff)
        local _card = G.deck.cards[#G.deck.cards]
        _card:set_seal("goob_WondrousMagic")
    end,
    pools = { ["goob"] = true },
    calculate = function(self, card, context)
        if context.hand_drawn and context.first_hand_drawn then
            if #G.deck.cards ~= 0 then
                local _card = G.deck.cards[#G.deck.cards]
                _card:set_seal("goob_WondrousMagic")
            end
        end
    end
}
