SMODS.Shader {
    key = "Whacky",
    path = 'Whacky.fs',
}

SMODS.Edition {
    key = "Whacky",
    shader = "Whacky",
    post = { x = 0, y = 0 },
    unlocked = true,
    in_shop = false,
    in_pool = false,
    sound = { sound = "goob_clownish", per = 1.3, vol = 0.3 },
    calculate = function(self, card, context)
        if context.stay_flipped and context.from_area == G.play and context.other_card.edition and context.other_card.edition.key == "e_goob_Whacky" and context.other_card == card then
                return {
                    card = context.other_card,
                    modify = { to_area = G.hand },
                }
        end
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                message = tostring(roll_die(1,20)),
                card = card,
                sound = play_sound('goob_clownish', 1.3, 0.3),
            }
        end
    end
}
