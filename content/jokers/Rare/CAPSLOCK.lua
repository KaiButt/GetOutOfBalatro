SMODS.Atlas {
    key = 'MASTERCAPSLOCK',
    path = 'MASTERCAPSLOCK.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'MASTERCAPSLOCK',
    name = 'MASTERCAPSLOCK',
    atlas = 'MASTERCAPSLOCK',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 7,
    config = {
        immutable = {
            amountToModify = 1,
        },
    },
    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
            end
            local compatible = other_joker and other_joker ~= card and
            not goob_excluded_Jokers[other_joker.config.center.key]
            if compatible == nil then compatible = false end
            local main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = {
                                ref_table = card,
                                align = "m",
                                colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
                                    or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
                                r = 0.05,
                                padding = 0.06,
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = " "
                                            .. localize("k_" .. (compatible and "compatible" or "incompatible"))
                                            .. " ",
                                        colour = G.C.UI.TEXT_LIGHT,
                                        scale = 0.32 * 0.8,
                                    },
                                },
                            },
                        },
                    },
                },
            }
            return { main_end = main_end, vars = { card.ability.immutable.amountToModify } }
        end
        return { vars = { card.ability.immutable.amountToModify } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true },
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.game_over == false then
            local other_Joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    if (G.jokers.cards[i + 1] ~= nil) then
                        other_Joker = G.jokers.cards[i + 1]
                    end
                end
            end
            if other_Joker ~= nil then
                GOOB_modify_card_values(other_Joker, { ['+'] = card.ability.immutable.amountToModify })
                return {
                    message = 'CAPSLOCK ON',
                    colour = G.C.GREEN,
                    delay = 1.2,
                }
            end
        end
    end,
}
