SMODS.Achievement({
	key = "jobros",
	unlock_condition = function(self, args)
        if args.type == 'win' then
            return next(SMODS.find_card('j_goob_Jobingles')) and next(SMODS.find_card('j_goob_Jobangles'))
        end
    end
})