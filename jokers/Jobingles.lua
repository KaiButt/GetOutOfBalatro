SMODS.Atlas {
	key = 'Jobingles',
	path = 'Jobingles.png',
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'Jobingles',
	loc_txt = {
		name = 'Jobingles',
		text = {
			'Adds #1# card',
			'with an {X:grey,C:edition}edition{} to deck when',
			'{C:attention}Blind{} is selected',
			'Last card added: {C:attention}#4#{} of {C:attention}#5#{}',
			'{C:inactive}(Max {C:attention}#2#{C:inactive} cards)',
			'played cards with an {X:grey,C:edition}edition{} each give',
			'{X:mult,C:white}X#3#{} Mult when scored'
		},
	},
	name = 'Jobingles',
	atlas = 'Jobingles',
	pos = { x = 0, y = 0 },
	config = { --default config: 2 on selection, x2 on play, 40 cap
		extra = {
			amount = 1,
			x_mult = 2,
			kai_gift = true,
			last_rank = 'King',
			last_suit = 'Peach',
		},
		immutable = {
			cacap = 40,
		},
	},
	rarity = 4,
	cost = 20,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	pools = { ["goob"] = true },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.amount, center.ability.immutable.cacap, center.ability.extra.x_mult, center.ability.extra.last_rank, center.ability.extra.last_suit } }
	end,
	calculate = function(self, card, context)
		-- when blind is selected, add a random card with an edition to deck
		if context.setting_blind then
			if card.ability.extra.amount > card.ability.immutable.cacap then card.ability.extra.amount = card.ability
				.immutable.cacap end
			for i = 1, card.ability.extra.amount, 1 do -- loop card generation
				if card.ability.extra.kai_gift == true then
					local _card = SMODS.add_card { set = "Playing Card", key_append = "goob_append", edition = 'e_negative', area = G.deck, enhanced_poll = 1 }
					card.ability.extra.kai_gift = false
					card:juice_up()
					card.ability.extra.last_rank = _card.base.value
					card.ability.extra.last_suit = _card.base.suit
					SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
				else
					local random_edition = SMODS.poll_edition { key = "goob_seed", guaranteed = true, no_negative = true }
					local _card = SMODS.add_card { set = "Playing Card", key_append = "goob_append", edition = random_edition, area = G.deck, enhanced_poll = 1 }
					card:juice_up()
					card.ability.extra.last_rank = _card.base.value
					card.ability.extra.last_suit = _card.base.suit
					SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
				end
			end
		end
		if context.individual and context.cardarea == G.play then -- when you play a edition'd card, x2 mult
			if context.other_card.edition then
				return {
					x_mult = card.ability.extra.x_mult,
					colour = G.C.RED,
					card = card,
				}
			end
		end
	end
}
