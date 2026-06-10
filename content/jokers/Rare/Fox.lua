SMODS.Atlas {
    key = 'Fox',
    path = 'Fox.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'Fox',
    unlocked = false,
    name = 'Fox',
    atlas = 'Fox',
    pos = { x = 0, y = 0 },
    config = { extra = { x_mult = 1.5 } },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["goob"] = true },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult } }
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
        local _card
        while _card == nil or _card:is_rarity("Legendary") do
            _card = SMODS.create_card({
                set = 'goob',
                legendary = false,
                key_append = "bff",
                edition = "e_negative"
            })
            if _card:is_rarity("Legendary") then
                SMODS.destroy_cards(_card, true, true)
                _card = nil
            end
        end
        G.jokers:emplace(_card)
    end
    end,
    calculate = function(self, card, context)
        if context.other_joker and card ~= context.other_joker and string.find(context.other_joker.config.center.key, "j_goob") ~= nil then
            return {
                x_mult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win' and goobExclusive()
    end
}
function goobExclusive()
    exclusive = false
    for _, joker in ipairs(G.jokers.cards or {}) do
        if (string.find(joker.config.center.key, "j_goob") == nil) then
            exclusive = false
            break
        end
        exclusive = true
    end
    return exclusive
end
