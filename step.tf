/def key_f5 = /echo SETTING UP DOG BOT%;/set dog_attacking on%;/set corpsing 1 
/def key_f7 = /set dog_attacking on%;/key_f8
/def key_f8 = /boton%;/set step_auto on%;%;
/def key_f11 = /set step_prompt 1%;%;
/def key_f12 = /boton%;%;

/def stepping =							\
	/set area %1						%;\
	/eval /eval /set path %%{%{area}_path}			%;\
	/eval /eval /set killname %%{%{area}_killname}		%;\
	/eval /eval /set mobnames %%{%{area}_mobnames}		%;\
	/eval /eval /load %.area_%{area}%.tf			%;\
        /if (mobnames =~ "aggro") /set aggro true		%;\
	/else /set aggro false %; /endif

;/def stepover = /unset walked

/def step = \
	/let dir=$(/first %path)				%;\
	/eval /set walked=%walked %dir				%;\
	/eval /set path $(/all_but_first %path)			%;\
		/if (dir =~ "stop") \
			/stepoff		%;\
		/else				\
			/eval /send %dir	%;\
		/endif

/def all_but_last = /echo - %-L
/def all_but_first = /echo - %-1

/def gostep = \
	/eval home_$[area]					%;\
	/stepping %1	

/def stepback = \
	/eval %{area}_home

/def boton = /load step_bot.tf

/def botp = /set step_prompt 0
/def botu = /set step_prompt 1

/def botoff = \
	/undef catch_prompt					%;\
	/undef step_player					%;\
	/undef step_mob					%;\
	/undef step_corpse_trig				%;\
	/undef step_coffin					%;\
	/unset monster					%;\
	/unset mob_name					%;\
	/undef step_dg1					%;\
	/undef step_dg2					%;\
	/unset dog_attacking
;TODO	GARBAGE COLLECT AREA_INTELLIGENCE function
;TODO	LOG ANY ISSUES THAT OCCURED TO LOGGER
;TODO	REMOVE THIS DEFINTION ENTIRELY FOR OPTIMIZED MODE SWITCHING
	

/set east_killname aggro
/set east_mobnames aggro
/set east_path e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e ponder

/set west_killname aggro
/set west_mobnames aggro
/set west_path w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w ponder

/set road_killname traveller
/set road_mobnames (Elf|Human) Traveller
/set road_path w w w w w w w w w w w w leave w w w w n n n n n n n n n e e e e e s s s s s s s s n n n n n n n n e e e e n n n n n n w w w w w w w w w w w w w e e e e portal portal e e e e e e e e e e e e e e e leave e e e e ne ne n ne ne e e e e e e se e e e e w w w w nw w w w portal ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/set vindaes_killname adept
/set vindaes_mobnames adept
/set vindaes_path w w e ponder
/alias home_vindaes /run mpwsws
/alias vindaes_home /run enenepH

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set mahjongg_killname mobname
/set mahjongg_mobnames Blue Dolphin|Leaping Rat|Lumbering Ox|Purple Butterfly|Red Butterfly|Sea Serpent|Red Rabbit|Winged Horse|Black Tiger|White Tiger|Green Chinese Dragon|Black Chinese Dragon|Red Chinese Dragon|Gold Chinese Dragon|Jade Phoenix|Golden Phoenix|Charging Ram
/set mahjongg_path e e e e e n w w w w w n e e e e e e n w n e n e nw n s sw sw s w w w n nw n e nw sw e s s s nw s w w w n e nw nw n s sw e s s s e e e e s w w w s e e e e ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/set spiders_killname spider
/set spiders_mobnames Spider (beast|creature)|Arachnid (beast|warrior|soldier)|Mandible brute \(enormous\)|Man-spider
/set spiders_path se s s s s sw se sw se sw se sw s s s sw se e se nw w sw se n n s ne sw s s n w e ne sw se nw e ne sw se nw e ne s n sw w w sw se e se n s nw w sw e se e w s n se nw nw w ne nw sw sw w nw n se e ne nw n s ne sw e w se sw w nw sw se s w n s e sw ne se s n ne e n ne sw s w se e e se nw w w nw sw nw n nw ne nw e nw sw ne se w sw e w nw w nw w e n s e e e ne se se nw ne e e n e nw n s se w s w w sw nw n ne e nw se n s ne sw e w se nw s n sw ne w sw nw sw se nw sw nw ne sw sw nw ne e n s sw ne w sw w nw ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/set colours_killname colour
/set colours_mobnames aggro 
/set colours_path n ne
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/alias home_smurf /run Cres
/alias smurf_home /run 2nwVH

/set smurf_killname smurf
/set smurf_mobnames smurfs
/set smurf_path s s s w e e w s w e e e w sw se w e s w w n s e e s s e s s s enter 'gargamels ponder

/set smurf3s_killname smurf
/set smurf3s_mobnames smurfs
/set smurf3s_path s s s w e e w s w e e sw se w e s w w n s e e e n n n e e n e nw se n s e ne sw e e ne sw w w w w s e w s s n e e se nw ne e e e e enter 'balthazars ponder

/set balthazars_killname snake
/set balthazars_mobnames snakes
/set balthazars_path n s s n e n s s n e n s s n e n s s n e n s s n e w w w w w out w w w w sw w w n w w s s s w s s e s s s enter 'gargamels ponder

/alias gargamels_home /run 2nwVH
/alias home_gargamels /run Cre5s2e8sr

/set gargamels_killname aggro
/set gargamels_mobnames A large furry spider|A very large rat|Azrael|Gargamel
/set gargamels_path w e e w s w e e w s w e e w s w e e w s w e e w s w e s w e e w n e out ponder
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;/set pol_killname keeb_pro_hibit
;/set pol_killname prohibit
/set pol_killname mobname
/set pol_mobnames Wyvern|Baby Dragon|Wild Stag|Sylvan Elf|Faerie Lizard|Rabid Wolf
/set pol_path n n nw nw nw nw nw nw nw nw n se se se ne nw ne ne ne nw sw nw s nw s nw nw n n n n n ne s s s se n n n n ne s s s s s ne n n n se s s s ne n se n n n n n n sw sw sw ne se s s se se s se n n ne n n ne nw sw s s sw n n n ne nw se se se se se s sw sw s sw sw se ne ne n ne ne ne se sw sw sw s sw sw ne ne ne s ne n ne s s s s s s s nw n n nw s s s sw n n n n sw s s nw n n sw sw sw nw s se ne se sw sw nw nw s se se ne ne s sw sw nw nw s se se ne ne ne sw sw sw s s ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set pol2_killname mobname
/set pol_mobnames Wyvern|Baby Dragon|Wild Stag|Sylvan Elf|Faerie Lizard|Rabid Wolf|Guardswoman
/set pol2_path n n nw nw nw nw nw nw nw nw n se se se ne nw ne ne ne nw sw nw s nw s nw nw n n n n n ne s s s se n n n n ne s s s s s ne n n n se s s s ne n se n n n n n n sw sw sw ne se s s se se s se n n ne n n ne nw sw s s sw n n n ne nw se se se se se s sw sw s sw sw se ne ne n ne ne ne se sw sw sw s sw sw ne ne ne s ne n ne s s s s s s s nw n n nw s s s sw n n n n sw s s nw n n sw sw sw nw s se ne se sw sw nw nw s se se ne ne s sw sw nw nw s se se ne ne ne sw sw sw s s ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set carnegie_killname human
/set carnegie_mobnames members
/set carnegie_path n w w w n w w out e e e e e e out ne ne n w s sw w w w w w nw e e e e e e e n w w w w w w w n e e e e e e e n w w w w w w w n e e e e e e e n w w w w w w w n nw se e e e e e e e ne sw s s s s s w w w w w w w w s se se e s e e e s ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set bombfreak_killname human
/set bombfreak_mobnames mother father child guard worshipper
/set bombfreak_path n n s e n n e d w e s s w e e w s s w e e w s s w e e w s s w e e w s s w e e w n n n n n n n n n n u w s w s s ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/set scio_killname=
/set scio_mobnames=
/set scio_path enter u s s n n w w e e u d e e n s s d u n e d e w u w w w n n d u n d u w e n d n w s e w s w s s s w n nw n nw w sw s se e ne se w n e n w w n w w s w n w e e e e e e e n ne sw w w w w w enter u u left left left left left left left left d d leave w w w w w w w n e e e nw w w n w n n e e s w compound n n e e w w n n s s s s s s e s e se e e ne enter e w out sw e e e e e e e e enter n n w e e w s s leave e e e e e n w w w w w w w w w w w w e e e e e e e e e e e e e e s e e s e w n n w ne sw e e e e e e e e e s d n e e s e n ne e w sw w w w w sw ne n w e n nw w e se n n s s s e ne sw w s e s u n e e s e s e s d d d e w d d u u u u u s e sw ne s s e e n w n e w n w n n n w s s d n nw w u e e n w w w w w w w w w se swim s s enter out swim n n nw w w w w w w w w w w w w w w w w se s s e w n n nw w w w n w e e e e e e e e e e e e e e e e e e e e e w w e u e e e e e e e e e e n e w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w n e enter w w n nw e e n w w enter door s se s e e leave e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e n w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w n e e e e e e e e e e e e e e e e e e e e e e se e e s s w w n n nw e e e e e e e e e e e e e e e e n e w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w n e e e e e e e e e e e e e e e e enter w w n w sw se e n e e leave e e e e e e e e e e e e e e e e e e e d w n s e u e e e n w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w n e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e w n w d u w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w w n e e e e e e e e e e e e e e d e n s e w s n w u e e e e e e e e e e e e e e e e e e e enter n nw se u d s leave e e e e e e s n w n w w w w w w w w w ladder

/set aegis_killname aggro
/set aegis_mobnames zombies robots
/set aegis_path e e s e e s w s w w n e s s e s e n e s e e n w s w n n e e n w n w n e e d /botoff

/set aegis2_killname aggro
/set aegis2_mobnames zombies|robots
/set aegis2_path w n e w w s w w n w w w e s e e e e e e s e w w w w w w w w s e e e e e e e e w s w w w w w w s e s e n e e s e n e w w w d 'aegis3 ponder

/set aegis3_killname aggro
/set aegis3_mobnames zombies|robots
/set aegis3_path w s n w s n n n w s s n w w e e n w w e e n w w e e e n w e n w e e w s e w s e s s n n e s s n n e s s n n e s s n n e e e w w s e e w w s e e w w s e e w w s w e n w w e e n n n w n w n s e n e w s e e e w w d 'aegis4 ponder

/set aegis4_killname aggro
/set aegis4_mobnames zombies|robots
/set aegis4_path e e n w w w w w w w w w s e e e e e e e e e s w w w w w w w w w s e e e e e e e e e s w w w w w w w w w s e e e e e e e e e s w w w w w w w w w s e e e e e e e e e s w w w w w w w w w s e e e e e e e e e n n n n n n n n w w d 'aegis5 ponder

/set aegis_vault killname aggro
/set aegis_vault mobnames|robots|troopers
/set aegis_vault_path s s s s s s e n n n n n n ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/alias home_summerset /eval /run Cr4wenw%;push fence%;
/alias summerset_home /eval push fence%;/run es2w3eVH
/alias home_summerset_warrens /eval /run Cr4wenw%;push fence%;
/alias summerset_warrens_home /eval push fence%;/run es2w3eVH

/set summerset_killname cow
/set summerset_mobnames Cow
/set summerset_path n n n e e e swr e e e e n w w w w n e e n w w n e e e s s e n n n e s s s e n n n e s s s e s w s e sw e e e n w n e n w n e e s e n e e e e e n w w w w n e e e e n w w w w n n w s e s s s s w w w w s s s s nw nw n nw nw n w s s s sw sw w w swr w w w s s s ponder

/set summerset_warrens_killname rabbit
/set summerset_warrens_mobnames Chestnut|Hainthinnang|Nyreem|Silfthan|Puffball
/set summerset_warrens_path n se n e s e n n w w w n e e e swr e nw n n n e s s s se n n n n e s s s sw e e s w w s e e e s w w w n n e e n n n n n n e s e n e s s w w s e e e s w s e sw e e e nw e nw e n w n e e e n w n e s s e ne ne ne e ne w se n u e w n w d w n s e u se d sw sw sw sw w w sw w sw s s nw nw n nw nw n w s s s sw sw w w swr w w w s s s ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/alias home_hippie /eval /run Cren%;climb vine%;
/alias hippie_home /run 2swVH

/set hippie_killname hippie
/set hippie_mobnames hippie
/set hippie_path e s n n s w w door e e n e gate barn w n w e n enter w d u e e u w e e w s w e e w s n u n s d n d w n e w w e s s s s s ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/set hamilton_killname human
/set hamilton_mobnames driver guard worker employee
/set hamilton_path d e e s s e e e n n e e e e e n n n s s s w w w w w s s w w w n n w w ponder

/set wswall_killname guard
/set wswall_mobnames guards
/set wswall_path n n n n n ne n nw w sw w w w w w w w nw w w sw w w w w w w w nw w sw nw se s se s s s s s s s s sw s sw ne se e ne e e e e e e e se e e ne e e e e e e e se e ne n nw n n n ponder

/set wssewer_killname insect animal
/set wssewer_mobnames rats snakes crocodiles spider
/set wssewer_path w w w w w w nw w nw n e nw ne e w w w w w w sw sw ponder
/alias home_wssewer = /eval home_tinny%;d%;
/alias wssewer_home = /eval u%;tinny_home%;

/set d2_1_killname aggro
/set d2_1_mobnames aggro
/set d2_1_path e e e e e e n n n n e e e e e e e s w w w w w w s e e e e e e s w w w w w w s e e e e e e s w w w w w w s e e e e e e s w w w w w w w w w w s e e e e e e e e e e e s w w w w w w w w w w s e e e s w w w s e e e s s n n n e n e e e e e e s s s n w nw sw w n w w s e e s w w s e e e e n s e e e 'Far_Oasis e e e e n w w w w n e e e e e s s e n n e s e e e e n n e e n w w s w sw nw w w w w w w w w e e n n e s e n e s e n e s n e e s n e e e e n w w w w w w w w w w w n e e e e e e e e e e e n w w w w w w w w w w w e e e e n e e e e e e e s s s s s s w w s s w w w w w w w s w w w s 'Lost_City e e e e e e e s w w w w w w s e e e e e e s w w w w w w s e e e e e e s w w w w w w s e e e e e e s w w w w w w w n n n n n n n w s s s s s s s w n n n n n n w w w w s s s n e ne se sw s e w w w s e e e s w w  w s e e e e s w w w s n e s e e s w w w w n n s s e e e e s s enter 'Viper_Temple ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set alphabet_killname letter
/set alphabet_mobnames letter
/set alphabet_path s s e w n e e e e s n w w s s w w s n e e e n s s n e s s e w w w w w e n e w s e e e n n w w n n w w n ponder
/alias alphabet_home /run u2wVH%;
/alias home_alphabet /run Cr2ed%;mission ask%;/rp 5 mission accept%;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


/set crystal_killname aggro
/set crystal_mobnames aggro
/set crystal_path ne n n ne n nw n n ne ne ne ne ne s s s s s s s se se se se se se se se se se e e e e e e e e e e e e e e ne ne ne ne ne ne ne ne ne ne n n n n n n n n nw nw nw nw nw nw nw nw nw nw w w w w w w w w w w w w w w sw sw sw sw sw sw sw sw sw sw e ne ne ne ne ne ne ne ne ne se e e e w w w nw e e e e e e e e e e e e e e sw w w w e e e ne se se se se se se se se se s s s s s s s s sw sw sw sw sw sw sw sw sw nw w w w e e e se w w w w w w w w w w w w w w ne e e e w w w sw nw nw nw nw nw nw nw nw nw n n n n n n n n se ne ne ne ne sw sw sw e ne ne ne ne ne ne ne e e e e e e e e e e e e se se se se se se se nw nw nw nw nw nw nw w w w w w w w w w w w w sw sw sw sw sw sw sw sw s s s s s s e ne n n n n n ne ne ne ne ne ne ne e e e e e e e e e e se se se se se se se w w s s sw se s s sw sw sw sw sw n n ne e ne ne n n s s sw sw w w sw sw ne ne ne ne ne n n n n sw sw n nw nw nw sw sw nw e w s pondern se se e w nw ne se se se se n se se sw sw sw e sw s s w w w w w se e e e w w w nw sw w w w nw nw nw nw nw se se se se e e e e w w w w n n nw w nw nw n n s s se se e se n nw nw se se se se e ne n w e e e s se w w w e e e nw n e ne ne ne sw sw sw w nw w e e ne ne ne s n n s sw sw nw ne ne s n w w sw n n sw w w n s ne ne nw sw sw n s s n ne ne ne e e w nw w sw sw sw ne ne ne e n nw e e e w w w se s e e e w n ne e se se se se nw nw n se e se se s s n n nw nw w nw n n w w w w e e e e se se se se nw nw nw nw nw w w w sw nw w w w e e e se w w w w w s s sw w sw sw s s n n ne ne e e ne ne sw sw sw sw sw s s s s ne ne s se se se ne ne se w e n s nw nw w e se sw nw nw nw nw s nw nw ne ne ne w ne n n sw sw sw sw sw s s se sw s s w w se se se se se se se e e e e e e e e e e ne ne ne ne ne ne ne n n n n n ne e s s s s s s sw sw sw sw sw sw sw sw w w w w w w w w w w w w nw nw nw nw nw nw nw se se se se se se se e e e e e e e e e e e e ne ne ne ne ne ne ne e sw sw sw ne ne ne ne se n n n n n n n n nw nw nw nw nw nw nw nw nw w w w w w w w w w w w w w w sw sw sw sw sw sw sw sw sw w ne ne ne ne ne ne ne ne ne ne e e e e e e e e e e e e e e se se se se se se se se se se s s s s s s s s sw sw sw sw sw sw sw sw sw sw w w w w w w w w w w w w w w nw nw nw nw nw nw nw nw nw nw n n n n n n n sw sw sw sw sw s s se s sw s s sw w
/alias home_crystal = /run mp12nLhjhn16jdi3nwn2wsw3n2enesed5sesw3sws3wd5ed2s5enene4n2e%;
/alias crystal_home = /run 2w4swsws5w2nu5s5wu3e2ne2nenw5nuwnws2w3sen2ese4suks7kl9klr12sp%:

/alias home_toddler_house = /eval /run Crw2n%;sip cup
/alias toddler_house_home = /run 2sevH

;;;;;;;;;;;;;;
;Contention Training Grounds [Hobbes]
;;
/set contention_killname human
/set contention_mobnames guard|boy|guy|man
/set contention_path sw nw 
;;;
/set murdock_killname chicken
;/set murdock_killname mobname
/set murdock_mobnames guard|foreman
/set murdock_path w e s s s s w w fta door gta n n n n n n n n n n w s s s s s s s s s w n n n n n n n n n w s s s s s s s s s w n n n n n n n n n e e e e n e ponder

/set land2stone_killname human
/alias land2_home land_home
/alias land2stone_home land_home
/alias home_land2stone home_land2
/set land2stone_mobnames shepherd artisan herder farmer stonedowner 
/set land2stone_path w nw s n e w n e w ne sw n s sw sw ne s n w e n nw se w e n n n e nw n n s w s w w w s e s e e s w n n e n e se w s s s se se e ponder
;/set land2stone_path w nw s n e w n e w ne sw n s sw sw ne s n w e n nw se w e n n n e e n e n e n n n w s w s w s s s nw n n s w s w w w s e s e e s w n n e n e se w s s s se se e ponder

/set camazot_killname guard
/set camazot_mobnames demon guard
/set camazot_path w w n w sw se e n e e ponder
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set udmaze_killname mobname
/set udmaze_mobnames drow warrior dragon beholder snake tieran hell hound umber hulk thief
/set udmaze_path d s s e s s w n s s s e n s e e n n n n e w w n e n e s e n s s e s w e e e n w e n n w w s e w n e e s s ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set chessboard_killname mobname
/set chessboard_mobnames cross medic foot soldier horseman correspondent counsellor priest
/set chessboard_path w w w n n n n e s s s e n n n e s s s e n n n e s s s s e n n n n e e s w s e s w s e s s s w n n n w s s s w n n w s s w n n w s s w n n w s s w n n n e e e ponder  
/set cbclean_killname elephant angry
/set cbclean_mobnames elephant angry
/set cbclean_path w w w n n n n e s s s e n n n e s s s e n n n e s s s s e n n n n e e s w s e s w s e s s s w n n n w s s s w n n w s s w n n w s s w n n w s s w n n n e e e ponder  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set elven_woods_killname elf
/set elven_woods_mobnames guard 
/set elven_woods_path nw n w w n nw n n ne ne se e se s s sw sw s se ponder
/alias elven_woods_home /run Pe4nwpH%;
/alias home_elven_woods home_eforest%;/run e4swP%;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set mantis_killname aggro
/set mantis_mobnames mantis
/set mantis_path s sw s s sw se nw ne n n ne n e se e s s n e w n w s s w e s e w s s n n n n n nw w ponder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/set nukem_killname aggro
/set nukem_mobnames pig
/set nukem_path fan e w w w w n nw se e se u d nw n u d s ne n e n e s e wimp ponder
/alias home_nukem /run Sru3nw%;place adapter%;kick fan%;
/alias nukem_home /run e3sdoH




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
