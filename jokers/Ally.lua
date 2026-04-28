SMODS.Atlas {
    key = 'Ally',
    path = 'Ally.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Ally',
    loc_txt = {
        name = 'Gamblin\' Sage',
        text = {
            'When {C:attention}Blind{} is selected',
            'Rolls {C:attention}#1#d#2#{}',
            'On a #2#, gains {C:gold}#3#{} Gold',
            'and disables the current or next {C:attention}Boss Blind{}',
            '{C:inactive}(Increases the{} {C:attention}minimum roll{} {C:inactive}on failure until success){}'
        },
    },
    name = "Ally",
    atlas = "Ally",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            diceToRoll = 1,
            sidesOfDice = 8,
            goldAward = 8,
            pityBonus = 0,
            locking_in = false,
            random_number = 0, -- unncessary, probably
        },
    },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    pools = { ["goob"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.diceToRoll, center.ability.extra.sidesOfDice, center.ability.extra.goldAward } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.random_number = 0
            if card.ability.extra.locking_in == true and G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
                card.ability.extra.locking_in = false
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                    { message = localize('ph_boss_disabled') })
                G.GAME.blind:disable()
            end
            for i = 1, card.ability.extra.diceToRoll, 1 do
                card.ability.extra.random_number = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice) + card.ability.extra.pityBonus
                if next(SMODS.find_card("j_goob_StarAce")) and card.ability.extra.random_number  < card.ability.extra.sidesOfDice then
                    local random_number_2 = pseudorandom("goob_seed", 1, card.ability.extra.sidesOfDice) + card.ability.extra.pityBonus
                    if card.ability.extra.random_number < random_number_2 then
                        card.ability.extra.random_number = random_number_2
                    end
                end
            end
            if card.ability.extra.random_number >= card.ability.extra.sidesOfDice then
                card.ability.extra.pityBonus = 0
                card.ability.extra.locking_in = true
                if card.ability.extra.locking_in == true and G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = localize('ph_boss_disabled') })
                    G.GAME.blind:disable()
                    card.ability.extra.locking_in = false
                end
                local quotes = {'UWU','UMU'}
                return {
                    message = pseudorandom_element(quotes, pseudoseed('seed')),
                    ease_dollars(card.ability.extra.goldAward),
                    colour = G.C.MONEY,
                    delay = 1.4,
                }
            elseif card.ability.extra.random_number < card.ability.extra.sidesOfDice then
                card.ability.extra.pityBonus = card.ability.extra.pityBonus + 1
                card:juice_up()
                return {
                    message = "".. card.ability.extra.random_number,
                    colour = G.C.RED,
                    delay = 1.2
                }
            end
        end
    end
}
