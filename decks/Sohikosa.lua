SMODS.Atlas {
    key = 'Sohikosa',
    path = 'Sohikosa.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'sohiSleeve',
    path = 'sohiSleeve.png',
    px = 71,
    py = 95
}
SMODS.Back {
    key = 'sohikosa',
    atlas = 'Sohikosa',
    unlocked = false,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 2 or playing_card:get_id() == 3 or playing_card:get_id() == 4 then
                        SMODS.destroy_cards(playing_card)
                    end
                end
                if (G.GAME.starting_params.no_faces ~= true) then
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "J",
                        suit = "Clubs"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "J",
                        suit = "Hearts"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "J",
                        suit = "Diamonds"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "J",
                        suit = "Spades"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "Q",
                        suit = "Clubs"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "Q",
                        suit = "Hearts"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "Q",
                        suit = "Diamonds"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "Q",
                        suit = "Spades"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "K",
                        suit = "Clubs"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "K",
                        suit = "Hearts"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "K",
                        suit = "Diamonds"
                    }
                    SMODS.add_card {
                        set = "Playing Card",
                        area = G.deck,
                        skip_materialize = true,
                        key_append = "sohi_append",
                        enhanced_poll = 1,
                        rank = "K",
                        suit = "Spades"
                    }
                end
                if (G.GAME.starting_params.no_faces == true) then
                    G.GAME.starting_deck_size = 28
                end
                return true
            end
        }))
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_abandoned') > 0
    end
}
if CardSleeves then
    CardSleeves.Sleeve {
        key = "sohiSleeve",
        unlocked = false,
        unlock_condition = { deck = "b_goob_sohikosa", stake = "stake_red" },
        atlas = "sohiSleeve",
        pos = { x = 0, y = 0 },
        loc_vars = function(self)
            local key
            if self.get_current_deck_key() == "b_goob_sohikosa" then
                key = self.key .. "_alt"
            else
                key = self.key
            end
            return { key = key }
        end,
        apply = function(self, sleeve)
            if self.get_current_deck_key() == "b_goob_sohikosa" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _, playing_card in ipairs(G.playing_cards) do
                            if playing_card:get_id() == 5 then
                                SMODS.destroy_cards(playing_card)
                            end
                        end
                        SMODS.add_card{key = "j_pareidolia", edition = "e_negative"}
                        G.GAME.starting_deck_size = 48
                        return true
                    end
                }))
                CardSleeves.Sleeve.apply(self, sleeve)
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _, playing_card in ipairs(G.playing_cards) do
                            if playing_card:get_id() == 2 or playing_card:get_id() == 3 or playing_card:get_id() == 4 then
                                SMODS.destroy_cards(playing_card)
                            end
                        end
                        if (G.GAME.starting_params.no_faces ~= true) then
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "J",
                                suit = "Clubs"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "J",
                                suit = "Hearts"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "J",
                                suit = "Diamonds"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "J",
                                suit = "Spades"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "Q",
                                suit = "Clubs"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "Q",
                                suit = "Hearts"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "Q",
                                suit = "Diamonds"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "Q",
                                suit = "Spades"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "K",
                                suit = "Clubs"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "K",
                                suit = "Hearts"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "K",
                                suit = "Diamonds"
                            }
                            SMODS.add_card {
                                set = "Playing Card",
                                area = G.deck,
                                skip_materialize = true,
                                key_append = "sohi_append",
                                enhanced_poll = 1,
                                rank = "K",
                                suit = "Spades"
                            }
                        end
                        if (G.GAME.starting_params.no_faces == true) then
                            G.GAME.starting_deck_size = 28
                        end
                        return true
                    end
                }))
                CardSleeves.Sleeve.apply(self, sleeve)
            end
        end,
    }
end
