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
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true },
    calculate = function(self, card, context)
        if context.ending_shop then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = SMODS.add_card { key = "c_goob_Vortex" }
                    _card.cost = 0
                    _card.sell_cost = 0
                    return true
                end
            }))
            return {
                message = "Wonderful!"
            }
        end
    end
}
