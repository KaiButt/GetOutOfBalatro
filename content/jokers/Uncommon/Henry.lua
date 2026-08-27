SMODS.Atlas {
    key = 'Henry',
    path = 'Henry.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Henry',
    name = 'Henry',
    atlas = 'Henry',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            multPool = 0,
            multLoss = -3,
        }
    },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    in_pool = function()
        if G.GAME.soulless == nil or G.GAME.soulless == false then
            return true
        else
            return false
        end
    end,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.multLoss, center.ability.extra.multPool } }
    end,
    pools = { ["goob"] = true, ["goobNL"] = true },
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if G.GAME.blind:get_type() == 'Boss' then
                if not context.blueprint then
                    return {
                        mult = card.ability.extra.multPool,
                        colour = G.C.RED,
                        card = card,
                    }
                end
            else
                card.ability.extra.multPool = card.ability.extra.multPool + math.abs(card.ability.extra.multLoss)
                if not next(SMODS.find_card("j_goob_Marie")) then
                    return {
                        mult = card.ability.extra.multLoss,
                        colour = G.C.RED,
                        card = card,
                    }
                end
            end
        end
    end
}
