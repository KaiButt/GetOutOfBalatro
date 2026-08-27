SMODS.Atlas {
	key = 'Crownos',
	path = 'Crownos.png',
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'Crownos',
	unlocked = false,
	name = 'Crownos',
	atlas = 'Crownos',
	pos = { x = 0, y = 0 },
	rarity = 4,
	config = { extra = { amountToBack = 1, phoenixBonus = 1} },
	cost = 20,
	in_pool = function() 
        if G.GAME.crownos_used == false or G.GAME.crownos_used == nil or next(SMODS.find_card('j_vremade_ring_master')) or next(SMODS.find_card('j_goob_Marie')) then --showmen and marie will let him reappear
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
	pools = { ["goob"] = true, ["goobL"] = true},
	calculate = function(self, card, context)
		if context.selling_self then
			if not next(SMODS.find_card("j_goob_Marie")) then
				G.GAME.crownos_used = true
			end
            ease_ante(-card.ability.extra.amountToBack)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.amountToBack
            G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.phoenixBonus
        end
	end,
	check_for_unlock = function(self, args) 
        if args.type == 'round_win' then
            return (G.GAME.round_resets.blind_ante == -1 and G.GAME.blind.boss)
        end
    end
}