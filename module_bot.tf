
/def botstatus = \
/eval /echo Vindaes  --> $[vindaes_l]%;\
/eval /echo Gargamels --> $[gargamels_l] %;\
/eval /echo Camazot   --> $[camazot_l]%;\
/eval /echo Bombfreak --> $[bombfreak_l]%;\
/eval /echo land2 Stone-> $[land2stone_l]%;\
/eval /echo Mantis    --> $[mantis_l]%;\
/eval /echo Pol v2.0  --> $[pol2_l]%;\
/eval /echo Sset Cow  --> $[summerset_l]%;\
/eval /echo mahjongg  --> $[mahjongg_l]%;\
/eval /echo murdock   --> $[murdock_l]%;\
/eval /echo hamilton  --> $[hamilton_l]%;\
/eval /echo Pol       --> $[pol_l]%;\
/eval /echo Sset Rabb --> $[summerset_warrens_l]%;\
/eval /echo Elven Wood--> $[elven_woods_l]%;\
/eval /echo Duke Nukem--> $[nukem_l]%;\
/eval /echo Alphabets --> $[alphabet_l]



/def reset_bot = \
	/set corpsing 0%;\
        /set gargamels_l 0%; \
        /set mahjongg_l 0%; \
        /set murdock_l 0%; \
        /set hamilton_l 0%; \
        /set summerset_l 0%; \
        /set alphabet_l 0%;\
        /set summerset_warrens_l 0%;\
        /set pol_l 0%;\
        /set pol2_l 0%;\
        /set mantis_l 0%;\
	/set land2stone_l 0%;\
	/set camazot_l 0%;\
	/set bombfreak_l 0%;\
	/set elven_woods_l 0%;\
	/set nukem_l 0%;\
	/set vindaes_l 0%;

/def stop_bot = \
	/set corpsing 0%;\
        /set gargamels_l 1%; \
        /set mahjongg_l 1%; \
        /set murdock_l 1%; \
        /set hamilton_l 1%; \
        /set summerset_l 1%; \
        /set alphabet_l 1%;\
        /set summerset_warrens_l 1%;\
        /set pol_l 1%;\
        /set pol2_l 1%;\
        /set mantis_l 1%;\
	/set land2stone_l 1%;\
	/set camazot_l 1%;\
	/set bombfreak_l 1%;\
	/set elven_woods_l 1%;\
	/set nukem_l 1%;\
	/set vindaes_l 1%;

; execute next directive
/def smurfdirective = \
	/if ("necromancer" =~ guild) \
		; Do stuff here for Notabot\
	/elseif ("elemental =~ guild) \
		; do stuff here for Foamy\
	/elseif ("changeling" =~ guild) \
		; do stuff for Zion\
	/elseif ("angel" =~ guild) \
		; do stuff for Zion\
	/endif %;

/def camazotdirective = \
	/set boms 1%;
/def end_camazot = /set boms 0%;

;/elseif (!gargamels_l) /set area smurf%; \

/def nextdirective = \
	/eval /echo "------- CURRENT DIRECTIVE $[area] --------"%;\
	/if (!vindaes_l) /set area vindaes%;\
	/elseif (camazot_l == 0) /set area camazot%;/camazotdirective%;\
	/elseif (!bombfreak_l) /set area bombfreak%;/bombfreakdirective%;\
	/elseif (!land2stone_l) /set area land2stone%;/land2stonedirective%;\
	/elseif (!mahjongg_l) /set area mahjongg%;/mahjonggdirective%;\
	/elseif (!mantis_l) /set area mantis%;/mantisdirective%;\
	/elseif (!nukem_l) /set area nukem%;/nukemdirective%;\
	/elseif (pol2_l == 0) /set area pol2%;/pol2directive%;\
	/elseif (summerset_l == 0) /set area summerset%;/summersetdirective%;\
	/elseif (elven_woods_l == 0) /set area elven_woods%;/elven_woodsdirective%;\
	/elseif (murdock_l == 0) /set area murdock%;/murdockdirective%;\
	/else /set area rest%;/echo AREA REST in NEXT DIRECTIVE%;\
	/endif

;;  NEED to delete and remake this every time
/def -t'^(?:> )?You bow with a flourish\.' directive_complete = \
	/eval /repeat -00:00:01 1 /bot $[area]%;\
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;   Octagonal Key Encountered
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The Octagonal Key is banned from the shop.

/def -t'^The Octagonal Key is banned from the shop/.$' oct_key_dispose = \
	dispose octagonal key%;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;   LOG BOT ACTIONS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/def timestamp = /eval /set ts $[ftime("%Y%m%d::%H:%M:%S", time())]>

/def botlog = \
	/echo BOTLOG EVENT DETECTED %;\
	/timestamp %%;\
	/eval /set windowmsg=%%{ts}$$[escape("\$\%\;",%{*})] %%;\
	/eval /echo windowmsg %;\
	/eval /let retval=$$[tfwrite(lines, encode_ansi(windowmsg))] %%;\
	/eval /set lastline=%%{lines}





; MOB IDENTIFIED

; MOB IDENTIFIED, multiples

; MOB IDENTIFIED , previously injured

; MOB IDENTIFIED , multiple

; MOB IDENTIFIED , aggro
;
; MOB IDENTIFIED , previously injured, aggro
;

