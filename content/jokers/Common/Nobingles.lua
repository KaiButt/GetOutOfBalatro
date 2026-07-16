SMODS.Atlas {
    key = 'Nobingles',
    path = 'Nobingles.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Nobingles',
    name = 'Nobingles',
    atlas = 'Nobingles',
    pos = { x = 0, y = 0 },
    rarity = 1,
    config = {
        extra = {
            enhancementScored = false,
            moneyBase = 3,
            noEnhanceBonus = 2,
        },
    },
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.moneyBase, center.ability.extra.noEnhanceBonus } }
    end,
    pools = { ["goob"] = true, ["goobNL"] = true},
    calculate = function(self, card, context)
        if context.setting_blind and card.ability.extra.enhancementScored then
            card.ability.extra.enhancementScored = false
        end
        if context.individual and context.cardarea == G.play and card.ability.extra.enhancementScored ~= true then
            if next(SMODS.get_enhancements(context.other_card)) or context.other_card.seal or context.other_card.edition then
                card.ability.extra.enhancementScored = true
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.enhancementScored then
            return card.ability.extra.moneyBase
        else 
            return card.ability.extra.moneyBase*card.ability.extra.noEnhanceBonus
        end
    end
}