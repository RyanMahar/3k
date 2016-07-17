;; Blank Gag
/def -ag -t'^$' blank_gag

;; Auto-loading Inventory
/def -ag -t'^(?:> )? 1 \*An ID Card\.' Emerald_Consulting_gag
/def -ag -t'^(?:> )? 1 A gold wedding ring (worn)\.' Wedding_Ring_gag
/def -ag -t'^(?:> )? 1 \*Worn leather book\.' wsea_book_gag
/def -ag -t'^(?:> )? 1 A Rainbow Pride Badge \(worn\)\.' rbpride_badge_gag
/def -ag -t'^(?:> )? 1 \*Clan Symbol of Disorderly Conduct\.' clan_symbol_gag
/def -ag -t'^(?:> )? 1 \*A scavenger hunt item list \(item list\)\.' hunt_list_gag
/def -ag -t'^(?:> )? 1 \*An auction line\.' auction_line_gag
/def -ag -t'^(?:> )? 1 \*A ring of house keys\.' house_keyring_gag
/def -ag -t'^(?:> )? 1 \*Veterinarian\'s Scrubs\.' vet_scrubs_gag
/def -ag -t'^(?:> )? 1 \*A Crafter\'s Satchel\.' satchel_gag
/def -ag -t'^(?:> )? 1 \*Brass Knuckles\.' brawler_knuckles_gag
/def -ag -t'^(?:> )? 1 \*Tactician\'s Manual\.' tacticians_manual_gag
/def -ag -t'^(?:> )? 1 \*Assassin\'s Mark\.' assassin_object_gag
/def -ag -t'^(?:> )? 1 \*A GBC Radio\.' gladiator_gbc_gag
/def -ag -t'^(?:> )? 1 \*Magic: The Gathering Chatline\.' mtg_chat_gag 
/def -ag -t'^(?:> )? 1 \*Safari Hat\.' big_game_hunter_object_gag
/def -ag -t'^(?:> )? 1 \*Boxer\'s Headgear \(worn\)\.' boxer_object_gag

;; Damage Reduction Gags
/def -ag -t'^(?:> )?The sword flashes brightly, absorbing the force of the attack!' vblade_gag
/def -agf -t'^(?:> )?(?:[\w\']+) blade shimmers and ripples with the souls of the deceased\.  Evil' vblade_gag_1
/def -ag -t'^black tendrils snake out from the blade and encoil' vblade_gag_2
/def -ag -t'^The tendrils withdraw, draining the life energy from their victim\.' vblade_gag_3

/def -ag -t'^(?:> )?The sticky cocoon absorbs part of the attack!' cocoon_gag1
/def -ag -t'^(?:> )?The cocoon fuses with the attack and grows stronger!' cocoon_gag2

/def -ag -t'^(?:> )?The amulet fades out of existence for an instant, taking you with it\.' ghostly_gag1
/def -ag -t'^(?:> )?You partially avoid the blow\.' ghostly_gag2

/def -ag -t'^(?:> )?The bracers flare brightly and your form wavers slightly!' bracer_gag1

/def -ag -t'^(?:> )?A flare of light from your (ring|shades) puts (?:[\w\s\,\-]+) off (?:his|her|its) attack\.' carn_gag1
/def -ag -t'^(?:> )?Light flashes off your (?:ring|shades), briefly distracting (?:[\w\s\,\-]+)\.' carn_gag2
/def -ag -t'^(?:> )?A (?:[\w\s\,\-]+) is distracted by seeing (?:his|her|its) reflection in your (?:ring|shades)\.' carn_gag3

/def -ag -t'^(?:> )?The amulet flashes, and Inix seems to phase out of existence\.' voraxis_gag1
/def -ag -t'^(?:> )?Your amulet flashes, and you phase out of harms way!' voraxis_gag2

/def -ag -t'^(?:> )?The impact soaks some of the blood from the robe into your body\.' therlasia_gag

/def -ag -t'^(?:> )?(?:[\w\s]+) gets injured by the acid!$' shrag_gag
/def -ag -t' gets injured on (?:\w+)\'s armor!$' shrag_gag2

/def -ag -t'^Your feral rage allows you to shrug off' frenzy_gag1
/def -ag =t'YOU FRENZY!!!' frenzy_gag2

/def -ag -t'^(?:> )?Your shield blocks' shield_gag
/def -ag -t'^(?:> )?Your jumpjets ignite' jj_gag
/def -ag -t'^(?:> )?You nimbly dodge' dodge_gag

;; Regen gags
/def -ag -p5 -t'^(?:> )?You say: WOOF!  Woof woof WOOF!$' dog_collar_gag
/def -ag -t'^(?:> )?Warmth and life force flows into you through your hand.$' crel_gag
/def -ag -t'^(?:> )?You feel your stuff recharge.$' xmas_gag
/def -ag -t'^(?:> )?Freeway gives you a warm hug\.$' freeway_gag1
/def -ag -t'^(?:> )?Freeway licks your hand\.$' freeway_gag2
/def -ag -t'^(?:> )?Freeway snuggles up to you lovingly\.$' freeway_gag3
/def -ag -t'^(?:> )?Freeway gives you a small kiss\.$' freeway_gag4
/def -ag -t'^(?:> )?Freeway nuzzles into your arms\.$' freeway_gag5

;; Melee Gags
/def -ag -t'^\[Other\]' other_gag
/def -ag -t'^(?:> )?hide' hide_gag

;; Valyn's Maul
/def -ag -t'^(?:> )?The radiant shadow of (?:\w+)\'s mace works an extra blow!' valyn_gag1
/def -ag -t'^(?:> )?The azure shadow of (?:\w+)\'s war mace causes a surprise hit!' valyn_gag2
/def -ag -t'^(?:> )?The electric ghosting of (?:\w+)\'s war mace makes a surprise hit!' valyn_gag3
/def -ag -t'^(?:> )?Ozone fills the air from the intense battle\.' valyn_gag4
/def -ag -t'^(?:> )?The energized shadow of (?:\w+)\'s hammer causes a second blow!' valyn_gag5
/def -ag -t'^(?:> )?The radiant tracing of (?:\w+)\'s mace strikes an extra attack!' valyn_gag6
/def -ag -t'^(?:> )?The energized shade of (?:\w+)\'s maul gains a surprise hit!' valyn_gag7
/def -ag -t'^(?:> )?The electric trailing of (?:\w+)\'s maul earns a second wound!' valyn_gag8


;; Aegis Gags
/def -ag -t'^(?:> )?The zombie viciously bites you!$' aegis_gag1
/def -ag -t'The zombie mindlessly says\: MMMMuuuuuhhhhh\.' aegis_gag2
/def -ag -t'^(?:> )?One of the sentry\'s grenades explodes, enveloping you in a$' aegis_gag3
/def -ag -t'^(?:> )?cloud of poison gas!$' aegis_gag4
/def -ag -t'^(?:> )?The sentry rips you to pieces in a barrage of bullets!' aegis_gag5
/def -ag -t'The sentry announces\: Human opposition targeted\.  Kill switch on\.' aegis_gag6
/def -ag -t'^(?:> )?The soldier tosses a grenade which explodes in a deadly cloud of nerve gas!' aegis_gag7
/def -ag -t'^(?:> )?The soldier opens fire, ripping you to shreds in a hail of bullets!$' aegis_gag8
/def -ag -t'^(?:> )?The soldier announces\: Target acquired\.  Weapons now activated\.$' aegis_gag9
/def -ag -t'^(?:> )?The zombie grabs for your throat!' aegis_gag10
/def -ag -t'^(?:> )?The robot launches a powerful grenade!' aegis_gag11
/def -ag -t'The soldier announces\: Target acquired\.  Weapons now activated\.' aegis_gag12

;; Cubes Gags
/def -ag -t'^The small cube tries to roll over you. Failing, it settles with' cube_gag1
/def -ag -t'^infecting part of your leg instead\.' cube_gag2
/def -ag -t'^(Angered|Annoyed), the(?: small)? cube sprays you with poison.' cube_gag3
/def -ag -t'^You feel your body corrode as if it were porous metal under the' cube_gag4
/def -ag -t'^acidic onslaught from the ochre jelly\.' cube_gag5
/def -ag -t'^The large cube simply rolls over you, infecting you with deadly' cube_gag6
/def -ag -t'^toxic\.' cube_gag7
/def -ag -t'^The cube towers over you, reflecting your own image back at you\.' cube_gag8
/def -ag -t'^The cube tries to roll over Inix partially engulfing him.' cube_gag9
/def -ag -t'^The small cube showers Inix with potent poison.' cube_gag10

/def -ag -t'^You\'re sprayed by black streams of acid from the jelly\.' jelly_gag1

/def -ag -t'^The christmas gift belches out a cloud of lethal poison at (?:\w+)\.$' gift_gag1
/def -ag -t'^The massive gift spits a shower of sticky slime at (?:\w+)\.$' gift_gag2
/def -ag -t'^The gift spits a shower of sticky slime at (?:\w+)\.$' gift_gag3
/def -ag -t'^The present licks his wrapped lips with a soggy piece of string\.$' gift_gag4
/def -ag -t'^The christmas gift belches out a small cloud of lethal poison at' gift_gag5
/def -ag -t'^William\.$' gift_gag6

/def -ag -t'^The snowy creature engulfs (?:\w+) within its acidic body\.$' snowman_gag1
/def -ag -t'^The snowman sprays (?:\w+) with corrosive jets of snow\.$' snowman_gag2

/def -ag -t'^Dotar fades out as he avoids the attack!$' dotar_gag1
/def -ag -t'^(?:\w+)\'s attack bounces harmlessly against Dotar\'s shield.$' dotar_gag2

/def -ag -t'^The sac spider\'s protective cocoon absorbs all the damage!$' sac_gag1

;; Monk Gags
/def -ag -t'^(?:> )?(?:\w+) sends deadly vibrations through his foe!' monk_gag1
/def -ag -t'^(?:> )?(?:[\w\s\,\-\(\)]+)\'s body is violently rearranged!!' monk_gag2
/def -ag -t'^(?:> )?(?:[\w\s\,\-\(\)]+)\'s body contorts into a Picasso-like nightmare!' monk_gag3


;; Priest Gags
/def -ag -t'^Avatar of Elentil' priest_gag1
/def -ag -t'^Kitt\'s acolyte' priest_gag2
/def -ag -t'^(?:\w+)\'s shillelagh glows with power!$' priest_gag3
/def -ag -t'^Phoenix sends a wave of fire' priest_gag4
/def -ag -t'^Phoenix rakes its talons across' priest_gag5
/def -ag -t'^(?:\w+) shines the pure, intensified light of day down upon (?:[\w\s]+)!$' priest_gag6
/def -ag -t'^(?:\w+) chants: Show thy face, Galan, so the world may behold thee!$' priest_gag7

;; Necro Gags
/def -ag -t'^Alpha Lyrae' necro_gag1
/def -ag -t'^The scalding rain blisters and peels the skin' necro_gag2
/def -ag -t'The power of the magic violently destroys' necro_gag3
/def -ag -t'^Gothmog, Lord of Balrogs' necro_gag4
/def -ag -t'^Bagpuss' necro_gag5
/def -ag -t'^Flashing through the air, a narrow beam of energy strikes' necro_gag6
/def -ag -t'^The eyes fire a stream of flame into (?:\w+)\'s foe, incinerating them!$' necro_gag7
/def -ag -t'^Inhaled spores from the fungus sends (?:\w+)\'s foes into a mad psychosis!$' necro_gag8
/def -ag -t'^The air hums with energy as a spear of light flies at (?:\w+)\'s enemy!$' necro_gag9
/def -ag -t'^With a blinding burse of energy the spear skewers (?:\w+)\'s opponent!$' necro_gag10
/def -ag -t'^(?:[\w\s]+)\'s dark soul burns in the golden light!$' necro_gag11
/def -ag -t'^(?:[\w\s]+)\'s mind and thoughts drain away into the crimson mist.$' necro_gag12
/def -ag -t'^(?:[\w\s]+) is painfully raked by the spectres in the crimson mist.$' necro_gag13
/def -ag -t'^A crimson mist then appears and engulfs (?:[\w\s]+)!$' necro_gag14
/def -ag -t'^The crimson field engulfing (?:[\w\s]+) dissolves away.$' necro_gag15
/def -ag -t'^(?:[\w\s]+) staggers from the (painful)? crimson (energy|spectral) mist.$' necro_gag16
/def -ag -t'^(?:[\w\s]+)\'s mind is torn asunder by the spectres of energy.$' necro_gag17
/def -ag -t'^(?:[\w\s]+) is painfully drained by the crimson mist.$' necro_gag18
/def -ag -t'^(?:[\w\s]+) froths at the mouth.$' necro_gag19
/def -ag -t'^(?:[\w\s]+)\'s mind is sapped into the crimson field of energy.$' necro_gag20
/def -ag -t'^A crimson, spectral mist then appears and engulfs (?:[\w\s]+)!$' necro_gag21
/def -ag -t'^The crimson energy field drains the mind of (?:[\w\s]+).$' necro_gag22
/def -ag -t'^(?:\w+)\'s eyes glow red as (she|he|it) stares (calmly)? at (?:[\w\s]+).$' necro_gag24
/def -ag -t'^(?:\w+) affects (?:[\w\s]+) with a dark, necromantic touch.$' necro_gag25
/def -ag -t'^(?:\w+) throws a pinch of mandrake root into the air.$' necro_gag26
/def -ag -t'^(?:\w+) conjurs forth a searing, radiant heat into the room.$' necro_gag27
/def -ag -t'^The radiation of a dozen stars brings (?:\w+)\'s enemy to their knees!$' necro_gag28
/def -ag -t'^(?:\w+)\'s enemy reels in pain as its ocular fluid boils, blinding them!' necro_gag29
/def -ag -t'^The temperature rises, cooking (?:\w+)\'s foe\'s entrails from within!$' necro_gag30
/def -ag -t'^The magic of the spell devastatingly massacres (?:[\w\s]+)!$' necro_gag31
/def -ag -t'^(?:\w+)\'s enemy\'s skin peels as they turn a horrible shadw of red!$' necro_gag32
/def -ag -t'^Azazel invokes Nature\'s Blaze on Murmandamus\'s enemy!$' necro_gag33
/def -ag -t'^(?:[\w\s]+) rampages about, a wild, unthinking look in its eyes.$' necro_gag34
/def -ag -t'^(?:\w+) summons a demonic fist to burst free from the ground below.$' necro_gag35
/def -ag -t'^(?:[\w\s]+) wails in pain from the golden corrosion!$' necro_gag36
/def -ag -t'^A Firebat ' necro_gag37
/def -ag -t'^The spear imbeds itself into the burning chest of (?:\w+)\'s foe!' necro_gag38
/def -ag -t'^Death\'s dark shroud wraps around (?:\w+)\'s enemy and slowly constricts!' necro_gag39
/def -ag -t'^Radiant energy races along (?:\w+)\'s body.' necro_gag40
/def -ag -t'^(?:\w+)\'s enemy is overwhelmed with fear as the darkness smothers them!' necro_gag41
/def -ag -t'^Striking like lightning, the energy spear chars (?:\w+)\'s enemy\'s flesh!' necro_gag42
/def -ag -t'^(?:\w+)\'s foe writhes in agony as the air blackens its lungs!' necro_gag43
/def -ag -t'^Black waves of darkness wash across the room in a swath of evil!' necro_gag44
/def -ag -t'^The spear disappears into (?:\w+)\'s foe and explodes from the inside!' necro_gag45
/def -ag -t'flesh is dissolved painfully by the curse!' necro_gag46
/def -ag -t'^Zorander' necro_gag47
/def -ag -t'recoils from the acid of the golden decay!' necro_gag48
/def -ag -t'staggers from the crimson spectral mist.' necro_gag49
/def -ag -t'howls in extreme pain from the titanic blast of energy!!' necro_gag50
/def -ag -t' stumbles about wheezing as (he|she|it) tries to breathe.$' necro_gag51
/def -ag -t' rampages about, a wild, unthinking look ' necro_gag52
/def -ag -t'eyes.$' necro_gag53
/def -ag -t' snarls like a wild beast, its brow ' necro_gag54
/def -ag -t'which ravages its body.$' necro_gag55
/def -ag -t' staggers about, lost in the delirium of rabies.$' necro_gag56
/def -ag -t' convulses and howls in agony.$' necro_gag57
/def -ag -t'Pure darkness drowns (?:\w+)\'s foe in a never-ending pit of blackness!' necro_gag58
/def -ag -t'(?:\w+)\'s enemy is broken and crushed from (?:\w+)\'s blinding charge!' necro_gag59
/def -ag -t'The very fabric of reality turns black and chokes (?:\w+)\'s opponent!' necro_gag60
/def -ag -t'Blades of energy extend from the chariot, scorching (?:\w+)\'s enemy!' necro_gag61
/def -ag -t'The chariot of the gods obeys (?:\w+)\'s command and attacks the enemy!' necro_gag62
/def -ag -t'(?:\w+)\'s eyes glow red as (he|she|it) stares at ' necro_gag63
/def -ag -t'A pulse of pure darkness envelopes and strangles (?:\w+)\'s foe!' necro_gag64
/def -ag -t'The shining chariot of the sun explodes rams into (?:\w+)\'s enemy!' necro_gag65
/def -ag -t'Aethon breathes a wind of devestating energy upon (?:\w+)\'s enemy!' necro_gag66
/def -ag -t'(?:\w+)\'s foe touches the chariot, but pulls back only smoldering flesh!' necro_gag67
/def -ag -t'(?:\w+)\'s foe is left burned alive after being struck by the chariot!' necro_gag68
/def -ag -t'The soul of (?:\w+)\'s enemy crumbles as (?:\w+)\'s touch destroys its life!' necro_gag69
/def -ag -t'The eyes of Pyrois shine upon and burn into the mind of (?:\w+)\'s enemy!' necro_gag70
/def -ag -t'^(?:[\w\s]+)\'s thoughts painfully dissipate into the crimson mist.$' necro_gag71
/def -ag -t'(?:\w+) leaves following Inix.' gag_follow_inix


; SMURFS GAG
/def -ag -t'Smelly says: You fool, I had Taco-Bell last night!' smurf_gag0
/def -ag -t'Jokey Smurf hits you in the face with a Smurfberry pie\. YUMM!' smurf_gag1
/def -ag -t'Papa Smurf surprises you with his agility, and hits you in the stomach\.' smurf_gag2
/def -ag -t'Papa Smurf says: I hoped for more from you\.' smurf_gag3
/def -ag -t'Jokey Smurf tells you a very bad joke\. You lose some hit points\.' smurf_gag4
/def -ag -t'Hefty Smurf lifts you above his head, and throws you to the floor\.' smurf_gag5
/def -ag -t'Hefty Smurf says: Now I\'m going to have to hurt you\.' smurf_gag6
/def -ag -t'Crafty pulls a concealed knife out and stabs you\.' smurf_gag7
/def -ag -t'Crafty says: If you stop this, I\'ll let you walk away\. Hehe\.' smurf_gag8
/def -ag -t'Tracker punches you in the face, with lightning fast reflexes\.' smurf_gag9
/def -ag -t'Tracker says: This is wasting my time\. I\'ll end this quickly\.' smurf_gag10
/def -ag -t'Slimy sneezes on you very juicily\.' smurf_gag11
/def -ag -t'Slimy goos you, and you lose your footing\.' smurf_gag12
/def -ag -t'Creepy hits you with a spooky looking book!' smurf_gag13
/def -ag -t'Creepy recites an incantation\.\.\. He seems to be moving faster!' smurf_gag14
/def -ag -t'Smelly lets one go, right in your face\.' smurf_gag15
/def -ag -t'The spider bites into you again and again\.' smurf_gag16
/def -ag -t'The rat bites into your leg, and you feel a little sick\.' smurf_gag17
/def -ag -t'Gargamel says: You won\'t get past me, I\'ll die before you follow them\.' smurf_gag18
/def -ag -t'Gargamel says: They promised me all the smurfs would be mine\.' smurf_gag19
/def -ag -t'Gargamel says: No, I\'m supposed to guard the page!' smurf_gag20
/def -ag -t'Brainy confuses you with a lot of complex math problems\.' smurf_gag21
/def -ag -t'Brainy says: Stop this nonsensical attack\. You\'ll only get hurt\.' smurf_gag22
/def -ag -t'^Brainy says: Please stop!  By attacking me you are only promoting' smurf_gag23
/def -ag -t'^a society based on \"Smurf makes Right\.\"' smurf_gag24
/def -ag -t'^Clumsy Smurf trips and knocks you over\.' smurf_gag25
/def -ag -t'^Clumsy Smurf falls and you miss\.' smurf_gag26
/def -ag -t'^Vanity Smurf breaks a mirror over your head\.' smurf_gag27
/def -ag -t'^Vanity Smurf says: Stop this, before I mess up my hair\.' smurf_gag28
/def -ag -t'^Smurfette slaps you silly\.' smurf_gag29
/def -ag -t'^Smurfette knees you in the groin, and you double over in pain\.' smurf_gag30
/def -ag -t'^Handy Smurf says: I need my space to work, go bother someone else!' smurf_gag31
/def -ag -t'^Your blow is absorbed by ClockWork\'s hard outer shell\.' smurf_gag32
/def -ag -t'^ClockWork slowly crushes the life out of you\.' smurf_gag33
/def -ag -t'^Handy Smurf bangs away on some broken item\.' smurf_gag34
/def -ag -t'^Handy Smurf rearranges your features with a pair of pliers\.' smurf_35
/def -ag -t'^Handy Smurf hits you over the head with a wrench\.' smurf_36
/def -ag -t'^Jokey Smurf says: Why did the chicken cross the road\?' smurf_37
/def -ag -t'^Jokey Smurf rolls around on the floor laughing\.' smurf_38

;; ZIPHE
/def -ag -t'^Ziphe (attacks~whispers~points~summons~calls~exposes~grants)' ziphe_gag1

