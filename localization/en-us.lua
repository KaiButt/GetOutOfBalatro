return {
	["misc"] = {
		["achievement_names"] = {
			["ach_goob_jobros"] = "Clown Show",
		},
		["achievement_descriptions"] = {
			["ach_goob_jobros"] = "Win a run with both Jobangles and Jobingles.",
		},
		["labels"] = {
			["goob_wondrousmagic_seal"] = {
				"Wondrous Seal",
			},
		}
	},
	["descriptions"] = {
		["Tarot"] = {
			["c_goob_wands"] = {
				["label"] = "4 Of Wands",
				["name"] = "4 Of Wands",
				["text"] = {
					"Enhances {C:attention}#1#{} selected",
					"cards into",
					"{C:attention}Flower Cards{}."
				},
			}
		},
		["Spectral"] = {
			["c_goob_Vortex"] = {
				["label"] = "Vortex",
				["name"] = "Vortex",
				["text"] = {
					"Add a {C:dark_edition}Wondrous Seal{}",
                    "to {C:attention}#1#{} selected",
                    "card in your hand.",
					"{C:inactive}(this will un-debuff the card immediately){}"
				}
			}
		},
		["Enhanced"] = {
			["m_goob_flower"] = {
				["name"] = "Flower Card",
				["text"] = {
					"{C:chips}+#1#{} Extra Chips,",
					"{C:mult}+#2#{} Mult"
				},
			},
		},
		["Other"] = {
			["goob_wondrousmagic_seal"] = {
				["label"] = {
					"Wondrous Seal",
				},
				["name"] = {
					"Wondrous Seal",
				},
				["text"] = {
					"Card {C:attention}always scores{} and is {C:attention}Debuff immune{}.",
					"Also does a random {C:dark_edition}Wondrous{} effect",
					"when scored."
				},
			},
			["goob_improvements"] = {
				["name"] = '{C:dark_edition}Improvements{}',
				["text"] = {
					'Are special attributes',
					'that modify a card:',
					'{C:dark_edition}Enhancement{}, {C:dark_edition}Seal{} and {C:dark_edition}Edition{}.',
				}
			},
			["goob_upgrade"] = {
				["name"] = '{E:2,C:dark_edition}Upgrade{}',
				["text"] = {
					'Edition becomes {E:2,C:dark_edition}Negative{}.',
					'{X:mult,C:white}+X#1#{} Mult when scored,',
					'{X:mult,C:white}+X#2#{} Mult when held.'
				}
			}
		},
		["Back"] = {
			["b_goob_sohikosa"] = {
				["name"] = "Royal Deck",
				["unlock"] = {
					"Beat the game with",
					"{C:attention}abandoned deck{} on any difficulty."
				},
				["text"] = {
					"Replaces the lowest",
					"{C:attention}three{} ranks with",
					"a {C:attention}copy{} of each face card."
				}
			},
			["b_goob_chronomancer"] = {
				["name"] = "Lost Deck",
				["unlock"] = {
					"Beat Ante {C:attention}9{} on any difficulty"
				},
				["text"] = {
					"{C:attention}-1{} Starting Ante,",
					"{C:attention}+1{} Ante required to win"
				}
			},
			["b_goob_MainDeck"] = {
				["name"] = "Main Deck",
				["text"] = {
					"Only G.O.O.B Jokers will appear."
				}
			}
		},
		["Sleeve"] = {
			["sleeve_goob_MainSleeve"] = {
				["name"] = "Main Sleeve",
				["unlock"] = {
					"Beat the game with {C:attention}Main Deck{}",
					"on any difficulty."
				},
				["text"] = {
					"Only G.O.O.B Jokers will appear."
				}
			},
			["sleeve_goob_MainSleeve_alt"] = {
				["name"] = "Main Sleeve",
				["unlock"] = {
					"Beat the game on {C:attention}Main Deck{} on any difficulty.",
				},
				["text"] = {
					"{C:attention}+1{} Joker slot."
				}
			},
			["sleeve_goob_sohiSleeve"] = {
				["name"] = "Royal Sleeve",
				["unlock"] = {
					"Beat the game with {C:attention}Royal Deck{}",
					"on any difficulty."
				},
				["text"] = {
					"Replaces the lowest",
					"{C:attention}three{} ranks with",
					"a {C:attention}copy{} of each face card."
				}
			},
			["sleeve_goob_sohiSleeve_alt"] = {
				["name"] = "Royal Sleeve",
				["unlock"] = {
					"Beat the game on {C:attention}Royal Deck{} on any difficulty ",
				},
				["text"] = {
					"also removes the lowest",
					"{C:attention}fourth{} rank.",
				}
			},
			["sleeve_goob_chronoSleeve"] = {
				["name"] = "Lost Sleeve",
				["unlock"] = {
					"Beat the game on {C:attention}Lost Deck{} on any difficulty.",
				},
				["text"] = {
					"{C:attention}-1{} Starting Ante,",
					"{C:attention}+1{} Ante required to win"
				}
			},
			["sleeve_goob_chronoSleeve_alt"] = {
				["name"] = "Lost Sleeve",
				["unlock"] = {
					"Beat the game on {C:attention}Lost Deck{} on any difficulty.",
				},
				["text"] = {
					"{C:blue}+1{} Hand-Size, {C:red}+1{} Discard, {C:attention}+1{} Win Ante."
				}
			},
		},
		["Tag"] = {
			["tag_goob_goblinParty"] = {
				["name"] = "Goblin Party!",
				["text"] = {
					"Shop has a free {C:attention}G.O.O.B{} joker.",
				},
			},
		},
		["Joker"] = {
			["j_goob_PowerCore"] = {
				["name"] = "Power Core",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult.",
					"Hands that have less then {C:attention}4{} Scored Cards",
					"{C:red}Won't Score{}."
				}
			},
			["j_goob_Diamonds"] = {
				["name"] = "Diamonds",
				["text"] = {
					'Cards with an {C:dark_edition}improvement{} are drawn first,',
					'you may invert this effect at any time.',
				}
			},
			["j_goob_Diamonds_alt"] = {
				["name"] = "Inverted Diamonds",
				["text"] = {
					'Cards with an {C:dark_edition}improvement{} are drawn last,',
					'you may revert this effect at any time.',
				}
			},
			["j_goob_Marie"] = {
				["name"] = "Marie",
				["text"] = {
					'{C:red,E:1}sometimes speaks French{}.',
					'{C:green,E:1}Removes{} {C:red}negative{} G.O.O.B Joker effects.',
					'{C:inactive}(For positive effects, they will still have been considered to have occurred)',
					'When Blind is {C:attention}selected{} reduces {C:attention}Blind{} {C:purple}requirement{} by {C:purple}#1#{}%.',
				}
			},
			["j_goob_Henry"] = {
				["name"] = "Heroic Henry",
				["text"] = {
					"{C:red}#1#{} Mult during played hands of",
					"{C:attention}Small{} and {C:attention}Big{} Blinds.",
					"Gain the total {C:mult}Mult{} lost during played hands of {C:attention}Boss Blinds{}.",
					"{C:inactive}(Current Bonus:{}{C:mult} +#2#{}{C:inactive}){}"
				}
			},
			["j_goob_Tommy"] = {
				["name"] = "Big Tommy",
				["text"] = {
					"{C:chips}+#1#{} Chips,",
					"{C:red}#2#{} Joker Slots.",
				}
			},
			["j_goob_Astroheim"] = {
				["name"] = "Astroheim",
				["text"] = {
					"After defeating a {C:attention}Boss Blind{},",
					"{C:attention}Levels Up{} the most played poker hand {C:attention}#1#{} time.",
				}
			},
			["j_goob_MrFlowers"] = {
				["unlock"] = {
					"Have a deck that consists of only {C:attention}Flower Cards{}."
				},
				["name"] = "Mr.Flowers",
				["text"] = {
					"When {C:attention}Blind{} is Skipped,",
					"adds {C:attention}#1#{} {C:inactive}(identical){} {C:attention}Flower Cards{} to deck.",
				}
			},
			["j_goob_Clarence"] = {
				["name"] = "Cheating Clarence",
				["text"] = {
					"During {C:attention}First Hand{} of {C:attention}Boss Blinds{},",
					"all {C:attention}listed{} {C:green,E:1,S:1.1}probabilities{}",
					"are {C:green,E:1,S:1.1}guaranteed{}.",
					"{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}3 in 3{C:inactive})",
				}
			},
			["j_goob_Nobingles"] = {
				["name"] = "Nobingles",
				["text"] = {
					"Earn {C:money}$#1#{} at",
					"end of round.",
					"{C:red}Decrease{} this bonus by {X:red,C:white}X#2#{} if you score",
					"a card with an {C:dark_edition}improvement{} during the round."
				}
			},
			["j_goob_broBingles"] = {
				["name"] = "Brobingles",
				["text"] = {
					"Can not be {C:attention}debuffed{}.",
					"When a {C:attention}playing card{} is added to your deck,",
					"it gains {C:dark_edition}Wondrous Seal{}.",
					"{C:inactive}({C:attention}overrides{} {C:inactive}other seals){}",
				}
			},
			["j_goob_Kabi"] = {
				["unlock"] = {
					"Beat ante {C:attention}9{}.",
				},
				["name"] = "Kabi",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult.",
					"The first time you gain {X:mult,C:white}Mult{} this way,",
					"{C:attention}+#2#{} {C:red,E:2}Ante{} required to win.",
					"{C:inactive}(even if this joker is removed){}"
				}
			},
			["j_goob_Seaglass"] = {
				["name"] = "Seaglass",
				["text"] = {
					"Earn {C:gold}$#1#{} at end of round.",
					"Valuable, but if removed {C:mult}lose{} your {E:1}soul{}.",
					"{C:inactive}(Son Of A--){}"
				}
			},
			["j_goob_Dupla"] = {
				["unlock"] = {
					"Redeem both {C:attention}Magic Trick{} and {C:attention}Illusion{}.",
				},
				["name"] = "Dupla",
				["text"] = {
					"When a {C:attention}playing card{} is created,",
					"gain {C:attention}#1#{} additional copy to deck.",
				},
			},
			["j_goob_Presto"] = {
				["name"] = "Presto",
				["text"] = {
					"Cards with a {C:attention}seal{}",
					'are played {C:attention}#1#{} additional time.',
				}
			},
			["j_goob_Kai"] = {
				["name"] = "Kai",
				["text"] = {
					"{C:dark_edition}Wondrous{} effects are {C:green,E:1,S:1.1}guaranteed{} to be {C:dark_edition}Extra Wondrous{}."
				}
			},
			["j_goob_Crownos"] = {
				["unlock"] = {
					"Beat ante {C:attention}-1{}.",
				},
				["name"] = "Crownos",
				["text"] = {
					"When you would die,",
					"{C:attention}-#1#{} Ante, {C:dark_edition}+#2#{} Joker Slots, and prevents it.",
					"{C:red,E:2}self-destructs{}."
				},
			},
			["j_goob_King"] = {
				["unlock"] = {
					"Have only {C:attention}Kings{} in your deck.",
				},
				["name"] = "The King",
				["text"] = {
					"When a card is scored",
					"{C:attention}increases{} its rank, up to {C:attention}King{}.",
				},
			},
			["j_goob_Yokomo"] = {
				["unlock"] = {
					"Have only {C:attention}Enhanced{} cards in your deck.",
				},
				["name"] = "Yokomo",
				["text"] = {
					"When a card is scored, {C:green}#1# in #2#{} chance to give it",
					"a random {C:attention}Enhancement{}. If it already has one,",
					"it gains permanent Chips equal to its base Chip amount instead",
				},
			},
			["j_goob_Scaler"] = {
				["name"] = "Scaler",
				["text"] = {
					"{C:mult}+#1#{} Mult.",
					"Gains {C:mult}+#2#{} Mult after every {C:attention}Boss Blind{}.",
				},
			},
			["j_goob_Gondo"] = {
				["name"] = "Gondo",
				["text"] = {
					"{C:attention}+#1#{} card slot",
					"available in shop.",
					"{C:inactive}(Also refreshes the shop on gain){}"
				},
			},
			["j_goob_Thomas"] = {
				["unlock"] = {
					"Discard a",
					"{E:1,C:attention}Flush Five{}.",
				},
				["name"] = "Thomas",
				["text"] = {
					"Every discarded {C:attention}card{}",
					"permanently gains",
					"{C:chips}+#1#{} Chips when scored.",
				},
			},
			["j_goob_Kerry"] = {
				["name"] = "Kerry",
				["text"] = {
					"{C:mult}+#1#{} Mult",
					"When debuffed or destroyed,",
					"becomes {C:attention}enraged{} instead.",
					"{C:inactive}({}{C:attention}Stickers{} {C:inactive}will be removed){}",
				},
			},
			["j_goob_Jobingles"] = {
				["name"] = "Jobingles",
				["text"] = {
					"The next time you play a singular card",
					"{E:2,C:dark_edition}Upgrades it{}. It will",
					"{C:attention}return{} to your hand after scoring.",
					"{C:inactive}(and if destroyed, will be regained){}"
				},
			},
			["j_goob_Kerry_rage"] = {
				["name"] = "Enraged Kerry",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"Can't be {C:attention}debuffed{} or {C:attention}destroyed{}.",
					"{C:inactive}(Will still trigger on destroy effects as if it was destroyed){}",
				},
			},
			["j_goob_Gelbon"] = {
				["unlock"] = {
					"Win a run with a {C:attention}Straight{}.",
				},
				["name"] = "Gelbon The Nerd",
				["text"] = {
					"Gains {C:mult}+#2#{} Mult",
					"if played hand",
					"contains a {C:attention}Straight{}.",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
				},
			},
			["j_goob_Mancomb"] = {
				["unlock"] = {
					"Redeem both {C:attention}reroll surplus{} and {C:attention}reroll glut{}.",
				},
				["name"] = "Mancomb",
				["text"] = {
					"This Joker gains {C:chips}+#1#{} Chips",
					"per {C:attention}reroll{} in the shop.",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
				},
			},
			["j_goob_Skull"] = {
				["unlock"] = {
					"Sell a total of {C:attention}30{} Joker cards.",
					"{C:inactive}(#1#)",
				},
				["name"] = "Menacing Skull",
				["text"] = {
					"This Joker gains {C:mult}+#2#d#3#{} Mult when a Joker is {C:attention}sold{}.",
					"{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult)",
				},
			},
			["j_goob_StarAce"] = {
				["unlock"] = {
					"Unlocked with {C:green}Luck{}.",
					"{C:inactive}(1 in 12 chance to unlock when you win a blind){}",
				},
				["name"] = "Star Ace",
				["text"] = {
					"{C:mult}+#1#d#2#{} Mult.",
					"When any G.O.O.B die is rolled, it is rolled with {C:attention}advantage{}.",
				},
			},
			["j_goob_Greg"] = {
				["name"] = "Greg",
				["text"] = {
					"{C:attention}+#1#{} hand size.",
					"{C:inactive}(Rolls {C:attention}1d5{}{C:inactive} at end of round.){}",
				},
			},
			["j_goob_Gold_Bot"] = {
				["name"] = "Gold Bot",
				["text"] = {
					"When {C:attention}Blind{} is skipped,",
					"gain {C:gold}$#1#d#2#{}.",
				},
			},
			["j_goob_Sunny"] = {
				["unlock"] = {
					"Lose {C:attention}1{} run.",
				},
				["name"] = "Loyal Guardian Sunny",
				["text"] = {
					"Adjacent Jokers give {X:mult,C:white}X#1#{} Mult.",
					"G.O.O.B Jokers give {X:mult,C:white}X#2#{} Mult instead.",
				},
			},
			["j_goob_Sgt"] = {
				["name"] = "Sgt",
				["text"] = {
					"{X:grey,C:edition}Negative{} Jokers are {C:attention}#1#X{} more likely to appear.",
				},
			},
			["j_goob_Ally"] = {
				["name"] = "Gamblin' Sage",
				["text"] = {
					"When a G.O.O.B die is {C:attention}rolled{},",
					"Gain {C:gold}$#1#{}.",
				},
			},
			["j_goob_Petyr"] = {
				["name"] = "Yapping Petyr",
				["text"] = {
					"{E:1}Talks a lot{}.",
					"{C:red}-1{} hand per round.",
					"Sell this Joker during a {C:attention}Blind{} to get all lost hands back",
					"with an additional {C:chips}#1#{}.",
					"{C:inactive}(Currently would grant {C:chips}#2#{}{C:inactive} hands){}",
				},
			},
			["j_goob_Inversi"] = {
				["unlock"] = {
					"Win a run with",
					"{C:attention}Erratic Deck{}",
					"on any difficulty.",
				},
				["name"] = "Inversi",
				["text"] = {
					".spihC {C:chips}#2#d#1#+{}",
				},
			},
			["j_goob_Boblin"] = {
				["name"] = "Boblin",
				["text"] = {
					"When {C:attention}Small Blind{} is skipped, cause a {C:green}Goblin Party!{}",
					"All your Jokers are considered {X:black,C:edition,E:1}Mercenaries{}.",
				},
			},
			["j_goob_Deathkill"] = {
				["unlock"] = {
					"Win a run with {C:attention}$0{}.",
				},
				["name"] = "Deathkill 4.0",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult.",
					"When {C:attention}Blind{} is selected",
					"{C:attention}Lose all {C:gold}Gold{}.",
				},
			},
			["j_goob_Harmony"] = {
				["name"] = "Harmony",
				["text"] = {
					"{C:attention}+#1#{} hand size.",
					"Rolls {C:attention}#2#d#3#{} at end of round. On a {C:attention}#3#{} is destroyed.",
				},
			},
			["j_goob_Ante"] = {
				["name"] = "Ante",
				["text"] = {
					"Gains {X:mult,C:white}+X#1#{} Mult,",
					"when any G.O.O.B die is {C:attention}rolled{}.",
					"{C:inactive}(Currently: {}{X:mult,C:white}X#2#{} {C:inactive}Mult{}{C:inactive}){}",
				},
			},
			["j_goob_Blaze"] = {
				["unlock"] = {
					"Beat a {C:attention}Boss Blind{} with at most {C:attention}5{} cards in your deck.",
				},
				["name"] = "Blaze",
				["text"] = {
					"{C:blue}+#1#{} hand per round.",
					"Every card you {C:attention}play{}",
					"Will be {C:attention}shuffled back{} into your {C:attention}deck{}.",
				},
			},
			["j_goob_Charles"] = {
				["unlock"] = {
					"Win a run with a {E:1,C:purple}Legendary{}.",
				},
				["name"] = "Charles",
				["text"] = {
					"{E:1,C:purple}Legendaries{} appear in the shop,",
					"and get {C:attention}#1#%{} off.",
				},
			},
			["j_goob_Digger"] = {
				["unlock"] = {
					"Have at least {C:gold}$200{}.",
				},
				["name"] = "Digger Of The Golden Sands",
				["text"] = {
					"{C:mult}+#1#{} Mult.",
					"Lose {C:gold}$#2#{} at the end of the round",
					"If you can not pay, {C:red,E:2}self-destructs{}.",
				},
			},
			["j_goob_Jobangles"] = {
				["name"] = "Jobangles",
				["text"] = {
					"When {C:attention}Blind{} is selected, a random card in deck",
					"gets {C:attention}destroyed{}. This Joker",
					"gains Chips equal to {C:chips}X#2#{} the unenhanced rank destroyed.",
					"Last card destroyed: {C:attention}#3#{} of {C:attention}#4#{}",
					"{C:inactive}(Current chip bonus:{C:chips} +#1#{}{C:inactive})",
				},
			},
			["j_goob_LLEHNINRUB"] = {
				["unlock"] = {
					"Defeat {C:attention}Amber Acorn{}.",
				},
				["name"] = "LLEHNINRUB",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult.",
					"When {C:attention}Blind{} is selected,",
					"{C:red}flips and shuffles{} ALL Jokers.",
				},
			},
			["j_goob_Fox"] = {
				["unlock"] = {
					"Win a run with only G.O.O.B Jokers.",
				},
				["name"] = "Blessed Fox",
				["text"] = {
					"When gained, creates a random {X:grey,C:edition}negative{} G.O.O.B Joker.",
					"Other G.O.O.B Jokers each give {X:mult,C:white}X#1#{} Mult.",
				},
			},
			["j_goob_Wysguy"] = {
				["unlock"] = {
					"Win a run with any",
					"deck on",
					"{C:attention}Gold Stake{} difficulty.",
				},
				["name"] = "Wysguy",
				["text"] = {
					"Has a {C:dark_edition}Unique{} effect for each deck.",
					"{C:inactive}(Are you wise enough to figure it out?){}",
				},
			},
		},
	},
}
