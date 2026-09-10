SMODS.Atlas {
    key = 'Willy',
    path = 'Willy.png',
    px = 71,
    py = 95
}
local function most_valuable_joker()
    local max_count = 1
    local most_won_joker_key = nil
    local most_won_joker_name = nil
    
    if G.PROFILES and G.PROFILES[G.SETTINGS.profile] and G.PROFILES[G.SETTINGS.profile].joker_usage then
        for joker_key, data in pairs(G.PROFILES[G.SETTINGS.profile].joker_usage) do
            if data and data.count and data.count >= max_count then
                max_count = data.count
                most_won_joker_key = joker_key
                
            
                if G.P_CENTERS and G.P_CENTERS[most_won_joker_key] then
                    local center = G.P_CENTERS[most_won_joker_key]
                    if center.loc_txt and center.loc_txt.name then
                        most_won_joker_name = center.loc_txt.name
                    elseif G.localization and G.localization.descriptions.Joker and G.localization.descriptions.Joker[most_won_joker_key] then
                        most_won_joker_name = G.localization.descriptions.Joker[most_won_joker_key].name
                    else
                        most_won_joker_name = center.name or "Unknown Joker"
                    end
                end
            end
        end
    end
    
    return most_won_joker_name, most_won_joker_key
end
SMODS.Joker {
    key = 'Willy',
    name = "Willy",
    atlas = "Willy",
    pos = { x = 0, y = 0 },
    config = {
        immutable = {
            cook_rounds = 0, total_rounds = 2, mvj_name = nil, mvj_key = nil
        },
    },
    rarity = 1,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = false,
    in_pool = function(self, args)
        if G.GAME.challenge then return false else return true end
    end,
    pools = { ["goob"] = true, ["goobNL"] = true },
    attributes = { "generation" },
    loc_vars = function(self, info_queue, center)
        local mvj_name, mvj_key = most_valuable_joker()
        if mvj_name == nil or mvj_name == "Willy Gatcher" then
            mvj_name = "Joker"
            mvj_key = "j_joker"
        end
        center.ability.immutable.mvj_name = mvj_name
        center.ability.immutable.mvj_key = mvj_key
        return { vars = { center.ability.immutable.total_rounds, center.ability.immutable.cook_rounds, center.ability.immutable.mvj_name } }
    end,
    calculate = function(self, card, context)
        if context.selling_self and (card.ability.immutable.cook_rounds >= card.ability.immutable.total_rounds) and not context.blueprint then
            SMODS.add_card{ key = card.ability.immutable.mvj_key }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.immutable.cook_rounds = card.ability.immutable.cook_rounds + 1
            if card.ability.immutable.cook_rounds == card.ability.immutable.total_rounds then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.immutable.cook_rounds < card.ability.immutable.total_rounds) and
                    (card.ability.immutable.cook_rounds .. '/' .. card.ability.immutable.total_rounds) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
    end,
}
