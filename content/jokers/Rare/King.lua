SMODS.Atlas {
    key = 'King',
    path = 'King.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'King',
    unlocked = false,
    name = "King",
    atlas = "King",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            dollar = 1,
            jokerFlipped = false,
        },
    },
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
    pools = { ["goob"] = true, ["goobNL"] = true},
    loc_vars = function(self, info_queue, center)
        local kings_crowned = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 13 then kings_crowned = kings_crowned + 1 end
            end
        end
        return { vars = { center.ability.extra.dollar, center.ability.extra.dollar * kings_crowned } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() ~= 13 and context.other_card.ability.name ~= 'Stone Card' then
            local _card = context.other_card
            if _card.facing ~= 'back' then
                _card:flip()
                play_sound('card1', 0.4)
                card.ability.extra.jokerFlipped = true
            end
            assert(SMODS.modify_rank(_card, 1))
            if _card.facing == 'back' and card.ability.extra.jokerFlipped == true then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.12,
                    func = function()
                        _card:flip()
                        play_sound('card1', 0.4)
                        return true
                    end
                }))
                card.ability.extra.jokerFlipped = false
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        local kings_crowned = 0
        for _, playing_card in ipairs(G.playing_cards) do
            if playing_card:get_id() == 13 then kings_crowned = kings_crowned + 1 end
        end
        return kings_crowned > 0 and card.ability.extra.dollar * kings_crowned or nil
    end,
    check_for_unlock = function(self, args)
        if args.type == 'modify_deck' then
            local kingMe
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if playing_card:get_id() ~= 13 then
                    kingMe = false
                    break
                end
                kingMe = true
            end
            return kingMe
        end
    end,
}
