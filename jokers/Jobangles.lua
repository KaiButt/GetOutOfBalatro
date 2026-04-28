SMODS.Atlas {
	key = 'Jobangles',
	path = 'Jobangles.png',
	px = 71,
	py = 95
}

SMODS.Joker{
    key = 'Jobangles',
    loc_txt = {
        name = 'Jobangles',
        text = {
            'When {C:attention}Blind{} is selected a random card in deck',
            'gets {C:attention}destroyed{} and this joker',
            'gains {C:chips}chips{} equal to {C:chips}X#2#{} the rank destroyed',
            'extra {C:chips}chips{} granted to the card are also given to this joker',
            'Last card destroyed: {C:attention}#3#{} of {C:attention}#4#{}',
            '{C:inactive}(Current chip bonus:{C:chips} +#1#{}{C:inactive})'
        },
    },
    name = 'Jobangles',
    atlas = 'Jobangles',
	pos = { x = 0, y = 0 },
    config = {
        extra = {
            chipAmount = 0,
            chipBonus = 2,
            destroyed_rank = 'Ace',
            destroyed_suit = 'Peach',
        }
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pools = { ["goob"] = true},
    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.chipAmount, center.ability.extra.chipBonus, center.ability.extra.destroyed_rank, center.ability.extra.destroyed_suit} }
	end,
    calculate = function(self,card,context)
        if context.setting_blind then --destroy card
            if not context.blueprint then --blueprint doesn't destroy one
            local chosenCard = pseudorandom_element(G.playing_cards, pseudoseed('seed'))
            card.ability.extra.destroyed_rank = chosenCard.base.value
            card.ability.extra.destroyed_suit = chosenCard.base.suit
            if chosenCard.ability.name ~= 'Stone Card' then --stone cards don't have ranks
                card.ability.extra.chipAmount = card.ability.extra.chipAmount + (chosenCard.base.id*card.ability.extra.chipBonus) + chosenCard.ability.perma_bonus
            end
            if chosenCard.ability.name == 'Bonus' then -- bonus cards +30 chips
                card.ability.extra.chipAmount = card.ability.extra.chipAmount + 30
            end
            if chosenCard.ability.name == 'Stone Card' then -- stone cards + 50 chips
                card.ability.extra.chipAmount = card.ability.extra.chipAmount + 50 + chosenCard.ability.perma_bonus
            end
            if chosenCard.edition ~= nil then
            if chosenCard.edition.type == 'foil' then -- foil cards + 50 chips
                card.ability.extra.chipAmount = card.ability.extra.chipAmount + 50
            end
        end
            if chosenCard.ability.name == 'Gold Card' then --Easter egg gag clause, get a dollar if it destroys a gold card
                card:juice_up()
                return {
                    message = localize('$')..1,
                    ease_dollars(1),
                    colour = G.C.MONEY,
                    delay = 0.45, 
                    SMODS.destroy_cards(chosenCard)
                }
            end
            SMODS.destroy_cards(chosenCard)
            card:juice_up()
            return true
        end
    end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then --give chips, blueprint copies this part
            return {
                chips = card.ability.extra.chipAmount,
                colour = G.C.CHIPS,
                card = card
            }
    end
end
}
