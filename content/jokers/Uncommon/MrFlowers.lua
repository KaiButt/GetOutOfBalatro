SMODS.Atlas {
    key = 'MrFlowers',
    path = 'MrFlowers.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'MrFlowers',
    name = 'Mr.Flowers',
    atlas = 'MrFlowers',
    unlocked = false,
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    config = { extra = { moneyPerPlay = 3, amountToDeck = 2 }, immutable = { maxAmountToDeck = 40 } },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true },
    loc_vars = function(self, info_queue, center)
        if center.ability.extra.amountToDeck > center.ability.immutable.maxAmountToDeck then
            center.ability.extra.amountToDeck = center.ability.immutable.maxAmountToDeck
        end
        return { vars = { center.ability.extra.amountToDeck, center.ability.immutable.maxAmountToDeck, center.ability.extra.moneyPerPlay } }
    end,
    calculate = function(self, card, context)
        if context.skip_blind then
            local flower
            if card.ability.extra.amountToDeck > card.ability.immutable.maxAmountToDeck then
                card.ability.extra.amountToDeck = card.ability.immutable.maxAmountToDeck
            end
            for i = 1, card.ability.extra.amountToDeck, 1 do
                if i==1 then
                flower = SMODS.add_card { set = "Base", enhancement = "m_goob_flower", area = G.deck }
                SMODS.calculate_context({ playing_card_added = true, cards = { flower } })
                else 
                SMODS.copy_card(flower)
                SMODS.calculate_context({ playing_card_added = true, cards = { flower } })
                end
            end
            return {
                message = "Flower Cards!"
            }
        end
    end,
    check_for_unlock = function(self, args)
        local flowerMe
        if args.type == 'modify_deck' then
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_goob_flower') == false then
                    flowerMe = false
                    break
                end
                flowerMe = true
            end
            return flowerMe
        end
    end,
}
