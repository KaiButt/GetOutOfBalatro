SMODS.Atlas {
    key = 'Marie',
    path = 'Marie.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Marie',
    name = 'Marie',
    atlas = 'Marie',
    pos = { x = 0, y = 0 },
    rarity = 4,
    config = {
        immutable = {
            diceToRoll = 1,
            sidesOfDice = 6,
            reduction = 40,
            ritualPerformed = false,
            cooldownPeriod = 0,
        },
    },
    cost = 20,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.immutable.reduction, center.ability.immutable.diceToRoll, center.ability.immutable.sidesOfDice, center.ability.immutable.cooldownPeriod } }
    end,
    in_pool = function()
        if G.GAME.marieDead == nil or G.GAME.marieDead == false or next(SMODS.find_card('j_vremade_ring_master')) then
            return true
        else
            return false
        end
    end,
    pools = { ["goob"] = true, ["goobL"] = true },
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.GAME.soulless == true then
                G.GAME.soulless = false
            end
            if G.GAME.marieDead == true or G.GAME.marieDead == nil then
                G.GAME.marieDead = false
            end
            if card.ability.immutable.cooldownPeriod == 0 then
                local trueReduction = card.ability.immutable.reduction / 100
                local battleLines = { 'C\'est fini.', 'One with the beyond.', 'It is the will.', 'I cleanse thee, now!',
                    'While I breathe, Heresy suffocates!', 'Shhh, shhh..', 'May Lua and Sol guide you.',
                    'Lua. Sol. Watch over.', 'You have been judged.' }
                for i = 1, card.ability.immutable.diceToRoll, 1 do
                    card.ability.immutable.cooldownPeriod = pseudorandom("goob_seed", card.ability.immutable.diceToRoll,
                        card.ability.immutable.sidesOfDice)
                    if next(SMODS.find_card("j_goob_StarAce")) and card.ability.immutable.cooldownPeriod > card.ability.immutable.diceToRoll then
                        local newCooldown = pseudorandom("goob_seed", card.ability.immutable.diceToRoll,
                            card.ability.immutable.sidesOfDice)
                        if newCooldown < card.ability.immutable.cooldownPeriod then
                            card.ability.immutable.cooldownPeriod = newCooldown
                        end
                    end
                end
                card.ability.immutable.ritualPerformed = true
                return {
                    xblindsize = 1 - trueReduction,
                    message = pseudorandom_element(battleLines, pseudoseed('seed')),
                    delay = 3.3,
                    sound = 'voice' .. math.random(1, 11),
                    G.SPEEDFACTOR * (math.random() * 0.3 + 1),
                    0.5
                }
            else
                card.ability.immutable.ritualPerformed = false
                card.ability.immutable.cooldownPeriod = card.ability.immutable.cooldownPeriod - 1
                if card.ability.immutable.cooldownPeriod < 0 then
                    card.ability.immutable.cooldownPeriod = 0
                end
                return {
                    message = 'Un instant, mon amour',
                    colour = G.C.PURPLE,
                    sound = 'voice' .. math.random(1, 11),
                    G.SPEEDFACTOR * (math.random() * 0.3 + 1),
                    0.5,
                }
            end
        end
        if context.end_of_round and context.game_over and context.main_eval and (not next(SMODS.find_card("j_mr_bones")) or G.GAME.chips / G.GAME.blind.chips < 0.25) then
            G.GAME.marieDead = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    SMODS.destroy_cards(card, nil, true)
                    return true
                end
            }))
            return {
                message = 'au revoir, mon amour',
                delay = 3.5,
                sound = 'voice' .. math.random(1, 11),
                    G.SPEEDFACTOR * (math.random() * 0.3 + 1),
                saved = 'Marie gave her life for you!',
                colour = G.C.RED
            }
        end
    end
}
