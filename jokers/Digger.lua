SMODS.Atlas {
    key = 'Digger',
    path = 'Digger.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Digger',
    loc_txt = {
        name = 'Digger Of The Golden Sands', --boblins effect: if small blind is skipped, create a random tag
        text = {
            '{C:mult}+#1#{} Mult',
            'Lose {C:gold}$#2#{} Gold at the end of the round',
            'If you can not pay, {C:red,E:2}self destructs{}'
        }
    },
    name = 'Digger',
    atlas = 'Digger',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            multGain = 20,
            costOfBusiness = 2
        }
    },
    rarity = 2,
     loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.multGain, center.ability.extra.costOfBusiness } }
    end,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pools = { ["goob"] = true },
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                mult = card.ability.extra.multGain,
                colour = G.C.RED,
                card = card,
            }
        end
        if context.end_of_round and context.main_eval and context.game_over == false and not context.blueprint then
            if G.GAME.dollars < card.ability.extra.costOfBusiness then
                return {
                    message = "Contract Voided",
                    colour = G.C.RED,
                    card = card,
                    delay = 1.2,
                    SMODS.destroy_cards(card)
                }
            elseif G.GAME.dollars >= card.ability.extra.costOfBusiness  then
            return {
                message = "Pay Up!",
                ease_dollars(-card.ability.extra.costOfBusiness),
                colour = G.C.MONEY,
                card = card,
            }
        end
        end
    end
}