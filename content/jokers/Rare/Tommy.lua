SMODS.Atlas {
    key = 'Tommy',
    path = 'Tommy.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Tommy',
    name = 'Tommy',
    atlas = 'Tommy',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 7,
    config = { extra = { chips = 250, joker_slot = -1, consume_slot = -1 } },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    display_size = {w = 71 * 1.3, h = 95 * 1.3},
    pools = { ["Meme"] = true, ["goob"] = true, ["goobNL"] = true },
    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.chips, center.ability.extra.joker_slot, center.ability.extra.consume_slot} }
	end,
    add_to_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consume_slot
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slot
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.consume_slot
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slot
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                chips = card.ability.extra.chips,
                colour = G.C.CHIPS,
                card = card
            }
        end
    end
}
