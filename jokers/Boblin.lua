SMODS.Atlas {
    key = 'Boblin',
    path = 'Boblin.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Boblin',
    loc_txt = {
        name = 'Boblin', --boblins effect: if small blind is skipped, create a random tag
        text = {
            'When {C:attention}Small Blind{} is skipped, cause a {C:green}Goblin Party!{}',
            'All your {C:attention}Jokers{} are considered {X:black,C:edition,E:1}Mercenaries{}',
        }
    },
    name = 'Boblin',
    atlas = 'Boblin',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6.6967,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["Meme"] = true, ["goob"] = true },
    calculate = function(self, card, context)
        if context.skip_blind and G.GAME.blind_on_deck == "Big" then
            local tag = Tag("tag_goob_goblinParty")
            add_tag(tag)
            return {
                message = 'GOBLIN PARTY!',
                colour = G.C.GREEN,
                delay = 1.2,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5
            }
        end
    end
}
