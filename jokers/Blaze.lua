SMODS.Atlas {
    key = 'Blaze',
    path = 'Blaze.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Blaze',
    unlocked = false,
    loc_txt = {
        name = 'Blaze',
        text = {
            'Every card you {C:attention}play{}',
            'Will be {C:attention}shuffled back{} into your {C:attention}deck{}',
        },
        unlock = {
            'Beat a {C:attention}Boss Blind{} with {C:attention}1{} card in your deck'
        }
    },
    name = "Blaze",
    atlas = "Blaze",
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    pools = { ["goob"] = true},
    calculate = function(self, card, context)
        if context.stay_flipped and context.from_area == G.play then
            return {
                modify = {to_area = G.deck}
            }
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'ante_up' and #G.playing_cards == 1
    end,
}