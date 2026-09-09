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