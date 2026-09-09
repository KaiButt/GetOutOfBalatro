SMODS.Atlas {
    key = 'BingleCard',
    path = 'BingleCard.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'BingleFace',
    path = 'BingleFace.png',
    px = 71,
    py = 95
}
SMODS.Joker {
	key = 'Jobingles',
	name = 'Jobingles',
	atlas = 'BingleCard',
	pos = { x = 0, y = 0 },
	config = {
		extra = {
			xmultAddition = 1,
			xmultHandAddition = 1,
		},
	},
	soul_atlas = 'BingleFace',
    soul_pos = { x = 0, y = 0 },
	rarity = 4,
	cost = 20,
	unlocked = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	pools = { ["goob"] = true, ["goobL"] = true },
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Other", key = "goob_upgrade", vars = { center.ability.extra.xmultAddition, center.ability.extra.xmultHandAddition } }
		info_queue[#info_queue + 1] = { set = "Other", key = "BingleWhacky"}
	end,
	attributes = { "hands", "perma_bonus" },
	calculate = function(self, card, context)
		 if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
		if context.before and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
			context.full_hand[1].ability.perma_x_mult = (context.full_hand[1].ability.perma_x_mult or 0) +
				card.ability.extra.xmultAddition
			context.full_hand[1].ability.perma_h_x_mult = (context.full_hand[1].ability.perma_h_x_mult or 0) +
				card.ability.extra.xmultHandAddition
				if context.full_hand[1].edition == nil or context.full_hand[1].edition.key ~= "e_goob_Whacky" then
					context.full_hand[1]:set_edition("e_goob_Whacky")
				end
		end
	end,
	check_for_unlock = function(self, args)
		if args.type == 'win_challenge' and G.GAME.challenge == 'c_goob_Whacky_Challenge' then
            return true
        end
	end
}
