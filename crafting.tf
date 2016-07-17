;; Crafting
/load craft_stash.tf
/load craft_mine.tf
/load craft_recipes.tf

;/def -t'You have created something new!' craft_fire = \
;	retrieve all					%;\
;	give gloves to canislupus			%;\
;	stash all					%;\
;	unstash2 2 worst copper bar			%;\
;	unstash2 2 worst copper shards			%;\
;	unstash2 worst topaz				%;\
;	unstash2 worst tiger's eye dust			%;\
;	unstash2 worst fragment of light		%;\
;	insert moulding					%;\
;	insert fragment					%;\
;	insert gem					%;\
;	/rp 2 insert bar				%;\
;	/rp 2 insert shards				%;\
;	insert jewel					%;\
;	insert dust					%;\
;	fire
;/def -t'You have created something new!' craft_fire = retrieve all%;insert moulding%;insert fragment%;insert jewel%;insert shards%;fire

/def -t'You have created something new!' craft_fire = \
	/if (auto_craft =~ "on")			\
		!retrieve all				%;\
		/eval /forge worst %{cxp_item}		%;\
	/endif

/def -t'You have advanced your (?:\w+) skill!' craft_adv = /set auto_craft off

/def forge = \
	!retrieve all										%;\
	!stash all										%;\
	/set forge_ready 1									%;\
	/set forge_quality %1									%;\
	/eval /set forge_recipe %%{%2}								%;\
	/while (strstr({forge_recipe},"#") > 0)							\
		/set forge_ingredient $[substr({forge_recipe},0,strstr({forge_recipe},"#"))]	%;\
		/set forge_recipe $[substr({forge_recipe},strstr({forge_recipe},"#")+1)]	%;\
		/set forge_ingredient_number $[substr({forge_ingredient},0,1)]			%;\
		/set forge_ingredient $[substr({forge_ingredient},2)]				%;\
		/if (strstr({forge_ingredient},"gem") < 1)					\
			/rp %forge_ingredient_number !unstash2 %forge_quality %forge_ingredient	%;\
		/endif										%;\
		/repeat -0 %forge_ingredient_number !insert %forge_ingredient			%;\
	/done											%;\
	/set forge_ingredient %forge_recipe							%;\
	/set forge_ingredient_number $[substr({forge_ingredient},0,1)]				%;\
	/set forge_ingredient $[substr({forge_ingredient},2)]					%;\
	/if (strstr({forge_ingredient},"gem") < 1)						\
		/repeat -0 %forge_ingredient_number unstash2 %forge_quality %forge_ingredient	%;\
	/endif											%;\
	/repeat -0 %forge_ingredient_number insert %forge_ingredient				%;\
	!insert moulding									%;\
	/repeat -1 1 /forge_fire

/def forge_fire = \
	/if ({forge_ready})									\
		!fire										%;\
	/else											\
		/echo FORGE NOT READY!								%;\
		!retrieve all									%;\
		!stash all									%;\
	/endif

/def -t'You don\'t have one of those.' forge_ready_fail1 = /set forge_ready 0
/def -t'but none of quality' forge_ready_fail2 = /set forge_ready 0







;; Wrangling
/def -t'^(?:> )?The gem is now (\d+)\.?(\d*)\% full\.$' wrangle_gem = \
	/if ({P1} = 100)		\
		/set gem_per 100	%;\
		/set gem_tot 0		%;\
	/else				\
		/set gem_per 0.%P1%P2	%;\
	/endif
/def gem = \
	/set gem_tot $[{gem_tot}+{1}]	%;\
	/calc gem_tot/gem_per-gem_tot
