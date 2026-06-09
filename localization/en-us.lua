return {
	["misc"] = {
		["achievement_names"] = {
			["ach_goob_jobros"] = "Clown Show",
		},
		["achievement_descriptions"] = {
			["ach_goob_jobros"] = "Win a run with both Jobangles and Jobingles",
		},
		["labels"] = {
			["goob_wondrousmagic_seal"] = {
				"Wondrous",
			},
		}
	},
	["descriptions"] = {
		["Other"] = {
			["goob_wondrousmagic_seal"] = {
				["label"] = {
					"Wondrous",
				},
				["name"] = {
					"Wondrous",
				},
				["text"] = {
					"Card {C:attention}always scores{}",
					"Does a random {C:dark_edition}Wondrous{} effect",
					"when scored."
				},
			},
		},
		["Back"] = {
			["b_goob_sohikosa"] = {
				["name"] = "Sohikosa's Royal Deck",
				["unlock"] = {
					"Beat the game with",
					"{C:attention}abandoned deck{} on any difficulty"
				},
				["text"] = {
					"Replaces the lowest",
					"{C:attention}three{} ranks with",
					"a {C:attention}copy{} of each face card"
				}
			}
		},
		["Sleeve"] = {
			["sleeve_goob_sohiSleeve"] = {
				["name"] = "Sohikosa's Royal Sleeve",
				["unlock"] = {
					"Beat the game with {C:attention}Sohikosa's Royal Deck{}",
					"on any difficulty"
				},
				["text"] = {
					"Replaces the lowest",
					"{C:attention}three{} ranks with",
					"a {C:attention}copy{} of each face card"
				}
			},
			["sleeve_goob_sohiSleeve_alt"] = {
				["name"] = "Sohikosa's Royal Sleeve",
				["unlock"] = {
					"Beat the game on {C:attention}Shoikosa's Royal Deck{} on any difficulty ",
				},
				["text"] = {
					"also removes the lowest",
					"{C:attention}fourth{} rank and start the run",
					"with a {C:dark_edition}negative{} {C:attention}pareidolia{} Joker"
				}
			}
		},
		["Tag"] = {
			["tag_goob_goblinParty"] = {
				["name"] = "Goblin Party!",
				["text"] = {
					"Shop has a free {C:attention}G.O.O.B{} joker",
				},
			},
		},
		["Joker"] = {
			["j_goob_Dupla"] = {
				["unlock"] = {
					"Redeem both {C:attention}Magic Trick{} and {C:attention}Illusion{}",
				},
				["name"] = "Dupla",
				["text"] = {
					"{C:attention}Playing Cards{} and Playing Card {C:attention}boosters{} in the",
					"shop are {C:attention}free{}. When a",
					"{C:attention}playing card{} is created, it comes with {C:attention}#1#{} additional copy.",
					"{C:inactive}(the additional copy goes to your deck){}"
				},
			},
			["j_goob_Presto"] = {
				["name"] = "Presto",
				["text"] = {
					"When gained add a {C:attention}Card{} with a {C:dark_edition}Wondrous{} seal",
					"Every played {C:attention}Card{} with a {C:dark_edition}Wondrous{} seal",
					'permanently gains',
					"{C:mult}+#1#{} Mult when scored",
				}
			},
			["j_goob_Kai"] = {
				["name"] = "Kai Master Wizard Of The Wonder Arts",
				["text"] = {
					"When gained and after drawing your first hand each blind,",
					"places a {C:dark_edition}Wondrous{} seal to the top card of deck",
					"{C:inactive}(if one exists, and{} {C:attention}overrides{} {C:inactive}other seals){}",
					"{C:dark_edition}Wondrous{} seals are even more {C:dark_edition}Wonderful{}"
				}
			},
			["j_goob_Crownos"] = {
				["unlock"] = {
					"Beat ante {C:attention}-1{}",
				},
				["name"] = "Crownos",
				["text"] = {
					"After completing the next {C:attention}Blind{}",
					"{C:attention}-#1#{} ante, {C:dark_edition}+#2#{} Joker Slot,",
					"and {C:red,E:2}self destructs{}",
				},
			},
			["j_goob_King"] = {
				["unlock"] = {
					"Have only {C:attention}Kings{} in your deck",
				},
				["name"] = "The King",
				["text"] = {
					"When a card is scored,",
					"{C:attention}increases{} its rank, up to {C:attention}King{}",
					"Gains {C:gold}$#1#{} for each {C:attention}King{} in deck",
					"{C:inactive}(Currently: {}{C:gold}$#2#{}{C:inactive}){}",
				},
			},
			["j_goob_Yokomo"] = {
				["unlock"] = {
					"Have only {C:attention}Enhanced{} cards in your deck",
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
					"{C:mult}+#1#{} Mult",
					"Gains {C:mult}+#2#{} Mult after every {C:attention}Boss Blind{}",
				},
			},
			["j_goob_Gondo"] = {
				["name"] = "Gondo",
				["text"] = {
					"{C:attention}+#1#{} card slot",
					"available in shop",
				},
			},
			["j_goob_Thomas"] = {
				["unlock"] = {
					"Discard a",
					"{E:1,C:attention}Flush Five",
				},
				["name"] = "Thomas",
				["text"] = {
					"Every discarded {C:attention}card{}",
					"permanently gains",
					"{C:chips}+#1#{} Chips when scored",
				},
			},
			["j_goob_Kerry"] = {
				["name"] = "Kerry",
				["text"] = {
					"{C:mult}+#1#{} Mult",
					"When debuffed or destroyed,",
					"becomes {C:attention}enraged{} instead",
					"{C:inactive}({}{C:attention}Stickers{} {C:inactive}will be removed){}",
				},
			},
			["j_goob_Jobingles"] = {
				["name"] = "Jobingles",
				["text"] = {
					"Adds #1# card",
					"with an {X:grey,C:edition}edition{} to deck when",
					"{C:attention}Blind{} is selected",
					"Last card added: {C:attention}#4#{} of {C:attention}#5#{}",
					"{C:inactive}(Max {C:attention}#2#{C:inactive} cards)",
					"played cards with an {X:grey,C:edition}edition{} each give",
					"{X:mult,C:white}X#3#{} Mult when scored",
				},
			},
			["j_goob_Kerry_rage"] = {
				["name"] = "Enraged Kerry",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"Can't be {C:attention}debuffed{} or {C:attention}destroyed{}",
					"{C:inactive}(Will still trigger on destroy effects as if it was destroyed){}",
				},
			},
			["j_goob_Gelbon"] = {
				["unlock"] = {
					"Win a run with a {C:attention}Straight{}",
				},
				["name"] = "Gelbon The Nerd",
				["text"] = {
					"Gains {C:mult}+#2#{} Mult",
					"if played hand",
					"contains a {C:attention}Straight{}",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
				},
			},
			["j_goob_Mancomb"] = {
				["unlock"] = {
					"Redeem both {C:attention}reroll surplus{} and {C:attention}reroll glut{}",
				},
				["name"] = "Mancomb",
				["text"] = {
					"This Joker gains {C:chips}+#1#{} Chips",
					"per {C:attention}reroll{} in the shop",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
				},
			},
			["j_goob_Skull"] = {
				["unlock"] = {
					"Sell a total of {C:attention}30{} Joker cards",
					"{C:inactive}(#1#)",
				},
				["name"] = "Menacing Skull",
				["text"] = {
					"This Joker gains {C:mult}+#2#{} Mult when a Joker is {C:attention}sold{}",
					"{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult)",
				},
			},
			["j_goob_StarAce"] = {
				["unlock"] = {
					"Unlocked with {C:attention}Luck{}",
					"{C:inactive}(1 in 12 chance to unlock when you win a blind){}",
				},
				["name"] = "Star Ace",
				["text"] = {
					"{C:mult}+#1#d#2#{} Mult",
					"When any G.O.O.B die is rolled, it is rolled with {C:attention}advantage{}",
				},
			},
			["j_goob_Greg"] = {
				["name"] = "Greg",
				["text"] = {
					"{C:attention}+#1#{} hand size",
				},
			},
			["j_goob_Gold_Bot"] = {
				["name"] = "Gold Bot",
				["text"] = {
					"When {C:attention}Blind{} is skipped",
					"Gain {C:gold}$#1#d#2#{} Gold",
				},
			},
			["j_goob_Sunny"] = {
				["unlock"] = {
					"Lose {C:attention}1{} run",
				},
				["name"] = "Loyal Guardian Sunny",
				["text"] = {
					"When this Joker, or an adjacent Joker would be debuffed",
					"{C:green}prevents it{}. Adjacent Jokers give {X:mult,C:white}X#1#{} Mult",
					"G.O.O.B Jokers give {X:mult,C:white}X#2#{} Mult instead",
				},
			},
			["j_goob_Sgt"] = {
				["name"] = "Sgt",
				["text"] = {
					"{X:grey,C:edition}Negative{} Jokers are {C:attention}#1#X{} more likely to show up",
					"Other {X:grey,C:edition}Negative{} Jokers gives {X:mult,C:white}X#2#{} Mult",
				},
			},
			["j_goob_Ally"] = {
				["name"] = "Gamblin' Sage",
				["text"] = {
					"When {C:attention}Blind{} is selected",
					"Rolls {C:attention}#1#d#2#{}",
					"On a #2#, gains {C:gold}#3#{} Gold",
					"and disables the current or next {C:attention}Boss Blind{}",
					"{C:inactive}(Increases the{} {C:attention}minimum roll{} {C:inactive}on failure until success){}",
				},
			},
			["j_goob_Petyr"] = {
				["name"] = "Yapping Petyr",
				["text"] = {
					"{E:1}Talks a lot{}",
					"When {C:attention}Blind{} is selected lose {C:chips}1{} hand",
					"Sell this joker during a {C:attention}Blind{} to get all lost hands back",
					"with an additional {C:chips}#1#{}",
					"{C:inactive}(Currently would grant {C:chips}#2#{}{C:inactive} hands){}",
				},
			},
			["j_goob_Inversi"] = {
				["unlock"] = {
					"Win a run with",
					"{C:attention}Erratic Deck{}",
					"on any difficulty",
				},
				["name"] = "Inversi",
				["text"] = {
					"spihC {C:chips}#2#d#1#+{}",
				},
			},
			["j_goob_Boblin"] = {
				["name"] = "Boblin",
				["text"] = {
					"When {C:attention}Small Blind{} is skipped, cause a {C:green}Goblin Party!{}",
					"All your Jokers are considered {X:black,C:edition,E:1}Mercenaries{}",
				},
			},
			["j_goob_Deathkill"] = {
				["unlock"] = {
					"Win a run with {C:attention}0{} {C:gold}Gold{}",
				},
				["name"] = "Deathkill 4.0",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"When {C:attention}Blind{} is selected",
					"{C:attention}Lose all {C:gold}Gold{}",
				},
			},
			["j_goob_Harmony"] = {
				["name"] = "Harmony",
				["text"] = {
					"{C:attention}+#1#{} hand size",
					"{C:green}#2# in #3#{} chance this card is destroyed at end of round",
				},
			},
			["j_goob_Ante"] = {
				["name"] = "Ante",
				["text"] = {
					"{X:mult,C:white}X#1#d#2#{} Mult",
				},
			},
			["j_goob_Blaze"] = {
				["unlock"] = {
					"Beat a {C:attention}Boss Blind{} with at most {C:attention}5{} cards in your deck",
				},
				["name"] = "Blaze",
				["text"] = {
					"{C:blue}+#1#{} hand per round",
					"Every card you {C:attention}play{}",
					"Will be {C:attention}shuffled back{} into your {C:attention}deck{}",
				},
			},
			["j_goob_Charles"] = {
				["unlock"] = {
					"Win a run with a {E:1,C:purple}Legendary{}",
				},
				["name"] = "Charles",
				["text"] = {
					"{E:1,C:purple}Legendaries{} appear in the shop",
					"{E:1,C:purple}Legendaries{} get {C:attention}#1#%{} off",
					"gain {C:gold}$#2#{} at the end of the round",
					"for each {E:1,C:red}Rare{} and {E:1,C:purple}Legendary{} Joker owned",
					"{C:inactive}(Including this one){}",
				},
			},
			["j_goob_Digger"] = {
				["unlock"] = {
					"Have at least {C:gold}$200{}",
				},
				["name"] = "Digger Of The Golden Sands",
				["text"] = {
					"{C:mult}+#1#{} Mult",
					"Lose {C:gold}$#2#{} Gold at the end of the round",
					"If you can not pay, {C:red,E:2}self destructs{}",
				},
			},
			["j_goob_Jobangles"] = {
				["name"] = "Jobangles",
				["text"] = {
					"When {C:attention}Blind{} is selected a random card in deck",
					"gets {C:attention}destroyed{} and this joker",
					"gains Chips equal to {C:chips}X#2#{} the rank destroyed",
					"extra Chips granted to the card are also given to this joker",
					"Last card destroyed: {C:attention}#3#{} of {C:attention}#4#{}",
					"{C:inactive}(Current chip bonus:{C:chips} +#1#{}{C:inactive})",
				},
			},
			["j_goob_LLEHNINRUB"] = {
				["unlock"] = {
					"Defeat {C:attention}Amber Acorn{}",
				},
				["name"] = "LLEHNINRUB",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"When {C:attention}Blind{} is selected",
					"Flips and shuffles {C:attention}ALL{} Jokers",
				},
			},
			["j_goob_Fox"] = {
				["unlock"] = {
					"Win a run with only G.O.O.B Jokers",
				},
				["name"] = "Blessed Fox",
				["text"] = {
					"When gained, creates a random {X:grey,C:edition}negative{} G.O.O.B Joker",
					"Other G.O.O.B Jokers each give {X:mult,C:white}X#1#{} Mult",
				},
			},
			["j_goob_Wysguy"] = {
				["unlock"] = {
					"Win a run with any",
					"deck on",
					"{C:attention}Gold Stake{} difficulty",
				},
				["name"] = "Wysguy",
				["text"] = {
					"Has a {C:dark_edition}Unique{} effect for each deck",
					"{C:inactive}(Are you wise enough to figure it out?){}",
				},
			},
		},
	},
}
