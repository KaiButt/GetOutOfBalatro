SMODS.Atlas {
    key = 'Greg',
    path = 'Greg.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Greg',
    loc_txt = {
        name = 'Greg',
        text = {
            '{C:attention}+#1#{} hand size',
        }
    },
    name = 'Greg',
    atlas = 'Greg',
    pos = { x = 0, y = 0 },
    config = { extra = { handSize = 2 } },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.handSize } }
    end,
    in_pool = function() 
        if G.GAME.harmony_destroyed then
            return true
        else
            return false
        end
    end,
    pools = { ["goob"] = true },
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.handSize)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.handSize)
    end,
}