SMODS.Atlas {
    key = 'WondrousMagic',
    path = 'WondrousMagic.png',
    px = 71,
    py = 95
}
SMODS.Seal {
    key = "WondrousMagic",
    atlas = 'WondrousMagic',
    badge_colour = HEX('21c1fb'),
    always_scores = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return perform_wondrous_magic(card, context.scoring_name)
        end
    end,
}
function perform_wondrous_magic(card, hand)
    local bonus = next(SMODS.find_card("j_goob_Kai")) and 2 or 1
    local num = pseudorandom("goob_WonderousMagic_seal", 1, 13)
    if num == 1 then -- 31 chips (62 if kai'd)
        return {
            chips = 31 * bonus
        }
    elseif num == 2 then -- 4/8 mult
        return {
            mult = 4 * bonus
        }
    elseif num == 3 then -- permanent 5/10 chips
        card.ability.perma_bonus = (card.ability.perma_bonus or 0) + 5 * bonus
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS
        }
    elseif num == 4 then -- permanent 2/4 mult
        card.ability.perma_mult = (card.ability.perma_mult or 0) + 2 * bonus
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.RED
        }
    elseif num == 5 then -- permanent 1/2 dollars
        card.ability.perma_p_dollars = (card.ability.perma_p_dollars or 0) + bonus
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.GOLD
        }
    elseif num == 6 then -- 3/6 bucks given taken from vanillaremake gold ticket
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + 3 * bonus
        return {
            dollars = 3 * bonus,
            message = "MONEY TALKS!",
            func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.dollar_buffer = 0
                        return true
                    end
                }))
            end
        }
    elseif num == 7 then -- x2/4 mult
        return {
            x_mult = 2 * bonus,
            colour = G.C.RED
        }
    elseif num == 8 then -- give it a random enhancement, if it does not have one. This one can whiff.
        if card.ability.name == "Default Base" then
            local random_enhancement = SMODS.poll_enhancement { key = "goob_WonderousMagic", guaranteed = true }
            card:set_ability(random_enhancement)
        end
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.PURPLE
        }
    elseif num == 9 then -- give it a random edition.
        if not card.edition then
            local random_edition = SMODS.poll_edition { key = "goob_WonderousMagic", guarenteed = true }
            card:set_edition(random_edition)
        end
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.PURPLE
        }
    elseif num == 10 then -- +1/2 discard for the round
        ease_discard(bonus)
    elseif num == 11 then -- +1/2 hand for the round
        ease_hands_played(bonus)
    elseif num == 12 then -- level up (this gives you the bonus for future hands)
        SMODS.upgrade_poker_hands({ hands = { hand }, level_up = bonus, from = card })
    else
        local num2 = pseudorandom("goob_WonderousMagic_seal", 1, 15)
        if num2 == 1 then -- duplicate the card to hand (+1 card)
            for i = 1, bonus, 1 do
                local card_copied = copy_card(card, nil, nil, G.playing_card)
                card_copied:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, card_copied)
                G.hand:emplace(card_copied)
                card_copied.states.visible = nil

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_copied:start_materialize()
                        return true
                    end
                }))
                SMODS.calculate_context({ playing_card_added = true, cards = { card_copied } })
            end
        elseif num2 == 2 then -- increase joker slots by 1/2
            G.jokers.config.card_limit = G.jokers.config.card_limit + bonus
        elseif num2 == 3 then -- same but for consumables
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + bonus
        elseif num2 == 4 then -- negative planet of most played hand
            for i = 1, bonus, 1 do
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
            end
        elseif num2 == 5 then -- negative tarot
            for i = 1, bonus, 1 do
                SMODS.add_card {
                    set = "Tarot",
                    edition = 'e_negative'
                }
            end
        elseif num2 == 6 then -- negative spectral
            for i = 1, bonus, 1 do
                SMODS.add_card {
                    set = "Spectral",
                    edition = 'e_negative'
                }
            end
        elseif num2 == 7 then -- 2/4 tags
            for i = 1, bonus * 2, 1 do
                local tag_pool = get_current_pool('Tag')
                local selected_tag = pseudorandom_element(tag_pool, 'goob_WonderousMagic')
                local it = 1
                while selected_tag == 'UNAVAILABLE' do
                    it = it + 1
                    selected_tag = pseudorandom_element(tag_pool, 'goob_WonderousMagic_resample' .. it)
                end
                add_tag(Tag(selected_tag, false, 'Small'))
            end
        elseif num2 == 8 then -- 1/2 vouchers
            for i = 1, bonus, 1 do
                local voucher_pool = get_current_pool('Voucher')
                local selected_voucher = pseudorandom_element(voucher_pool, 'goob_WonderousMagic"')
                local it = 1
                while selected_voucher == 'UNAVAILABLE' do
                    it = it + 1
                    selected_voucher = pseudorandom_element(voucher_pool, 'goob_WonderousMagic"' .. it)
                end
                local voucher_card = SMODS.create_card({ area = G.play, key = selected_voucher }) -- Ignore the previous code and just use a key for a prefined voucher
                local prev_state = G.STATE
                voucher_card:start_materialize()
                voucher_card.cost = 0
                G.play:emplace(voucher_card)
                delay(0.8)
                G.FUNCS.use_card({ config = { ref_table = voucher_card } })

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6,
                    func = function()
                        voucher_card:start_dissolve()
                        return true
                    end
                }))
            end
        elseif num2 == 9 then -- gives 1/2 negative legendary jokers
            for i = 1, bonus, 1 do
                SMODS.add_card {
                    set = "Joker",
                    rarity = "Legendary",
                    edition = "e_negative",
                    key_append = "goob_WonderousMagic_seal",
                    area = G.jokers
                }
            end
        elseif num2 == 10 then -- permanent +1/2 discards
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + bonus
            ease_discard(bonus)
        elseif num2 == 11 then -- permanent +1/2 hands
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + bonus
            ease_hands_played(bonus)
        elseif num2 == 12 then -- permanent +1/2 hand size
            G.hand:change_size(bonus)
        elseif num2 == 13 then -- small bonus to the card to everything good
            card.ability.perma_bonus = card.ability.perma_bonus + 5 * bonus
            card.ability.perma_mult = card.ability.perma_mult + 2 * bonus
            card.ability.perma_x_chips = card.ability.perma_x_chips + 1.05 * bonus
            card.ability.perma_x_mult = card.ability.perma_x_mult + 1.1 * bonus
            card.ability.perma_h_chips = card.ability.perma_h_chips + 3 * bonus
            card.ability.perma_h_mult = card.ability.perma_h_mult + 1 * bonus
            card.ability.perma_h_x_chips = card.ability.perma_h_x_chips + 1.03 * bonus
            card.ability.perma_h_x_mult = card.ability.perma_h_x_mult + 1.07 * bonus
            card.ability.perma_p_dollars = card.ability.perma_p_dollars + 2 * bonus
            card.ability.perma_h_dollars = card.ability.perma_h_dollars + 1 * bonus
            card.ability.perma_score = card.ability.perma_score + 6 * bonus
            card.ability.perma_x_score = card.ability.perma_x_score + 1.02 * bonus
            card.ability.perma_h_score = card.ability.perma_h_score + 3 * bonus
            card.ability.perma_h_x_score = card.ability.perma_h_x_score + 1.01 * bonus
            card.ability.perma_repetitions = card.ability.perma_repetitions + 1 * bonus
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.GREEN
            }
        elseif num2 == 14 then -- upgrades ALL hands 1/2 times
            SMODS.upgrade_poker_hands({level_up = bonus, instant = true})
        else -- Dimensional break
            local num3 = pseudorandom("goob_WonderousMagic_seal", 1, 10)
            if num3 == 1 then
                for _, playing_card in ipairs(G.playing_cards) do -- add random seals to all cards, removes enhancements
                    local random_seal = SMODS.poll_seal { key = "goob_WonderousMagic", guaranteed = true }
                    playing_card:set_seal(random_seal)
                    playing_card:set_ability('c_base', nil, true)
                end
            elseif num3 == 2 then -- makes all playing cards negative
                for _, playing_card in ipairs(G.playing_cards) do
                    playing_card:set_edition("e_negative")
                end
            elseif num3 == 3 then -- deletes your deck and gives you a new one of enhanced cards w/1 (or 2) wonderful
                for _, playing_card in ipairs(G.playing_cards) do
                    SMODS.destroy_cards(playing_card)
                end
                local wonderful = true
                local wonderful_bonus = (bonus == 2) and true or false
                for i = 1, G.GAME.starting_deck_size, 1 do
                    if wonderful or wonderful_bonus then
                        if not wonderful and wonderful_bonus then
                            wonderful_bonus = false
                        else
                            wonderful = false
                        end
                        local _card = SMODS.add_card { set = "Enhanced", area = G.deck }
                        _card:set_seal("goob_WondrousMagic")
                    else
                        SMODS.add_card { set = "Enhanced", area = G.deck }
                    end
                end
            elseif num3 == 4 then -- give every card in your deck a small bonus of everything good
                for _, playing_card in ipairs(G.playing_cards) do
                    playing_card.ability.perma_bonus = playing_card.ability.perma_bonus + 5 * bonus
                    playing_card.ability.perma_mult = playing_card.ability.perma_mult + 2 * bonus
                    playing_card.ability.perma_x_chips = playing_card.ability.perma_x_chips + 1.05 * bonus
                    playing_card.ability.perma_x_mult = playing_card.ability.perma_x_mult + 1.1 * bonus
                    playing_card.ability.perma_h_chips = playing_card.ability.perma_h_chips + 3 * bonus
                    playing_card.ability.perma_h_mult = playing_card.ability.perma_h_mult + 1 * bonus
                    playing_card.ability.perma_h_x_chips = playing_card.ability.perma_h_x_chips + 1.03 * bonus
                    playing_card.ability.perma_h_x_mult = playing_card.ability.perma_h_x_mult + 1.07 * bonus
                    playing_card.ability.perma_p_dollars = playing_card.ability.perma_p_dollars + 2 * bonus
                    playing_card.ability.perma_h_dollars = playing_card.ability.perma_h_dollars + 1 * bonus
                    playing_card.ability.perma_score = playing_card.ability.perma_score + 6 * bonus
                    playing_card.ability.perma_x_score = playing_card.ability.perma_x_score + 1.02 * bonus
                    playing_card.ability.perma_h_score = playing_card.ability.perma_h_score + 3 * bonus
                    playing_card.ability.perma_h_x_score = playing_card.ability.perma_h_x_score + 1.01 * bonus
                    playing_card.ability.perma_repetitions = playing_card.ability.perma_repetitions + 1 * bonus
                end
            elseif num3 == 10 then                        -- win conditions
                local winner = pseudorandom("goob_WonderousMagic_seal", 1, 10)
                if winner < 11 - bonus or G.Game.won then -- 90/80% to win blind
                    G.E_MANAGER:add_event(Event({
                        blocking = false,
                        func = function()
                            if G.STATE == G.STATES.SELECTING_HAND then
                                G.GAME.chips = G.GAME.blind.chips
                                G.STATE = G.STATES.HAND_PLAYED
                                G.STATE_COMPLETE = true
                                end_round()
                                return true
                            end
                        end
                    }))
                else -- 10/20% to win run
                    win_game()
                    G.GAME.won = true
                end
            end
        end
    end
end
