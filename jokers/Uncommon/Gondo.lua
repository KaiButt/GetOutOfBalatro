SMODS.Atlas {
    key = 'Gondo',
    path = 'Gondo.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Gondo',
    name = "Gondo",
    atlas = "Gondo",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            shopToAdd = 1,
        },
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    pools = { ["goob"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.shopToAdd} }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                change_shop_size(card.ability.extra.shopToAdd)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                change_shop_size(-card.ability.extra.shopToAdd)
                return true
            end
        }))
    end,
    calculate = function(self, card, context)

    end
}