SMODS.Achievement({
	key = "jobros",
	unlock_condition = function(self, args)
        if args.type == 'win' then
            return next(SMODS.find_card('j_goob_Jobingles')) and next(SMODS.find_card('j_goob_Jobangles'))
        end
    end
})

SMODS.Achievement({
    key = "WhackWin",
    unlock_condition = function(self, args)
        if args.type == 'win_challenge' and G.GAME.challenge == 'c_goob_Whacky_Challenge' then
            play_sound("goob_clownish", 1.3, 0.3)
            return true
        end
    end
})