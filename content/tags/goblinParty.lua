SMODS.Atlas {
    key = 'goblinParty',
    path = 'GoblinParty.png',
    px = 32,
    py = 32
}

SMODS.Tag {
    key = 'goblinParty',
    in_pool = function()
        return false
    end,
    atlas = 'goblinParty',
    name = 'goob-goblinParty',
    config = { type = "store_joker_create" },
    apply = function(self, tag, context)
        if context.type == "store_joker_create" then
            local _card
            if not next(SMODS.find_card("j_goob_Charles")) then
                while _card == nil or _card:is_rarity("Legendary") do
                    _card = SMODS.create_card({
                        set = 'goob',
                        legendary = false,
                        key_append = "goob_goblinParty",
                    })
                end
            else
                _card = SMODS.create_card({
                    set = 'goob',
                    key_append = "goob_goblinParty",
                })
            end
            create_shop_card_ui(_card, "Joker", context.area)
            _card.states.visible = false
            tag:yep("+", G.C.GREEN, function()
                _card:start_materialize()
                _card.ability.couponed = true
                _card:set_cost()
                return true
            end)
            tag.triggered = true
            return _card
        end
    end,
}
