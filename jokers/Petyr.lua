SMODS.Atlas {
	key = 'Petyr',
	path = 'Petyr.png',
	px = 71,
	py = 95
}

SMODS.Joker{
    key = 'Petyr',
    loc_txt = {
        name = 'Yapping Petyr',
        text = {
            '{E:1}Talks a lot{}',
            'When {C:attention}Blind{} is selected lose {C:chips}1{} hand',
            'Sell this joker during a {C:attention}Blind{} to get all lost hands back',
            'with an additional {C:chips}#1#{}',
            '{C:inactive}(Currently would grant {C:chips}#2#{}{C:inactive} hands){}'
        }
    },
    name = 'Petyr',
    atlas = 'Petyr',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            handsInReserve = 1,
            additionalGranted = 1,
        },
        immutable = {handsLost = -1}
    },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = false, 
    perishable_compat = true,
    pools = { ["Meme"] = true, ["goob"] = true },
    loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.additionalGranted, center.ability.extra.handsInReserve} }
	end,
    calculate = function(self, card, context)
        if (context.setting_blind and not (context.blueprint_card or card).getting_sliced) or context.forcetrigger then
            G.E_MANAGER:add_event(Event({
				func = function()
					ease_hands_played(
						card.ability.immutable.handsLost
					)
                   local validMessages = {'YAP!','Loading...', 'Got your nose', 'What will I say next?', 'Did someone say \'Cheese\'?', 'Why did the Petyr cross the road?', 'Pranked ya!', '67', '69', '420', '80085', '1337','@grok is this true', 'Calm Down','SKIP','Should have grabbed the tag', 'We have a Giraffe!', 'I saw Red vent in electrical!', 'I\'m the rival!', 'Are you winning, son?', 'Whatever you do, don\'t sell me!', 'Legendary Petyr has funnier jokes', 'moneymoney', 'I\'d rather play GOOT™', 'there is no way a bee should be able to fly.', 'Kyrsaku is cool', 'Hamburger', 'What is this monopoly?', 'Wait, this isn\'t poker?',  'Play that card!', 'PERRSONA!', 'Cinema', 'SO DANCE!', 'Happy Birthday!', '+8 antes', '+10,000 mult I promise', 'Such A Good Theory!', 'Yo Momma!', 'This message is so freakishly long you cant possibly read it before it expir--', 'TIME', 'FATE!', 'Hey Petyr!', 'This Is Fine!', 'Trolo', 'Git Gud!', '-1 Hand', 'Game Over!', 'Yummy'}
                    card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
						message = pseudorandom_element(validMessages, pseudoseed('seed')),
                        delay = 1.9,
                        colour = G.C.CHIPS,
                        sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5
					})
					return true
				end,
			}))
            card.ability.extra.handsInReserve = card.ability.extra.handsInReserve + card.ability.extra.additionalGranted
        end
        if context.buying_card and context.card ~= card then
            local buyQuotes = {'Fair trade..', 'Do not forget about interest!', 'Shoulda bought the other one', 'Decisions..decisions..'}
            card_eval_status_text(card, "extra", nil, nil, nil, {
				message = pseudorandom_element(buyQuotes, pseudoseed('seed')),
                delay = 1.8,
                colour = G.C.RED,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5
			})
        end
        if context.selling_self then
            ease_hands_played(card.ability.extra.handsInReserve)
            local deathQuotes = {'Tell My Wife, I Had Another Wife', 'That\'s it, give me the controller', 'Co-Op Balatro coming soon!', 'Tag me in coach!', 'Time to show you how its done!', 'My turn', 'Needle this!', 'Rescue order recieved from Petyr', 'You phoned a friend', 'I\'m only doing this once, pal', 'The blind does NOT pass go, it does NOT collect 200 dollarydoos', 'You used a pac-a-punch!', 'Aw, man!', 'GET DOWN MR.PRESIDENT!', 'Protection is here!', 'Is This Your Card?', '#@!$', '****', 'Nah, I\'d win', 'TO WAR!!', 'I didn\'t hear no bell', 'Time to kick ass and chew bubble gum...', 'LOCK IN', 'Waitwait I have so much more to talk about!', 'Fine, I\'ll go play GOOT™', 'Didja forget about me?', 'I got you bro', 'If you sold me during the shop, get scammed', 'Execution attack: Sell joker', 'Oof ouchies my bones', 'Admit it, I\'m a better Mr.Bones!', 'Hand number go burr', 'and I was 2 blinds away from retirement!', 'YA\' NEED A LITTLE REVIVE?', 'Petyr, title: ante 8 slayer', 'It has to go through me, before it goes through you!', 'I AM the Petyr that TALKS.', 'Wait why do I hear final boss music', 'This is just your first phase'}
            card_eval_status_text(card, "extra", nil, nil, nil, {
				message = pseudorandom_element(deathQuotes, pseudoseed('seed')),
                delay = 3.3,
                colour = G.C.RED,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5
			})
        elseif context.selling_card then
            if context.card.ability.name == 'Jobingles' or context.card.ability.name == 'Jobangles' then
                local binglesQuotes = {'Monster!','Do you want to have a bad time?', 'I am banning you.', 'timeout', 'idiot box is that way', 'Sleep with one eye open', 'Too far...', 'Is this competitive GOOT?', 'Micah...'}
                card_eval_status_text(card, "extra", nil, nil, nil, {
				message = pseudorandom_element(binglesQuotes, pseudoseed('seed')),
                delay = 1.8,
                colour = G.C.RED,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5
			}) elseif context.card.ability.name == 'Kerry' then
                local kerryQuotes = {'Read the card!', 'Misplay!', 'You made him sad, not mad!', 'I miss him already', 'I hope you didn\'t expect a transformation there', 'He\'s hu--oh wait, no he isn\'t', 'All\'s well that ends well' }
                card_eval_status_text(card, "extra", nil, nil, nil, {
				message = pseudorandom_element(kerryQuotes, pseudoseed('seed')),
                delay = 1.8,
                colour = G.C.RED,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5
			}) elseif context.card.ability.name == 'Kerry_rage' then
                local kerryAngyQuotes = {'That is one way to get rid of him!', 'Timeout, Ker', 'He was giving off bad vibes', 'He will get over it'}
                card_eval_status_text(card, "extra", nil, nil, nil, {
				message = pseudorandom_element(kerryAngyQuotes, pseudoseed('seed')),
                delay = 1.8,
                colour = G.C.RED,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5 })
                elseif context.card.ability.name == 'Gold_Bot' then
                local greedQuotes = {'Enough skipping!', 'nat 1!', 'Did you know he can roll with advantage?', 'Patch notes: rolls a d20 instead!','Shutting down..'}
                card_eval_status_text(card, "extra", nil, nil, nil, {
				message = pseudorandom_element(greedQuotes, pseudoseed('seed')),
                delay = 1.8,
                colour = G.C.RED,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5 })
                elseif context.card.ability.name ~= 'Petyr' then
                local witnessQuotes = {'I won\'t squeal!', 'Not me next!', 'Trade and barter', 'At least you aren\'t a hoarder!', 'Who buys these anyway?', 'Did I just witness a murder?', 'Warning: you got money', 'Yeah, that joker needs a buff', 'Waste of space eliminated', 'but nobody came...'}
                card_eval_status_text(card, "extra", nil, nil, nil, {
				message = pseudorandom_element(witnessQuotes, pseudoseed('seed')),
                delay = 1.8,
                colour = G.C.RED,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5
                })
            end
        end
        if context.skip_blind then
            local skipQuotes = {'You sure?', 'No takes backs', 'Gold bot roll 1d6', 'RIP shop', 'Bold strategy, cotton', 'Obtained tag: get Petyr!', 'That blind would have been too easy', 'You would have lost that blind anyway', 'That tag better be worth it', 'Where is the time to talk?', 'Rushing...', 'PLAY', 'Coward!'}
            card_eval_status_text(card, "extra", nil, nil, nil, {
				message = pseudorandom_element(skipQuotes, pseudoseed('seed')),
                delay = 1.8,
                colour = G.C.RED,
                sound = 'voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5
                })
        end
    end
}