;; Mining
/alias mine1 /run q2w2nveszwz2sqnws%;chute

;; Defaults
; COPPER -> Shards, Aquamarine, Morganite, Tiger's Eye
/set mine_for_copper aquamarine		%;
; BRONZE -> Shards, Cat's Eye, Eye of Flame, Garnet
/set mine_for_bronze eye of flame	%;
; IRON -> Shards, Garnet, Alexandrite, Eye of Frost
/set mine_for_iron garnet		%;
; STEEL -> Shards, Eye of Frost, Eye of Flame, Cat's Eye
/set mine_for_steel cat's eye		%;
; SILVER -> shards pyrite tourmaline beryl eye of earth roan's tears
/set mine_for_silver beryl		%;
; GOLD -> shards eye of air topaz amethyst happy ed's tears
/set mine_for_gold topaz		%;
; MITHRIL -> shards heliodor hematite core of flame
/set mine_for_mithril hematite		%;
; TITANIUM -> shards peridot core of frost
/set mine_for_titanium peridot		%;
; EBON -> shards core of earth heliodor peridot
/set mine_for_ebon peridot		%;
; ADAMANTIUM -> shards core of air pearl
/set mine_for_adamantium core of air	%;
; OBSIDIAN -> shards ghoti's tears opal pearl
/set mine_for_obsidian opal		%;
; NETHERNIUM -> shards ghoti's tears opal star of flame
/set mine_for_nethernium opal		%;
; VOIDSTONE -> shards shansabyk's tears diamond star of frost
/set mine_for_voidstone diamond		%;
; PHASEMETAL ->	shards emerald sapphire star of earth star of air
/set mine_for_phasemetal sapphire	%;
; CHAOSTONE -> shards cancer's tears emerald ruby sapphire
/set mine_for_chaostone ruby		%;

;; Swap Events
/def -t'You cannot mine for core of air in this obsidian ore.' mine_swap1 = \
	/set mine_for opal		%;\
	/craft_mine
/def -t'You cannot mine for opal in this adamantium ore.' mine_swap2 = \
	/set mine_for core of air	%;\
	/craft_mine
/def -t'You have successfully gathered' craft_mine = \
	/if (strlen(mine_for) > 0)	\
		!mine for %mine_for	%;\
	/else				\
		!mine			%;\
	/endif

; Bot commands
/load step.tf
/def cstep = \
	/step 			%;\
	!spelunk

;; Paths
/set mine1_path se e n w e n e se nw w s s s se sw e e w w s s n n ne nw sw s s nw n w s n e s se n n ne n w nw ponder
/set mine3_path n n w w se nw s n sw ne w e nw se n e e n w n n w w s nw s s s s s w w n e s e n n n n n se e s s s e e s s ponder
/set mine4_path e e e se se se n n n n n n sw sw sw e e e e e w w s s s ne ne ne n n n s s s nw nw nw sw sw sw w w w ponder
/set mine5_path e s s s e ne ne s s s e n n n n se se n e e w w n w e e n n w sw w w nw nw w s s s w ponder
/set mine6_path w n n n w s s s nw n sw w w n s s e e e s sw n s s s se sw nw se n n n n e n e e e ponder
/set mine7_path se e n e e e e s e e s w s w s s e e e n n w s n e s s w w w w w w n n e s n w s s e e e n n w n w n e e n w w w w w s nw ponder
/set mine8_path s se sw sw n n s s nw nw ne e e n ponder

;; DEFINITIONS

/def cboton = /load craft_mine_bot.tf

/def cbotoff = \
	/undef catch_prompt				%;\
	/undef craft_corpse_trig			%;\
	/undef spelunk_nothing				%;\
	/undef spelunk_searched				%;\
	/undef spelunk_mineral				%;\
	/undef spelunk_already				%;\
	/undef spelunk_deposit				%;\
	/undef spelunk_disturb				%;\
	/undef spelunk_exhaust				%;\
	/undef craft_endpath                            %;\
        /undef mine_swap1                               %;\
        /undef mine_swap2
