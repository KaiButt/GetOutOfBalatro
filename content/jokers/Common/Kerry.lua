SMODS.Atlas {
    key = 'Kerry',
    path = 'Kerry.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Kerry',
    name = 'Kerry',
    atlas = 'Kerry',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            multGain = 10,
        }
    },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.multGain } }
    end,
    rarity = 1,
    cost = 5,
    order = 2,
    blueprint_compat = true,
    eternal_compat = true, -- still debating on these stickers
    perishable_compat = true,
    pools = { ["goob"] = true },
    calculate = function(self, card, context)
        if (context.joker_type_destroyed and context.card == card) and not context.blueprint then
            local editionType = nil
            if card.edition ~= nil then
                editionType = "e_" .. card.edition.type
            end
            if editionType ~= nil then
                SMODS.add_card { key = "j_goob_Kerry_rage", edition = editionType }
            else
                SMODS.add_card { key = "j_goob_Kerry_rage", no_edition = true }
            end
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                mult = card.ability.extra.multGain,
                colour = G.C.RED,
                card = card,
            }
        end
    end,
}
local card_remove_from_deck_ref = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    local ret = card_remove_from_deck_ref(self, from_debuff)
    if self.ability.name == 'Kerry' and from_debuff then
        local editionType = nil
        if self.edition ~= nil then
            editionType = "e_" .. self.edition.type
        end
        SMODS.destroy_cards(self)
        if editionType ~= nil then
            SMODS.add_card { key = "j_goob_Kerry_rage", edition = editionType }
        else
            SMODS.add_card { key = "j_goob_Kerry_rage", no_edition = true }
        end
    end
    return ret
end


