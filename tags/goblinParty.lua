SMODS.Atlas {
    key = 'goblinParty',
    path = 'GoblinParty.png',
    px = 32,
    py = 32
}

SMODS.Tag {
    key = 'goblinParty',
    loc_txt = {
        name = 'Goblin Party!',
        text = {
            'Shop has a free {C:attention}G.O.O.B{} joker'
        }
    },
    in_pool = function()
        return false
    end,
    atlas = 'goblinParty',
    name = 'goob-goblinParty',
    config = { type = "store_joker_create"},
    apply = function(self, tag, context)
        if context.type == "store_joker_create" then
            local card = create_card("goob", context.area, nil, nil, nil, nil, nil, "goob_goblinParty")
            create_shop_card_ui(card, "Joker", context.area)
            card.states.visible = false
            tag:yep("+", G.C.GREEN, function()
				card:start_materialize()
				card.ability.couponed = true
				card:set_cost()
				return true
			end)
            tag.triggered = true
            return card
        end
    end,
}