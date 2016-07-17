/purge eq_filt_*

/set eq_have_crelevere 0
/set eq_have_som 0
/set eq_have_earring 0

/def -ag -p10000 -t"The misty symbols shift to protect you!" eq_filt_wispshield

/def -ag -p99 -mregexp -t"^The (comet-like|electric|energized|bright|radiant|azure) (tracing|shade|shadow|ghosting|image|trailing) of the (maul|mace|war mace|hammer|warhammer) (makes|gains|effects|exacts|causes|works|strikes|earns) (another|a surprise|a second|an extra|an additional) (blow|attack|hit|wound)!$" eq_filt_maul_1
/def -ag -p99 -t"The azure warhammer screams with the fury of a titan!                 " eq_filt_maul_2
/def -ag -p99 -t"Your mind reels from a blast of blue lightning!                       " eq_filt_maul_3
/def -ag -p99 -t"The sweet scent of burnt flesh fills the air.                         " eq_filt_maul_4
/def -ag -p99 -t"Ozone fills the air from the intense battle.                          " eq_filt_maul_5
/def -ag -p99 -mregexp -t"^You land a clean, explosive blow into (.*)\'s flank!( *)$" eq_filt_maul_6
/def -ag -p99 -t"The hammer strikes down upon your enemy trailing a massive streak of" eq_filt_maul_7 = \
  /def -ag -p99 -n1 -t"lightning blue behind it.  The weapon lands upon *" eq_filt_maul_tmp1%;\
  /def -ag -p99 -n1 -mregexp -t"sparks erupt!( *)$$" eq_filt_maul_tmp2
/def -ag -p99 -t"Lightning thunders through the entire room!                           " eq_filt_maul_8
/def -ag -p99 -t"You reach back the mighty hammer and thrust forward with all your" eq_filt_maul_9 = \
  /def -ag -p99 -n1 -t"might.  Screaming through the air, trailing electric death, the maul" eq_filt_maul_tmp1%;\
  /def -ag -p99 -n1 -mregexp -t"^slams into (.*) with the fury of a bolt of lightning!( *)$$" eq_filt_maul_tmp2
/def -ag -p99 -t"The room explodes in a brilliant flash of blue lightning!             " eq_filt_maul_10
/def -ag -p99 -t"Following your powerful swing of the hammer, a comet trail of energy" eq_filt_maul_11 = \
  /def -ag -p99 -n1 -mregexp -t"^slams into (.*), leaving a scorched wound!( *)$$" eq_filt_maul_tmp1
/def -ag -p99 -mregexp -t"^The lightning maul slams into (.*) painfully!( *)$" eq_filt_maul_12
/def -ag -p99 -mregexp -t"^Your strike upon (.*) flares in a blue, explosive flame!( *)$" eq_filt_maul_13
/def -ag -p99 -t"Electricity sizzles around you, setting fire to your senses!          " eq_filt_maul_14
/def -ag -p99 -t"You are overcome with a bright flash of blue light!" eq_filt_maul_15 = \
  /echolog --- MAUL HEAL
/def -ag -p99 -mregexp -t"^A bolt of lightning from the maul careens into (.*)!( *)$" eq_filt_maul_16
/def -ag -p99 -mregexp -t"^A bolt of lightning arcs from the hammer to (.*)!( *)$" eq_filt_maul_17
/def -ag -p99 -t"You scream with a rage that wells from the maul and strike down upon" eq_filt_maul_18 = \
  /def -ag -p99 -n1 -mregexp -t"with the fury of nature itself!( *)$$" eq_filt_maul_tmp1
/def -ag -p99 -t"Your strike upon * flares in a blue, explosive" eq_filt_maul_19 = \
  /def -ag -p99 -n1 -t"flame!                                                                " eq_filt_maul_tmp

/def -ag -p99 -t"The bracers flare brightly and your form wavers slightly!" eq_filt_adamantite_bracers_1
/def -p99 -t"The bracers flare out in a shower of light, your form shimmers and" eq_filt_adamantite_bracers_2
/def -p99 -t"fades momentarily, the force of your opponents attack passes right" eq_filt_adamantite_bracers_3
/def -p99 -t"through you, fueling your life force rather than draining!" eq_filt_adamantite_bracers_4

/def -ag -p7001 -t"Warmth and life force flows into you through your hand." eq_filt_crelevere = \
  /if (eq_have_crelevere == 0) \
    /set eq_have_crelevere 1%;\
    /update_eq%;\
  /endif

/def -ag -p29000 -t"The Staff of the Magi unleashes a torrent of magical energy upon *" eq_filt_som_1 = /eq_filt_som_update
/def -ag -p29000 -t"The staff strikes with * force!" eq_filt_som_2 = /eq_filt_som_update
/def eq_filt_som_update = \
  /if (eq_have_som == 0) \
    /set eq_have_som 1%;\
    /update_eq%;\
  /endif

/def -ag -p7000 -t"Magical energies course through your body." eq_filt_earring = \
  /if (eq_have_earring == 0) \
    /set eq_have_earring 1%;\
    /update_eq%;\
  /endif

/def -ag -p7000 -t"You say: Blow it out your ass!" eq_filt_nukem_1
/def -ag -p7001 -t"You say: Come get some." eq_filt_nukem_2
/def -ag -p7002 -t"You say: Damn I'm good." eq_filt_nukem_3
/def -ag -p7003 -t"You say: Damn those alien bastards are gonna pay for shooting up my ride." eq_filt_nukem_4
/def -ag -p7004 -t"You say: It's time to kick ass and chew bubble gum...and I'm all outta gum." eq_filt_nukem_5
/def -ag -p7005 -t"You say: Let god sort 'em out." eq_filt_nukem_6
/def -ag -p7006 -t"You say: Let's rock." eq_filt_nukem_7
/def -ag -p7007 -t"You say: Nobody steals our chicks... and lives." eq_filt_nukem_8
/def -ag -p7007 -t"You say: Piece of cake." eq_filt_nukem_9
/def -ag -p7007 -t"You say: See you in hell, buddy." eq_filt_nukem_10
/def -ag -p7007 -t"You say: That's right baby, I'm NUKEM." eq_filt_nukem_11
/def -ag -p7007 -t"You say: What are you waiting for, Christmas?" eq_filt_nukem_12
/def -ag -p7007 -t"You say: Who's your Daddy?" eq_filt_nukem_13
/def -ag -p7007 -t"You say: Your face, your ass, what's the difference." eq_filt_nukem_14

/def -ag -p5005 -t"The Sword strikes with an unholy power!" eq_filt_hoelerin_1
/def -ag -p5005 -t"The Hoelerin sword strikes with an unholy power!" eq_filt_hoelerin_2

/def -ag -p5005 -t"The sword pulses in your grasp!" eq_filt_vorpal_1
/def -ag -p15 -t"You swing with all your might at the *!  The Vorpal Blade wells" eq_filt_vorpal_decap_1 = \
  /def -ag -n1 -p88888 -t"with unbelievable power as it swings itself toward the head of your enemy. " eq_filt_vorpal_end_1%;\
  /def -ag -n1 -p88888 -t"The * screams as you decapitate it!!" eq_filt_vorpal_end_2%;\
  /def -ag -n1 -p88888 -t"The head falls to the ground." eq_filt_vorpal_end_4
/def -ag -p15 -t"You swing with all your might at the *!  The Vorpal Blade" eq_filt_vorpal_decap_2 = \
  /def -ag -n1 -p88888 -t"wells with unbelievable power as it swings itself toward the head of your" eq_filt_vorpal_end_1%;\
  /def -ag -n1 -p88888 -t"enemy.  The * screams as you decapitate it!!" eq_filt_vorpal_end_2%;\
  /def -ag -n1 -p88888 -t"The head falls to the ground." eq_filt_vorpal_end_3
/def -ag -p15 -t"You take a massive swing with the Vorpal Blade!  Your skill and execution" eq_filt_vorpal_limb_1 = \
  /def -ag -n1 -p88888 -t"is flawless as you shear the *" eq_filt_vorpal_end_1%;\
  /def -ag -n1 -p88888 -t"* of the creature's limbs!!" eq_filt_vorpal_end_2%;\
  /def -ag -n1 -p88888 -t"The limb falls to the ground." eq_filt_vorpal_end_3



/def -p5005 -t"You call upon the power of the Land and smite the enemy." eq_filt_lore_staff_1

/def -p2 -t"The star on your buckler begins to glow with a ruby light." eq_filt_eternia_1
/def -p2 -t"The star on your buckler flashes like a sun!" eq_filt_eternia_2 = \
  /def -n1 -p88888 -t"The star then fades to dark." eq_filt_eternia_end

/def -ag -p5000 -t"You thrust the sword like {lightning|wildfire|holyfire} into the *!" eq_filt_sol_1
/def -ag -p5000 -t"Slicing viciously, you cut like {lightning|wildfire|holyfire} into the *!" eq_filt_sol_2
/def -ag -p5000 -t"With a flash of {lightning,|wildfire,|holyfire,} you slice into the *!" eq_filt_sol_3

/def -ag -p1000 -t"Reflecting some of *" eq_filt_reflect_1
/def -ag -p1000 -mregexp -t"^(((pours |)from |)your |)amulet, (savagely wounding|obliterating|injuring|slightly harming|mauling|staggering|decimating) (him|her|it)!$" eq_filt_reflect_2

/def -ag -p1000 -t"You hack away at *'s {left|right} testicle!" eq_filt_bobbit_1
/def -ag -p1000 -t"You slice and dice the {left|right} testicle of *!" eq_filt_bobbit_2
/def -ag -p1000 -t"You hack away at *'s penis!" eq_filt_bobbit_3
/def -ag -p1000 -t"You slice and dice the penis of *!" eq_filt_bobbit_4

/def -p1000 -t"Bolts of electricity flow out of the Arc Welder and shock *" eq_filt_welder_1
/def -p1000 -t"You reach out with the prongs of the Arc Welder and shock *" eq_filt_welder_2
/def -p1000 -t"The Arc Welder releases a bolt of electricity! Electrifying *" eq_filt_welder_3
/def -p1000 -t"PFZZZT!" eq_filt_welder_3b
/def -p1000 -t"Bolts of electicity fly forth from the Arc Welder. Electrifying *" eq_filt_welder_4
/def -p1000 -t"You activate the Arc Welder and electrify * with bolts of electricity!" eq_filt_welder_5
/def -p1000 -t"Bolts of electricity flow out of the Arc Welder and course over *" eq_filt_welder_6
/def -p1000 -t"The Arc Welder spits electricity at *" eq_filt_welder_7
/def -p1000 -t"PFZZT! You shock *" eq_filt_welder_8
;/def -p1000 -t"The Arch Welder is getting low on power." eq_filt_welder_8b

/def -ag -p9 -t"Your mind fills with power." eq_filt_sceptre

/def -p9 -mregexp -t"^You (amazingly|agilely|bloodily|deftly|dexterously|expertly|frightfully|handily|horribly|insanely|nimbly|sickeningly) (annihilate|butcher|crush|damage|destroy|injure|maim|mangle|massacre|maul|obliterate|pummel|slaughter|smash|wound) the lifeblood from the " eq_filt_bloodthorn_1
/def -p9 -mregexp -t"^With (an agilely|an amazingly|a bloodily|a deftly|a dexterously|an expertly|a frightfully|a handily|a horribly|an insanely|a nimbly|a sickeningly) vicious strike, you (annihilate|butcher|crush|damage|destroy|injure|maim|mangle|massacre|maul|obliterate|pummel|slaughter|smash|wound) the " eq_filt_bloodthorn_2

/def -p9 -t"The weapon's evil is contained within you. It corrupts your soul." eq_filt_shadowstrike_1 = \
  /def -p88888 -n1 -t"It cries out for you to set it free!!!" eq_filt_shadowstrike_end

/def -p9 -mregexp -t"^The spear commands \((Find me fresh souls!|Our merger is getting closer. Do you feel it\?|Strike with me. Faster!!!|You are my servant... I am the master.)\)$" eq_filt_shadowstrike_2

/def -p9 -t"The spear commands in your mind \(Don't cleanse me in the light!\)" eq_filt_shadowstrike_3 = /ss_count_incr

/def -p9 -mregexp -t"^The spear whispers in your mind \((Give in to me and let go.|I fear the light...|I yearn for more souls!!|I yearn to bring forth the darkness!|Impale meeeee......|Release me!|We are becoming one... do you feel it\?|You are an extension of my power.|I feast on the dead!|Do not contain me... let me out!)\)$" eq_filt_shadowstrike_4

/def -ag -p135 -t"The cocoon fuses with the attack and grows stronger!" eq_filt_cocoon_fuse
/def -ag -p135 -t"The sticky cocoon absorbs part of the attack!" eq_filt_cocoon_abs

/def -ag -p8 -t"A spidery web of magical energies flows from the staff into your body!" eq_filt_despair_1
/def -ag -p8 -t"The staff flares with power!" eq_filt_despair_2
/def -ag -p8 -t"You feel a trickle of energies flowing from the staff to your body!" eq_filt_despair_3
/def -ag -p8 -t"The staff sparks and you feel a great burst of energy rush through your" eq_filt_despair_4 = \
  /def -ag -p88888 -t"body!" eq_filt_despair_end

