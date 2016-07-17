;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                               ;;
;;                          Assembler                            ;;
;;                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/def assemble = !stashlist fragment%;/set assembling on
/set qualities legendary superior good average poor crude worthless

/def -F -t'([A-Za-z]+) Of ([A-Za-z\s]+)\s+\|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+)' craft_assemble = \
	/let size $[tolower({P1})]						%;\
	/let type $[tolower({P2})]						%;\
	/if ({size} !~ "essence")						\
		/if ({size} !~ "fragment")					\
			/break							%;\
			/endif							%;\
	/endif									%;\
	/let i=4								%;\
	/while (i <= 10)							\
		/eval /set temp_value %%P%i					%;\
		/if ({temp_value} >= 5)						\
			/let quality $(/nth $[{i}-3] %qualities)		%;\
			/repeat -0 -S 5 !unstash %quality %size of %type 	%;\
			/eval !assemble %size of %type				%;\
			/if ({size} =~ "fragment")				\
				!stash essence					%;\
			/elseif ({size} =~ "essence")				\
				!stash heart					%;\
			/endif							%;\
		/endif								%;\
		/let i=$[i + 1]							%;\
	/done



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                               ;;
;;                        Stash Counter                          ;;
;;                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/def -t'Showing only those objects that contain the string \'([\w\s]+)\'' craft_stash_start = \
	/eval /set stash_item $[toupper({P1},1)]				%;\
	/set stash_count 0							%;\
	/set stash_l 0								%;\
	/set stash_s 0								%;\
	/set stash_g 0								%;\
	/set stash_a 0								%;\
	/set stash_p 0								%;\
	/set stash_c 0								%;\
	/set stash_w 0

/def -F -t'[\w\s\']+\|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+) \|\s+(\d+)' craft_stash_count = \
	/set stash_count $[{stash_count} + {P1}]				%;\
	/set stash_l $[{stash_l} + {P2}]					%;\
	/set stash_s $[{stash_s} + {P3}]					%;\
	/set stash_g $[{stash_g} + {P4}]					%;\
	/set stash_a $[{stash_a} + {P5}]					%;\
	/set stash_p $[{stash_p} + {P6}]					%;\
	/set stash_c $[{stash_c} + {P7}]					%;\
	/set stash_w $[{stash_w} + {P8}]

/def -t'You have [0-9]+/999 items in your satchel.' craft_stash_total = \
	/eval /echo $[pad({stash_item},-26)]\| $[pad({stash_count},3)] \|\
		$[pad({stash_l},3)] \|$[pad({stash_s},3)] \|$[pad({stash_g},3)] \|\
		$[pad({stash_a},3)] \|$[pad({stash_p},3)] \|$[pad({stash_c},3)] \|\
		$[pad({stash_w},3)] \|%;\
	/echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-%;\
	/eval /echo You have %stash_count %stash_item in your satchel. 		%;\
	/if (assembling =~ "on")						\
		!stashlist essence						%;\
		/set assembling off						%;\
	/endif
	
