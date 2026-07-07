SMODS.Atlas {
    key = 'Charles',
    path = 'Charles.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Charles',
    unlocked = false,
    name = 'Charles',
    atlas = 'Charles',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 7,
    config = {
        extra = {
            discount = 25,
            moneyGenerated = 2,
        },
        immutable = {
            appearanceRate = 0.08 -- 8 percent chance, same odds as rares
        }
    },
    loc_vars = function(self, info_queue, center)
        G.GAME.legendayAppearanceRate = center.ability.immutable.appearanceRate
        return { vars = { center.ability.extra.discount, center.ability.extra.moneyGenerated } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true},
    calculate = function(self, card, context)
        if context.modify_shop_card then
            if context.card:is_rarity("Legendary") then -- discount setting, only for legendaries and stacks with vouchers
                G.GAME.discount_back_percent = G.GAME.discount_percent
                G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.discount
                context.card:set_cost()
                G.GAME.discount_percent = G.GAME.discount_back_percent -- necessary to prevent things from getting globally cheaper
            end
        end
    end,
    calc_dollar_bonus = function(self, card) -- money payout
        local ownedCheck = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i]:is_rarity("Rare") or G.jokers.cards[i]:is_rarity("Legendary") then
                ownedCheck = ownedCheck + 1 end
        end
        return card.ability.extra.moneyGenerated * ownedCheck
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win' and legendaryCheck()
    end
}
function legendaryCheck()
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i]:is_rarity("Legendary") then
            return true
        end
    end
    return false
end
-- modify pool for Charles
local oldgetcurrentpool = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
    if next(SMODS.find_card('j_goob_Charles')) and _type == 'Joker' and _append == 'sho' then
        local poll = pseudorandom('rarity' .. G.GAME.round_resets.ante .. _append)
        if poll < G.GAME.legendayAppearanceRate then
            _legendary = true
        end
    end
    return oldgetcurrentpool(_type, _rarity, _legendary, _append)
end
