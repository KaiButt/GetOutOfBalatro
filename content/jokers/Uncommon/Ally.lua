SMODS.Atlas {
    key = 'Ally',
    path = 'Ally.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Ally',
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
        },
    },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.diceToRoll, center.ability.extra.sidesOfDice, center.ability.extra.goldAward } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if card.ability.extra.locking_in == true and G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
                card.ability.extra.locking_in = false
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                    { message = localize('ph_boss_disabled') })
                G.GAME.blind:disable()
            end
            local sum = roll_die(card.ability.extra.diceToRoll, card.ability.extra.sidesOfDice)+card.ability.extra.pityBonus
            if sum >= card.ability.extra.sidesOfDice then
                card.ability.extra.pityBonus = 0
                card.ability.extra.locking_in = true
                if card.ability.extra.locking_in == true and G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = localize('ph_boss_disabled') })
                    G.GAME.blind:disable()
                    card.ability.extra.locking_in = false
                end
                return {
                    message = "" .. sum,
                    ease_dollars(card.ability.extra.goldAward),
                    colour = G.C.MONEY,
                    delay = 1.4,
                }
            elseif sum < card.ability.extra.sidesOfDice then
                card.ability.extra.pityBonus = card.ability.extra.pityBonus + 1
                card:juice_up()
                return {
                    message = "" .. sum,
                    colour = G.C.RED,
                    delay = 1.2
                }
            end
        end
    end
}
