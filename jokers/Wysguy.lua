SMODS.Atlas {
    key = 'Wysguy',
    path = 'Wysguy.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Wysguy',
    unlocked = false,
    name = "Wysguy",
    atlas = "Wysguy",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            strength = 1,
            tarotMult = 1,
            skippedThisAnte = false,
            skipMult = 1,
        },
    },
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
    pools = { ["goob"] = true },
    add_to_deck = function(self, card, from_debuff)
        deck = GET_selected_deck()
        if deck == 'b_red' then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.strength
            ease_discard(card.ability.extra.strength)
        elseif deck == 'b_black' then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.strength
            ease_discard(-card.ability.extra.strength)
            G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.strength
        elseif deck == 'b_zodiac' then
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.strength
        elseif deck == 'b_painted' then
            G.hand:change_size(card.ability.extra.strength)
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.strength
        elseif deck == 'b_plasma' then
            
            G.jokers.oldLimit = G.jokers.config.card_limit
            G.consumeables.oldLimit = G.consumeables.config.card_limit
            local totalLimit = G.jokers.config.card_limit + G.consumeables.config.card_limit
            if totalLimit % 2 ~= 0 then
                totalLimit = totalLimit + 3
            else
                totalLimit = totalLimit + 2
            end
            G.jokers.config.card_limit = totalLimit / 2
            G.consumeables.config.card_limit = totalLimit / 2
            G.jokers.newLimit = G.jokers.config.card_limit
            G.consumeables.newLimit = G.consumeables.config.card_limit
        elseif deck == 'b_erratic' then
            for i = 1, 5 * card.ability.extra.strength, 1 do
                local _card = pseudorandom_element(G.playing_cards, pseudoseed('seed'))
                SMODS.destroy_cards(_card)
                card:juice_up()
            end
            for i = 1, 5 * card.ability.extra.strength, 1 do
                local _card = SMODS.add_card { set = "Playing Card", key_append = 'goob_wys_append', area = G.deck, enhanced_poll = 0.25 }
                SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                card:juice_up()
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        deck = GET_selected_deck()
        if deck == 'b_red' then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.strength
            ease_discard(-card.ability.extra.strength)
        elseif deck == 'b_black' then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.strength
            ease_discard(card.ability.extra.strength)
            G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.strength
        elseif deck == 'b_zodiac' then
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.strength
        elseif deck == 'b_painted' then
            G.hand:change_size(-card.ability.extra.strength)
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.strength
        elseif deck == 'b_plasma' then
            G.jokers.config.card_limit = G.jokers.oldLimit + (G.jokers.config.card_limit - G.jokers.newLimit)
            G.consumeables.config.card_limit = G.consumeables.oldLimit +
                (G.jokers.config.card_limit - G.consumeables.newLimit)
        elseif deck == 'b_erratic' and not from_debuff then
            for i = 1, 5 * card.ability.extra.strength, 1 do
                local _card = pseudorandom_element(G.playing_cards, pseudoseed('seed'))
                SMODS.destroy_cards(_card)
                card:juice_up()
            end
            for i = 1, 5 * card.ability.extra.strength, 1 do
                local _card = SMODS.add_card { set = "Playing Card", key_append = 'goob_wys_append', area = G.deck, enhanced_poll = 0.25 }
                SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                card:juice_up()
            end
        end
    end,
    calculate = function(self, card, context)
        deck = GET_selected_deck()
        if context.skip_blind and deck == 'b_anaglyph' and not card.ability.extra.skippedThisAnte then
            card.ability.extra.skippedThisAnte = true
            card.ability.extra.skipMult = card.ability.extra.skipMult + card.ability.extra.strength
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.skipMult } }
            }
        end
        if context.using_consumeable and deck == 'b_magic' and context.consumeable.ability.set == 'Tarot' then
            card.ability.extra.tarotMult = card.ability.extra.tarotMult + card.ability.extra.strength / 10
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.tarotMult } }
            }
        end
        if context.setting_blind and deck == 'b_blue' then
            ease_hands_played(card.ability.extra.strength)
            SMODS.calculate_effect(
                { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.strength } } },
                card)
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            if deck == 'b_yellow' and G.GAME.dollars >= (10 / card.ability.extra.strength) then
                return { --x2.5 mult if >= 10 bucks
                    x_mult = 1.5 + card.ability.extra.strength,
                    colour = G.C.RED,
                    card = card,
                }
            elseif deck == 'b_magic' and card.ability.extra.tarotMult > 0 then
                return {
                    x_mult = card.ability.extra.tarotMult,
                    colour = G.C.RED,
                    card = card,
                }
            elseif deck == 'b_abandoned' then -- x3 mult if deck doesnt contain face cards
                local faceless = true
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_face() then
                        faceless = false
                        break
                    end
                end
                if faceless then
                    return {
                        x_mult = 2 + card.ability.extra.strength,
                        colour = G.C.RED,
                        card = card,
                    }
                end
            elseif deck == 'b_checkered' then -- x3 mult if spades and hearts are equal
                local spadeTally, heartTally = 0, 0
                local isEqual = true
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card.base.suit == 'Spades' then
                        spadeTally = spadeTally + 1
                    elseif playing_card.base.suit == 'Hearts' then
                        heartTally = heartTally + 1
                    end
                end
                isEqual = spadeTally - heartTally == 0
                if isEqual then
                    return {
                        x_mult = 2 + card.ability.extra.strength,
                        colour = G.C.RED,
                        card = card,
                    }
                end
            elseif deck == 'b_anaglyph' then --xX mult, X gained once per ante by skipping
                return {
                    x_mult = card.ability.extra.skipMult,
                    colour = G.C.RED,
                    card = card,
                }
            elseif deck ~= 'b_red' and deck ~= 'b_blue' and deck ~= 'b_green' and deck ~= 'b_black' and deck ~= 'b_nebula' and deck ~= 'b_ghost' and deck ~= 'b_zodiac' and deck ~= 'b_painted' and deck ~= 'b_plasma' and deck ~= 'b_erratic' then
                return { --base condition for modded decks, x2 mult for free
                    x_mult = 1 + card.ability.extra.strength,
                    colour = G.C.RED,
                    card = card,
                }
            end
        end
        if context.ending_shop then
            if deck == 'b_nebula' and G.GAME.dollars > 1 then
                ease_dollars(-3+card.ability.extra.strength, true)
                local hand = GET_mostplayed_hand()
                local planet
                for _, center in pairs(G.P_CENTER_POOLS.Planet) do
                    if center.config.hand_type == hand then
                        planet = center.key
                    end
                end
                SMODS.add_card {
                    key = planet,
                    edition = 'e_negative'
                }
            elseif deck == 'b_ghost' and G.GAME.dollars > 2 then
                ease_dollars(-4+card.ability.extra.strength, true)
                SMODS.add_card {
                    set = "Spectral",
                    edition = 'e_negative'
                }
            end
        end
        if context.end_of_round and context.main_eval and context.beat_boss and context.game_over == false then
            if card.ability.extra.skippedThisAnte and deck == 'b_anaglyph' then
                card.ability.extra.skippedThisAnte = false
            elseif deck == 'b_erratic' then
                for i = 1, 5 * card.ability.extra.strength, 1 do
                    local _card = pseudorandom_element(G.playing_cards, pseudoseed('seed'))
                    SMODS.destroy_cards(_card)
                    card:juice_up()
                end
                for i = 1, 5 * card.ability.extra.strength, 1 do
                    local _card = SMODS.add_card { set = "Playing Card", key_append = 'goob_wys_append', area = G.deck, enhanced_poll = 0.25 }
                    SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                    card:juice_up()
                end
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        deck = GET_selected_deck()
        if deck ~= 'b_green' then
            return
        end
        moneyGiven = 0
        for _, joker in ipairs(G.jokers.cards) do
            moneyGiven = moneyGiven + card.ability.extra.strength
        end
        return moneyGiven
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_stake' and get_deck_win_stake() == 8
    end
}
function GET_selected_deck()
    if G.STATE == G.STATES.MENU then
        return
    end
    local ret = G.GAME.selected_back and G.GAME.selected_back.effect and G.GAME.selected_back.effect and
        G.GAME.selected_back.effect.center.key
    return ret
end

function GET_mostplayed_hand()
    local _handname, _played = 'High Card', -1
    for hand_key, hand in pairs(G.GAME.hands) do
        if hand.played > _played then
            _played = hand.played
            _handname = hand_key
        end
    end
    return _handname
end
