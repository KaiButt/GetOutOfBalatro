SMODS.Atlas {
	key = 'Jobingles',
	path = 'Jobingles.png',
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'Jobingles',
	name = 'Jobingles',
	atlas = 'Jobingles',
	pos = { x = 0, y = 0 },
	config = {
		extra = {
			xmultAddition = 1,
			xmultHandAddition = 1,
			performedMagic = false
		},
	},
	rarity = 4,
	cost = 20,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	pools = { ["goob"] = true, ["goobL"] = true },
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Other", key = "goob_upgrade", vars = { center.ability.extra.xmultAddition, center.ability.extra.xmultHandAddition } }
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.balloonAnimal ~= nil and not next(SMODS.find_card("j_goob_Jobingles")) then G.GAME.balloonAnimal = nil end
	end,
	calculate = function(self, card, context)
		if context.before and #context.full_hand == 1 and G.GAME.balloonAnimal == nil then
			context.full_hand[1].ability.perma_x_mult = (context.full_hand[1].ability.perma_x_mult or 0) +
				card.ability.extra.xmultAddition
			context.full_hand[1].ability.perma_h_x_mult = (context.full_hand[1].ability.perma_h_x_mult or 0) +
				card.ability.extra.xmultHandAddition
			context.full_hand[1]:set_edition("e_negative")
			G.GAME.balloonAnimal = context.full_hand[1]
			card.ability.extra.balloonAnimal = context.full_hand[1]
			card.ability.extra.performedMagic = true
			return {
				message = 'For my next trick..',
				delay = 1.3,
				sound = 'voice' .. math.random(1, 11),
				G.SPEEDFACTOR * (math.random() * 0.2 + 1),
				0.5,
			}
		end
		if context.before and card.ability.extra.performedMagic == false and G.GAME.balloonAnimal ~= nil then
			for _, scored_card in ipairs(context.scoring_hand) do
				if scored_card == G.GAME.balloonAnimal then
					scored_card.ability.perma_x_mult = (scored_card.ability.perma_x_mult or 0) +
						card.ability.extra.xmultAddition
					scored_card.ability.perma_h_x_mult = (scored_card.ability.perma_h_x_mult or 0) +
						card.ability.extra.xmultHandAddition
					card.ability.extra.performedMagic = true
					return {
						message = 'Wow, look at that magic!',
						delay = 1.3,
						sound = 'voice' .. math.random(1, 11),
						G.SPEEDFACTOR * (math.random() * 0.2 + 1),
						0.5,
					}
				end
			end
		end
		if context.remove_playing_cards then
			for _, remove_card in ipairs(context.removed) do
				if remove_card == G.GAME.balloonAnimal then
					local newAnimal = SMODS.copy_card(remove_card)
					G.GAME.balloonAnimal = newAnimal
				end
			end
			return {
				message = 'Watch that card, reappear!',
				delay = 1.3,
				sound = 'voice' .. math.random(1, 11),
				G.SPEEDFACTOR * (math.random() * 0.2 + 1),
				0.5,
			}
		end
		if context.stay_flipped and context.from_area == G.play and context.other_card == G.GAME.balloonAnimal then
			if context.other_card.debuff == true then
				return {
					message = 'Whoops I slipped!',
					delay = 1.2,
					sound = 'voice' .. math.random(1, 11),
					G.SPEEDFACTOR * (math.random() * 0.2 + 1),
					0.5,
				}
			else
				return {
					message = 'Watch Me Juggle!',
					delay = 1.2,
					sound = 'voice' .. math.random(1, 11),
					G.SPEEDFACTOR * (math.random() * 0.2 + 1),
					0.5,
					modify = { to_area = G.hand },
				}
			end
		end
	end
}
