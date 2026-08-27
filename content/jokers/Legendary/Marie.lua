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
            reduction = 70,
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
    add_to_deck = function(self, card, from_debuff)
        G.GAME.marieAmount = (G.GAME.marieAmount or -1) + 1
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.marieAmount = (G.GAME.marieAmount or -1) - 1
        if G.GAME.marieAmount <= 0 then
            G.GAME.marieAmount = nil
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
            local trueReduction = card.ability.immutable.reduction / 100
            local battleLines = { 'C\'est fini.', 'One with the beyond.', 'It is the will.', 'I cleanse thee, now!',
                'While I breathe, Heresy suffocates!', 'Shhh, shhh..', 'May Lua and Sol guide you.',
                'Lua. Sol. Watch over.', 'You have been judged.' }
            return {
                xblindsize = 1 - trueReduction,
                message = pseudorandom_element(battleLines, pseudoseed('seed')),
                delay = 1.8,
                sound = 'voice' .. math.random(1, 11),
                G.SPEEDFACTOR * (math.random() * 0.3 + 1),
                0.5
            }
        end
    end
}
