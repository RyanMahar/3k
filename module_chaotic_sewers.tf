;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;	Ryan Mahar
;    Chaotic Sewers Script
;
;
;   Ported from ZMUD implementation
;
;
;  20151103 - Began implementing movements
;  20151118 - Capture Rooms Correctly 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;
; 	TRIGGERS
;;;
/set killname mobname %;
/set step_auto off%;
/def -h'PROMPT (> )+' sewer_catch_prompt =                      \
        /if ({step_prompt})                                     \
                /if ({player})                                  \
                        /echo -aBCbgblue PROMPT: Player Skip    %;\
                        /set step_prompt 1                      %;\
                        /set player 0                           %;\
                        /set monster 0                          %;\
                        /sewerstep $[sewerexits]          %;\
                /elseif ({monster})                             \
                        /set step_prompt 0                      %;\
                        /if ({killname} =~ "mobname")           \
                                /if ({dog_attacking} !~ "on")   \
                                /eval !kill %mobname            %;\
                                /endif                          %;\
                        /endif                                  %;\
                /else                                           \
                       /echo -aBCbgblue PROMPT: SEWERSTEP      %;\
                       /sewerstep $[sewerexits]          %;\
                /endif                                          %;\
        /endif

/def seweroff = \
	/undef sewerstep  %;\
	/undef sewerswalked %;\
	/undef sewer_catch_prompt %;\
	/undef sewer_deadend %;\
	/undef sewer_hall %;\
	/undef sewer_4room %;\
	/undef sewer_3room %;\
	/undef sewer_deadend %;\
	/unset sewer_move %;\
	/unset sewer_moved %;

/def sewerstep = \
        /let _arg=%*		                                %;\
	/sewerswalked %sewer_move				%;\
	/let _i=-1%;\
	/while ((_c:=substr(_arg, ++_i, 1)) !~ "" ) \
	  /if (_c =~ "u") /seweroff %; /endif%;\
	  /if (_c =~ "n") /set _north 1 %; /endif%;\
	  /if (_c =~ "s") /set _south 1 %; /endif%;\
	  /if (_c =~ "e") /set _east 1 %; /endif%;\
	  /if (_c =~ "w") /set _west 1 %; /endif%;\
	/if (sewer_moved =~ "e") \
	  /if     (_north) /set sewer_move n%; /echo MOVE N%;\
	  /elseif (_east)  /set sewer_move e%; /echo MOVE E%;\
	  /elseif (_south) /set sewer_move s%; /echo MOVE S%;\
	  /endif%;\
	/elseif (sewer_moved =~ "n") \
	  /if     (_west)  /set sewer_move w%; /echo MOVE W%;\
	  /elseif (_north) /set sewer_move n%; /echo MOVE N%;\
	  /elseif (_east)  /set sewer_move e%; /echo MOVE E%;\
	  /endif%;\
	/elseif (sewer_moved =~ "s") \
	  /if     (_east)  /set sewer_move e%; /echo MOVE E%;\
	  /elseif (_south) /set sewer_move s%; /echo MOVE S%;\
	  /elseif (_west)  /set sewer_move w%; /echo MOVE W%;\
	  /endif%;\
	/elseif (sewer_moved =~ "w") \
	  /if     (_south) /set sewer_move s%; /echo MOVE S%;\
	  /elseif (_west)  /set sewer_move w%; /echo MOVE W%;\
	  /elseif (_north) /set sewer_move n%; /echo MOVE N%;\
	  /endif%;\
	/endif%;\
	/send %sewer_move%;\
	/set _north 0%;\
	/set _west 0%;\
	/set _east 0%;\
	/set _south 0%;

; IF <next_dir> -> <list of best options>
; IF e -> n e s
; IF n -> w n e
; IF s -> e s w
; IF w -> s w n


/def sewerswalked = \
	/let _arg=%*%;\
	/if (regmatch("[nesw]", _arg)) \
		/if (_arg =~ "n") /set sewer_moved n%; /endif%;\
		/if (_arg =~ "s") /set sewer_moved s%; /endif%;\
		/if (_arg =~ "w") /set sewer_moved w%; /endif%;\
		/if (_arg =~ "e") /set sewer_moved e%; /endif%;\
	/endif%;
	
/def -t'^(?: >)?Sewer Maze \((\w),(\w),(\w),(\w)\)' sewer_4room = \
	/set sewerexits %P1%P2%P3%P4%;

;Sewer Maze (n,s)
/def -t'^(?: >)?Sewer Maze \((\w),(\w)\)' sewer_hall = \
	/set sewerexits %P1%P2%;

;Sewer Maze (n,s,w)
/def -t'^(?: >)?Sewer Maze \((\w),(\w),(\w)\)' sewer_3room = \
	/set sewerexits %P1%P2%P3%;

;Dead End (e)
/def -t'Dead End \((\w)\)' sewer_deadend = \
	/set sewer_move %P1 %;

;Sewer Portal (w,e,u,s)
/def -t'^Sewer Portal \(' sewer_portal = \
	/beep%;\
	/beep%;\
	/beep%;\
	/if (sewer_stopping) /seweroff%;\
	/endif%;

;> MOB ANSI

/def -t'^=M=([\w\s\(\)\,\-\']+){?(\d+)?}?.' sewer_step_mob =          \
        /set mobname $[tolower({P1})]                           %;\
        /if (strstr(mobname," attacking you") > 0)              \
          /set mobname $[substr(mobname,0,strstr(mobname," attacking you"))]%;\
        /endif                                                         %;\
        /if (({step_prompt})&                                            \
             (strstr(mobname,"kluckenthal") <0)&                         \
             (strstr(mobname,"courier") <0)&                             \
             (strstr(mobname,"unkillable") < 0))                         \
                /if ({P2})                                               \
                        /set monster $[monster + {P2}]                 %;\
                /else                                                    \
                        /set monster $[monster + 1]                    %;\
                /endif                                                 %;\
        /endif


/def -t'^=M=Thorn beast.$' thorn_beast_unaggro = \
	/set monster 1%;\
	kill thorn beast%;
;                                                                     
/def -t'^=M=Venomous sludge.$' sludge_unaggro = \
	/set monster 1%;\
	kill sludge%;
;
/def -t'^=M=Mudman.$' mudman_unaggro = \
	/set monster 1%;\
	kill mudman%;
;
/def -t'^=M=Grimy Beast.$' grimy_beast_unaggro = \
	/set monster 1%;\
	kill grimy beast%;

/def -t'^=M=Muck Monster.$' muck_monster_unaggro = \
	/set monster 1%;\
	kill muck monster%;

/def -t'^=M=Living Fungus.$' living_fungus_unaggro = \
	/set monster 1%;\
	kill fungus%;

/def -t'dealt the killing blow' sewer_killing_blow = \
          /use_corpse                                     %;\
          !divvy gold                                     %;\
        /if ({monster} > 0)                                     \
          /set monster $[{monster} - 1]                   %;\
        /else /set monster 0                                    %;\
        /endif%;

/def -t'There is no money here to share!' sewer_step_dg1 = \
        /if ({step_auto} =~ "on")                               \
                /set step_prompt 1                              %;\
        /else                                                   \
                /echo -aBCbgblue READY FOR NEXT!  F12           %;\
                /beep                                           %;\
        /endif
/def -p10000 -F -t'\[PARTY\] All gold divvied' sewer_step_dg2 = \
        /if ({step_auto} =~ "on")                               \
                /set step_prompt 1                              %;\
        /else                                                   \
                /echo -aBCbgblue READY FOR NEXT!  F12           %;\
                /beep                                           %;\
        /endif
/def -t'There is no (\w+) here.$' sewer_step_no_mob = \
        /if ({P1} =~ killname)                          \
                /set monster 0                                  %;\
                !divvy gold                                     %;\
        /endif

/set mobnames thorn beast venomous sludge mudman grimy muck monster living fungus

;Add mob kill command to queue as directive
;

;;;
;	FUNCTIONS
;;;


;;
;	Branch

;	Branch on any room with >2 exits
; store rooms in speed mode to optimize getting back to the branch
;
; backtrack variable should be a path to the last branch


;;
;	Next direction
; 
; SETS: directive( movement_back, next_dir )
;

; Accept list of available exits

;;IF PORTAL CASE

; If not a portal room AND
; if only a single item in list -> directive( next_dir, movement_back )
; if more than one item in list parse out delimters -> sanitize
; remove item in list which returns to previous location -> sanitize
;; Follow the left hand wall method of choosing next direction -> 

; IF <next_dir> -> <list of best options>
; IF e -> n e s
; IF n -> w n e
; IF s -> e s w
; IF w -> s w n
