SMODS.Atlas {
    key = 'Diamonds',
    path = 'Diamonds.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Diamonds',
    name = 'Diamonds',
    atlas = 'Diamonds',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true, ["goobNL"] = true },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = { set = "Other", key = "goob_improvements" }
        local key
        if G.GAME.diamondsFlipped == true then
            key = self.key .. "_alt"
        else
            key = self.key
        end
        return { key = key }
    end,
}

local shuffleref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local ref = shuffleref(self, _seed)

    if next(SMODS.find_card("j_goob_Diamonds")) then
        local improved_cards = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if next(SMODS.get_enhancements(card)) ~= nil or card:get_seal() ~= nil or card.edition ~= nil then
                table.insert(improved_cards, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(improved_cards) do
            if not G.GAME.diamondsFlipped or G.GAME.diamondsFlipped == nil then
                table.insert(self.cards, card)
            else
                table.insert(self.cards, 1, card)
            end
        end
    end

    return ref
end

local function create_my_button_ui(card)
    local text = G.GAME.diamondsFlipped == true and "Revert" or "Invert"
    
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
                        button = 'goob_diamonds_click', 
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
G.FUNCS.goob_diamonds_click = function(e)
    local text = nil
    local card = e.config.ref_table 
    if G.GAME.diamondsFlipped == nil or G.GAME.diamondsFlipped == false then
        G.GAME.diamondsFlipped = true
        text = "last!"
    else
        G.GAME.diamondsFlipped = false
        text = "first!"
    end
    SMODS.calculate_effect({ message = text }, card)
end
G.FUNCS.goob_diamonds_func = function(e)
    local card = e.config.ref_table


    local can_use = not card.debuff 


    e.config.button = can_use and 'goob_diamonds_click' or nil
    e.config.colour = can_use and G.C.MULT or G.C.UI.BACKGROUND_INACTIVE
end
SMODS.DrawStep {
    key = 'goob_diamonds_click',
    order = -30,
    func = function(card, layer)
        if card.children.goob_diamonds_click then
            card.children.goob_diamonds_click:draw()
        end
    end
}
local highlight_ref = Card.highlight
function Card.highlight(self, is_highlighted)
    if self.ability.set == "Joker" and is_highlighted and self.area == G.jokers and self.ability.name == "Diamonds" and self.debuff==false then
        self.children.goob_diamonds_click = create_my_button_ui(self)
    elseif self.children.goob_diamonds_click then
        self.children.goob_diamonds_click:remove()
        self.children.goob_diamonds_click = nil
    end

    return highlight_ref(self, is_highlighted)
end
