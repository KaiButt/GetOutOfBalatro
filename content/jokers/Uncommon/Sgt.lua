SMODS.Atlas {
    key = 'Sgt',
    path = 'Sgt.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'Sgt',
    name = 'Sgt',
    atlas = 'Sgt',
    pos = { x = 0, y = 0 },
    config = {
        immutable = {
            price = 5,
            increment = 1
        },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    attributes = {"passive"},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.immutable.price, center.ability.immutable.increment} }
    end,
    pools = { ["goob"] = true, ["goobNL"] = true },
}
local function create_my_button_ui(card)
    local text = "ten-hu!"
    
    return UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                colour = G.C.CLEAR
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        align = 'cm',
                        padding = 0.15,
                        r = 0.08,
                        hover = true,
                        shadow = true,
                        colour = G.C.GREEN, 
                        button = 'goob_Sgt_click',
                        func = 'goob_Sgt_func',
                        ref_table = card,
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = text,
                                        colour = G.C.UI.TEXT_LIGHT, 
                                        scale = 0.4,
                                    }
                                },
                                {
                                    n = G.UIT.B,
                                    config = {
                                        w = 0.1,
                                        h = 0.4
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
        config = {
            align = 'cl', 
            major = card,
            parent = card,
            offset = { x = 0.2, y = 0 }
        }
    }
end
G.FUNCS.goob_Sgt_click = function(e)
    local text = "Hoorah!"
    local card = e.config.ref_table
    if #G.jokers.highlighted==1 then
    G.jokers.highlighted[1]:set_edition('e_negative')
    else
        for i = 1, #G.jokers.highlighted do
            if G.jokers.highlighted[i].ability.name ~= 'Sgt' then
                G.jokers.highlighted[i]:set_edition('e_negative')
                break
            end
        end
    
    end
    G.jokers:unhighlight_all()
    ease_dollars(-card.ability.immutable.price)
    card.ability.immutable.price = card.ability.immutable.price + card.ability.immutable.increment
    SMODS.calculate_effect({ message = text }, card)
end
G.FUNCS.goob_Sgt_func = function(e)
    local card = e.config.ref_table
    local can_use = #G.jokers.highlighted <= 2 and G.GAME.dollars>card.ability.immutable.price or (next(SMODS.find_card("j_credit_card")) and G.GAME.dollars>=-20+card.ability.immutable.price)
    e.config.button = not card.debuff and can_use and 'goob_Sgt_click' or nil
    e.config.colour = can_use and G.C.MULT or G.C.UI.BACKGROUND_INACTIVE
end
SMODS.DrawStep {
    key = 'goob_Sgt_click',
    order = -30,
    func = function(card, layer)
        if card.children.goob_sgt_click then
            card.children.goob_sgt_click:draw()
        end
    end
}
local highlight_ref = Card.highlight
function Card.highlight(self, is_highlighted)
    if self.ability.set == "Joker" and is_highlighted and self.area == G.jokers and self.ability.name == "Sgt" and self.debuff==false then
        self.children.goob_Sgt_click = create_my_button_ui(self)
    elseif self.children.goob_Sgt_click then
        self.children.goob_Sgt_click:remove()
        self.children.goob_Sgt_click = nil
    end

    return highlight_ref(self, is_highlighted)
end