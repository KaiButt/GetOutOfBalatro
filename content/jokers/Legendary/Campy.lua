SMODS.Atlas {
	key = 'CampyCard',
	path = 'CampyCard.png',
	px = 71,
	py = 95
}
SMODS.Atlas {
    key = 'CampyFace',
    path = 'CampyFace.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Campy',
    name = "Campy",
    atlas = "CampyCard",
    pos = { x = 0, y = 0 },
    soul_atlas = 'CampyFace',
    soul_pos = { x = 0, y = 0.05 },
    rarity = 4,
    cost = 20,
    blueprint_compat = false,
    pools = { ["goob"] = true, ["goobL"] = true},
    calculate = function(self, card, context)
        if context.open_booster then
            if #G.deck.cards ~= 0 then
                G.E_MANAGER:add_event(Event({
					func = function()
						SMODS.draw_cards(#G.deck.cards)
						return true
					end,
				}))
            end
            return {
                message = "Shuffle Shuffle!",
                delay = 1
            }
        end
    end
}