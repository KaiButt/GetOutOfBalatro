SMODS.Shader {
    key = "Whacky",
    path = 'Whacky.fs',
}

SMODS.Edition {
    key = "Whacky",
    shader = "Whacky",
    post = {x = 0, y=0},
    unlocked = true,
    in_shop = false,
    in_pool = false,
    calculate = function(self, card, context)
        if context.stay_flipped and context.from_area == G.play and context.other_card.edition and context.other_card.edition.key == "e_goob_Whacky" then
            return {
                modify = { to_area = G.hand },
            }
        end
    end
}