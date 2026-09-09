SMODS.Achievement({
	key = "jobros",
    hidden_name = true,
    hidden_text = false,
    bypass_all_unlocked = false,
    reset_on_startup = true,
	unlock_condition = function(self, args)
        if args.type == 'win' then
            return next(SMODS.find_card('j_goob_Jobingles')) and next(SMODS.find_card('j_goob_Jobangles'))
        end
    end
})