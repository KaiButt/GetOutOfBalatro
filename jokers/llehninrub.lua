SMODS.Atlas {
    key = 'LLEHNINRUB',
    path = 'LLEHNINRUB.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'LLEHNINRUB',
    unlocked = false,
    loc_txt = {
        name = 'LLEHNINRUB',
        text = {
            '{X:mult,C:white}X#1#{} Mult',
            'When {C:attention}Blind{} is selected',
            'Flips and shuffles {C:attention}ALL{} Jokers'
        },
        unlock = {
            'Defeat {C:attention}Amber Acorn{}'
        },
    },
    name = 'LLEHNINRUB',
    atlas = 'LLEHNINRUB',
    pos = { x = 0, y = 0 },
    config = { extra = { x_mult = 2 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    pools = { ["goob"] = true, ["Meme"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then --I just took this wholecloth from amber acorn @ vanillaremade
            G.jokers:unhighlight_all()
            for _, joker in ipairs(G.jokers.cards) do
                joker:flip()
            end
            if #G.jokers.cards > 1 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 0.85)
                                return true
                            end,
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 1.15)
                                return true
                            end
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 1)
                                return true
                            end
                        }))
                        delay(0.5)
                        return true
                    end
                }))
            end
            return {
                message = '!!!NURB NURB NURB',
                colour = G.C.RED,
                delay = 0.75,
            }
        end
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == "round_win" then
            if G.GAME.blind.name == "Amber Acorn" then
                return true
            end
        end
    end,
}
