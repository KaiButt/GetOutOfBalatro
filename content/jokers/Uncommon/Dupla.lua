SMODS.Atlas {
    key = 'Dupla',
    path = 'Dupla.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Dupla',
    name = 'Dupla',
    atlas = 'Dupla',
    unlocked = false,
    pos = { x = 0, y = 0 },
    rarity = 2,
    config = { 
		extra = {
			dup = 1
		},
	},
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.dup } }
	end,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, other_card in pairs(G.I.CARD) do
                    if other_card.set_cost then other_card:set_cost() end
                end
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, other_card in pairs(G.I.CARD) do
                    if other_card.set_cost then other_card:set_cost() end
                end
                return true
            end
        }))
    end,
    calculate = function(self, card, context)
        if context.playing_card_added then
            for _, playing_card in ipairs(context.cards) do
                for i=1, card.ability.extra.dup, 1 do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local _card = copy_card(playing_card, nil, nil, G.playing_card)
                        _card:add_to_deck()
                        table.insert(G.playing_cards, _card)
                        G.deck:emplace(_card)
                        return true
                    end
                }))
            end
            end
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'run_redeem' then
            if G.GAME.used_vouchers['v_magic_trick'] and G.GAME.used_vouchers['v_illusion'] then
                return true
            end
        end
    end
}
local card_set_cost_value_ref = Card.set_cost_value
function Card:set_cost_value(...)
    local ret = card_set_cost_value_ref(self, ...)
    if next(SMODS.find_card("j_goob_Dupla")) then
        if ((self.ability.set == 'Default' or self.ability.set == 'Enhanced') or (self.ability.set == 'Booster' and self.config.center.kind == 'Standard')) then self.cost = 0 end
    end
    return ret
end
