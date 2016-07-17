;Zion startup files




; Sets matching to default to regexp instead of glob
/set matching regexp

;Load required files from tf-lib for functionality
/require alias.tf
;/require map.tf

;Load common files
/load module_run.tf
/load directions.tf
/load aliases.tf
/load trigs.tf
/load westersea.tf
/load crafting.tf
/load status_bar.tf
/load chat.tf
;/load dog.tf
;/load zion/dog.tf


;Set up input field
/set prompt_wait 0.5
/set visual on
/set isize 3
/status_hp2

;Set keypad to off for PuTTY friendly numpad
/set keypad off

;Gags the redefined messages
;/def -ag -mglob -h"REDEF" gagredef


;Load player specific aliases/triggers
/hook CONNECT = \
	/eval /load ${world_name}_trigs.tf			%;\
	/eval /load ${world_name}_aliases.tf			%;\
	/eval /log -g ~/.tf/logs/$[${world_name}]_$[ftime("%Y%m%d")].log

; Sets %max_trig to 0 to allow unlimited triggers
; (fixes issue of lag turning off borg)
/set max_trig 0
;/def -E"!uquit" -h"SEND ^quit*" preventquit = /echo quitting disabled Syntax: /set uquit 1
