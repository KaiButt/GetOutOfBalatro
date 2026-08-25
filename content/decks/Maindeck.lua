SMODS.Atlas {
    key = 'MainDeck',
    path = 'Maindeck.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'MainSleeve',
    path = 'MainSleeve.png',
    px = 71,
    py = 95
}
SMODS.Back {
    key = "MainDeck",
    atlas = "MainDeck",
    unlocked = true,
    apply = function(self, back)
        for k, v in pairs(G.P_CENTERS) do
            if v.set == 'Joker' then
                if (string.find(k, "j_goob") == nil) then
                    G.GAME.banned_keys[k] = true
                end
            end
        end
    end,
}
if CardSleeves then
    CardSleeves.Sleeve {
        key = "MainSleeve",
        atlas = "MainSleeve",
        pos = { x = 0, y = 0 },
        unlocked = false,
        unlock_condition = { deck = "b_goob_MainDeck", stake = "stake_red" },
        config = { joker_slot = 1 },
        loc_vars = function(self)
            local key
            if self.get_current_deck_key() == "b_goob_MainDeck" then
                key = self.key .. "_alt"
            else
                key = self.key
            end
            return { key = key }
        end,
        apply = function(self, sleeve)
            if self.get_current_deck_key() == "b_goob_MainDeck" then
                G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.joker_slot
                CardSleeves.Sleeve.apply(self, sleeve)
            else
                for k, v in pairs(G.P_CENTERS) do
                    if v.set == 'Joker' then
                        if (string.find(k, "j_goob") == nil) then
                            G.GAME.banned_keys[k] = true
                        end
                    end
                end
                CardSleeves.Sleeve.apply(self, sleeve)
            end
        end
    }
end
