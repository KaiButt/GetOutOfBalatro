SMODS.Atlas {
	key = 'Crownos',
	path = 'Crownos.png',
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'Crownos',
	unlocked = false,
	loc_txt = {
		name = 'Crownos',
		text = {
			'After completing the next {C:attention}Blind{}',
			'{C:attention}-#1#{} ante, {C:dark_edition}+#2#{} Joker Slot,',
			'and {C:red,E:2}self destructs{}'
		},
		unlock = {
			'Beat ante {C:attention}-1{}'
		}
	},
	name = 'Crownos',
	atlas = 'Crownos',
	pos = { x = 0, y = 0 },
	rarity = 4,
	config = { extra = { amountToBack = 1, phoenixBonus = 1} },
	cost = 20,
	in_pool = function() 
        if G.GAME.crownos_used == false or G.GAME.crownos_used == nil then
            return true
        else
            return false
        end
    end,
	loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.amountToBack, center.ability.extra.phoenixBonus} }
    end,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = true,
	pools = { ["goob"] = true },
	calculate = function(self, card, context)
		if context.end_of_round and context.main_eval and context.game_over == false then
			G.GAME.crownos_used = true
            ease_ante(-card.ability.extra.amountToBack)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.amountToBack
            G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.phoenixBonus
            SMODS.destroy_cards(card, nil, true)
        end
	end,
	check_for_unlock = function(self, args) 
        if args.type == 'round_win' then
            return (G.GAME.round_resets.blind_ante == -1 and G.GAME.blind.boss)
        end
    end
}