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
            moneyBase = 6,
            enhancePenalty = 0.5,
        },
    },
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = "Other", key = "goob_improvements"}
        return { vars = { center.ability.extra.moneyBase, center.ability.extra.enhancePenalty } }
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
        if next(SMODS.find_card("j_goob_Marie")) then
            card.ability.extra.enhancementScored = false
        end
        if card.ability.extra.enhancementScored then
            return card.ability.extra.moneyBase*card.ability.extra.enhancePenalty
        else 
            return card.ability.extra.moneyBase
        end
    end
}