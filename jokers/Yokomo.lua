SMODS.Atlas {
    key = 'Yokomo',
    path = 'Yokomo.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Yokomo',
    loc_txt = {
        name = 'Yokomo',
        text = {
            'When a card is Scored, {C:green}#1# in #2#{} chance to give it',
            'a random {C:attention}Enhancement{}. If it already has one,',
            'it gains permanent Chips equal to its base Chip amount instead.'
        }
    },
    name = 'Yokomo',
    atlas = 'Yokomo',
    pos = { x = 0, y = 0 },
    config = { extra = { numerator = 1, denominator = 4, jokerFlipped = false } },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, center)
        local num, denom = SMODS.get_probability_vars(center, center.ability.extra.numerator,
            center.ability.extra.denominator)
        return { vars = { num, denom } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'j_goob_Sohikosa', card.ability.extra.numerator, card.ability.extra.denominator) then
                if context.other_card.ability.name == "Default Base" then
                    local _card = context.other_card
                    if _card.facing ~= 'back' then
                        _card:flip()
                        play_sound('card1', 0.6)
                        card.ability.extra.jokerFlipped = true
                    end
                    local random_enhancement = SMODS.poll_enhancement { key = "modprefix_seed", guaranteed = true }
                    _card:set_ability(random_enhancement)
                    if _card.facing == 'back' and card.ability.extra.jokerFlipped == true then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.2,
                            func = function()
                                _card:flip()
                                play_sound('card1', 0.6)
                                return true
                            end
                        }))
                    end
                elseif context.other_card.ability.name == "Stone Card" then -- stone cards give 50
                    context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + 50
                    return {
                        message = 'Upgrade!',
                        colour = G.C.CHIPS
                    }
                else
                    context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                        context.other_card.base.id
                    return {
                        message = 'Upgrade!',
                        colour = G.C.CHIPS
                    }
                end
            end
        end
    end
}
