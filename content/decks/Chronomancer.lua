SMODS.Atlas {
    key = 'chronomancer',
    path = 'Chronomancer.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'chronoSleeve',
    path = 'chronoSleeve.png',
    px = 71,
    py = 95
}
SMODS.Back {
    key = "chronomancer",
    atlas = "chronomancer",
    unlocked = false,
    apply = function(self, back)
        ease_ante(0)
        G.GAME.round_resets.ante = 0
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
        G.GAME.win_ante = G.GAME.win_ante + 1
    end,
    check_for_unlock = function(self, args)
        if args.type == 'round_win' then
            return (G.GAME.round_resets.blind_ante == 9 and G.GAME.blind.boss)
        end
    end
}
if CardSleeves then
    CardSleeves.Sleeve {
        key = "chronoSleeve",
        atlas = "chronoSleeve",
        pos = { x = 0, y = 0 },
        unlocked = false,
        unlock_condition = { deck = "b_goob_chronomancer", stake = "stake_red" },
        loc_vars = function(self)
            local key
            if self.get_current_deck_key() == "b_goob_chronomancer" then
                key = self.key .. "_alt"
            else
                key = self.key
            end
            return { key = key }
        end,
        apply = function(self, sleeve)
            if self.get_current_deck_key() == "b_goob_chronomancer" then
                G.GAME.win_ante = G.GAME.win_ante + 1
                G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
                G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
                G.GAME.starting_params.discards = G.GAME.starting_params.discards + 1
                CardSleeves.Sleeve.apply(self, sleeve)
            else
                ease_ante(0)
                G.GAME.round_resets.ante = 0
                G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
                G.GAME.win_ante = G.GAME.win_ante + 1
                CardSleeves.Sleeve.apply(self, sleeve)
            end
        end
    }
end
