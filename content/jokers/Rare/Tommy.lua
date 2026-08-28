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
    config = { extra = { chips = 220, joker_slot = -2} },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    display_size = { w = 71 * 1.4, h = 95 * 1.4 },
    pools = { ["Meme"] = true, ["goob"] = true, ["goobNL"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.chips, center.ability.extra.joker_slot} }
    end,
    add_to_deck = function(self, card, from_debuff)

        if not next(SMODS.find_card("j_goob_Marie"))then
            G.jokers:change_size(card.ability.extra.joker_slot)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card("j_goob_Marie")) then
            G.jokers:change_size(-card.ability.extra.joker_slot)
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                chips = card.ability.extra.chips,
                colour = G.C.CHIPS,
                card = card
            }
        end
        if context.card_added and context.card.ability.name == "Marie" and not next(SMODS.find_card("j_goob_Marie")) then
            G.jokers:change_size(-card.ability.extra.joker_slot)
        end
        if context.selling_card and context.card.ability.name == "Marie" and (G.GAME.marieAmount == nil or G.GAME.marieAmount == 0) then
            if(G.GAME.marieAmount ~= nil and G.GAME.marieAmount <= 0) then
                G.GAME.marieAmount = nil
            end
            G.jokers:change_size(card.ability.extra.joker_slot)
        end
    end
}
