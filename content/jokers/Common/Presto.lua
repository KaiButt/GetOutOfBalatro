SMODS.Atlas {
    key = 'Presto',
    path = 'Presto.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Presto',
    name = 'Presto',
    atlas = 'Presto',
    pos = { x = 0, y = 0 },
    rarity = 1,
    config = {
        extra = {
            repetitions = 1,
        },
    },
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    attributes = {"retrigger"},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = "Other", key = "goob_improvements"}
        return { vars = { center.ability.extra.repetitions } }
    end,
    pools = { ["goob"] = true, ["goobNL"] = true },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and (context.other_card:get_seal() == "goob_WondrousMagic" or next(SMODS.get_enhancements(context.other_card))) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end
}
