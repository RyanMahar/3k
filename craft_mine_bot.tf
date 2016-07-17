;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                               ;;
;;                           STEPBOT                             ;;
;;                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  REQUIRES:  step.tf                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/set deposits 0
/set monster 0
/set mining silver gold mithril ebon adamantium obsidian 

/def -t'You have found nothing.' spelunk_nothing =							\
	/set craft_prompt 1										%;\
	/echo -aBCbgblue PROMPT SET
/def -t'It appears this part of the shaft has already been searched.' spelunk_searched =		\
	/set craft_prompt 1 %; /echo -aBCbgblue PROMPT SET
/def -t' A ([a-z]+) ore deposit.' spelunk_mineral =							\
	/echo -aBCbgblue ....MINERAL??									%;\
	/if (regmatch({P1},{mining}) > 0)								\
		/set deposits 1										%;\
		/echo -aBCbgblue DEPOSIT FOUND								%;\
	/endif
/def -t'You have disturbed' spelunk_disturb =								\
	 /set monster 1 %; /echo -aBCbgblue MONSTER DISTURBED
/def -t'You have exhausted the supply of ([a-z]+) ore.' spelunk_exhaust =				\
	/set deposits 0											%;\
	/set craft_prompt 1										%;\
	/echo -aBCbgblue PROMPT SET									%;\
	!tga
/def -t'There is already a deposit here!' spelunk_already =						\
	/if ({deposits}) /craft_mine									%;\
	/else 												\
		/set craft_prompt 1									%;\
		/echo -aBCbgblue PROMPT SET								%;\
	/endif
/def -t'You have found a deposit of ([a-z]+) ore!' spelunk_deposit =					\
	/if (regmatch({P1},{mining}) > 0)								\
		/set deposits 1										%;\
		/echo -aBCbgblue DEPOSIT FOUND								%;\
		/set craft_prompt 1									%;\
		/echo -aBCbgblue PROMPT SET								%;\
	/else												\
		/set craft_prompt 1									%;\
		/echo -aBCbgblue PROMPT SET								%;\
	/endif
/def -t'You cannot spelunk while you\'re being attacked!' spelunk_attacked =				\
	/beep												%;\
	/cbotoff											%;\
	/beep												%;\
	/echo -aBCbgblue !ERROR: You moved after spawning a mob!!?!!?!					%;\
	/beep
	
/def -p1000 -t'dealt the killing blow' craft_corpse_trig =						\
	!wrap												%;\
	!tga												%;\
	/set monster 0											%;\
	/if ({deposits}) /craft_mine									%;\
	/else												\
		/set craft_prompt 1									%;\
		/echo -aBCbgblue PROMPT SET								%;\
	/endif
/def -h'PROMPT (> )+' catch_prompt =									\
	/echo MINING>											%;\
	/if ({craft_prompt})										\
		/set craft_prompt 0									%;\
		/echo -aBCbgblue PROMPT REMOVED								%;\
		/if ({monster})										\
			/break										%;\
			/echo -aBCbgblue PROMPT BREAK FOR MONSTER					%;\
		/elseif ({deposits})									\
			/echo -aBCbgblue PROMPT CALLED MINE						%;\
			/craft_mine									%;\
		/else											\
			/echo -aBCbgblue PROMPT CALLED STEP						%;\
			/cstep										%;\
		/endif											%;\
	/endif
/def -t'You ponder the situation.' craft_endpath = /cbotoff


/def cbotp = /set craft_prompt 0
/def cbotu = /set craft_prompt 1
