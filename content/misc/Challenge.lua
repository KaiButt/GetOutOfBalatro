SMODS.Challenge {
    key = "Whacky_Challenge",
    rules = {
        modifiers = {
            { id = 'discards',    value = 2 },
        },
        custom = {
            { id = "Whacky" },
        },
    },
    deck = {
        type = 'Challenge Deck',
        edition = "goob_Whacky"
    },
    restrictions = {
        banned_cards = {
             { id = 'j_goob_Nobingles' },
             { id = 'j_goob_Presto'},
             { id = 'j_goob_Diamonds'},
             { id = 'j_goob_Jobangles'},
             { id = 'j_drunkard'},
             { id = 'j_merry_andy'},
             { id = 'v_wasteful'},
             { id = 'v_recyclomancy'}
        }
    }
}

SMODS.Challenge {
    key = "ALL_CAPS_CHALLENGE",
    rules = {
        modifiers = {
            {id = "joker_slots", value = 2},
        },
        custom = {
            { id = "CAPS" },
        }
    },
    jokers = {
        {id = "j_goob_MASTERCAPSLOCK", eternal = true},
    },
    restrictions = {
        banned_cards = {
            {id = 'v_blank'},
            {id = 'v_antimatter'},
            {id = 'c_ectoplasm'},
            {id = 'j_goob_Fox'},
            {id = 'j_invisible'},
            {id = 'j_goob_Sgt'},
            {id = 'j_goob_Skull'},
            {id = 'j_baseball'},
            {id = 'j_goob_Tommy'}
        },
        banned_tags = {
            { id = 'tag_negative' },
        },
        banned_other = {
            { id = 'bl_final_leaf',  type = 'blind' },
        }
    }
}