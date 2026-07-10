SMODS.Atlas {
    key = 'Yokomo',
    path = 'Yokomo.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Yokomo',
    unlocked = false,
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
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true },
    calculate = function(self, card, context)
        if context.before then
            for _, scored_card in ipairs(context.scoring_hand) do
                if SMODS.pseudorandom_probability(card, 'j_goob_Yokomo', card.ability.extra.numerator, card.ability.extra.denominator) then
                    if scored_card.ability.name == "Default Base" then
                        local _card = scored_card
                        if _card.facing ~= 'back' then
                            _card:flip()
                            play_sound('card1', 0.4)
                            card.ability.extra.jokerFlipped = true
                        end
                        local random_enhancement = SMODS.poll_enhancement { key = 'j_goob_Yokomo', guaranteed = true }
                        _card:set_ability(random_enhancement)
                        if _card.facing == 'back' and card.ability.extra.jokerFlipped == true then
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.25,
                                func = function()
                                    _card:flip()
                                    play_sound('card1', 0.4)
                                    return true
                                end
                            }))
                            card.ability.extra.jokerFlipped = false
                        end
                    elseif scored_card.ability.name == "Stone Card" then -- stone cards give 50
                        context.other_card.ability.perma_bonus = (scored_card.ability.perma_bonus or 0) + 50
                    else
                        scored_card.ability.perma_bonus = (scored_card.ability.perma_bonus or 0) + context.other_card.base.id
                    end
                end
            end
        end
    end,
    check_for_unlock = function(self, args)
        local trueEnhancement
        if args.type == 'modify_deck' then
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if playing_card.ability.set ~= 'Enhanced' then
                    trueEnhancement = false
                    break
                end
                trueEnhancement = true
            end
            return trueEnhancement
        end
    end
}
