;;
; Ryan Mahar - V0.1 - Basic Layout
;
; 2013.06.03 - V0.1 - Capture mud output
;
;
;;
;
;/def -t'^(?:> )?HP:(\d+)/(\d+)/(\d+) ST:([\d\.]+)\% PP:([\d\.]+)\% (\d+)\[([\d\.]+)\%\] E\[([\d\w\.\%]*)\] (\d+)/(\d+)\% (\w) (\w+)' zion_hp = \
;;
; Necro HPBARs : Notabot 2013.06.03
;
; Delta HPBAR:
; === HP: 0 === : >>> SP: -22 <<< : === NP: 0 ===
;
; Were Standard HPBAR:
;HP[838(124)/838] SP[171/501] NP[460/460|20c] E[Hefty Smurf:34%]
;
/def -t'^HP\[(\d+)\((\d+)\)/(\d+)\] SP\[(\d+)/(\d+)\] NP\[(\d+)/(\d+)\|(\d+)c\] E\[(.+)\]' necro_were_hpbar = \
	/eval /echo "------------ HP BAR -----------" %;\
	/set hp			%P1	%;\
	/set hpfuse		%P2	%;\
	/set hp_max		%P3	%;\
	/if (hp < hp_max ) 		\
		hpf			%;\
	/endif%;				\
	/set sp			%P4	%;\
	/set sp_max		%P5	%;\
	/set np 		%P6	%;\
	/set np_max 		%P7	%;\
	/if (sp<500 & dodevour)		\
		devour			%;\
		/set dodevour 0 %;\
	/endif %;\
	/status_graph hp hp_max %;\
	/status_graph sp sp_max %;\
	/status_graph np np_max %; 
        /set status_bar $[pad("HP:",3,hp,4,"/",1,hp_max,4," SP:",4,sp,3,"/",1,sp_max,3," NP:",4,np,3,"/",1,np_max,3)]%;\
        /set status_bar2 $[pad("HP:",3,hpgraph,10," SP:",4,spgraph,10," NP:",4,npgraph,10)]%;

; 
;
;;
;

;;
;  The glowing teardrop is dissolved away as the globe cracks to dust.
;;
;  Create light dropped
;;
;
;
; ///The magical strands sparkle from your body.
;
;; Protection Dropped
;;
;
;;
;

;
;Encumberance  [1024/1088|94%| 26c]

;
;Bolwyn        [   0/ 464| 0%|  0c]

;
;Coffin        [   0/  26| 0%|  0c] [......]

;
;Smuggling     [   0/  20| 0%|  0c]

;
;Your link to the guild tells you:
;  Attempting to kill 'Smurfette'...


;
;Necromantic energy flows into your beast skull.

;
;Saving clan status.

;
;Were status saved.
/def -t'^Were status saved\.' do_repower = memorize remember%;
;
;Character saved.

;
;Your link to the guild tells you:
;  Your guild and game status has been saved Notabot.

;
;;;
;GAG THIS TEXT: There are not that many hit points hpinfused.
;;
/def -ag -t'There are not that many hit points hpinfused\.' gag_hpfuse_fail
;;;

;;;
;GAG THIS TEXT: You can't hpfuse yourself above 832 hit points.
;;
/def -ag -t'You can\'t hpfuse yourself above [0-9+] hit points\.' gag_hpfuse_fail2
;;;
;Ticktock tells you:
;  Attempting to study up to your memorized snapshot mistress...
;  trying: devour 35...
;You chant in ancient tongues and attempt to memorize 'devour 35'
;The spirit tells you: You have completed 35 studies of devour.
;The spirit tells you: You now have 9 open memory globes.
;Ticktock tells you:
;  Done mistress.
;The animal fury fades from your soul.
;A greesh trudges in.
;
;

;
;

;
;

;
;

;
;

;
; |    ginseng:741    black pearls:978    spider web:986    goldenrod:781     |
/def -t'^ \|    ginseng\:([0-9+])[\s+]black pearls\:([0-9+])[\s+]spider web\:([0-9+])[\s+]goldenrod\:([0-9+])' capture_reagent_1 = \
	/set ginseng_level 		{P1}		%;\
	/set black_pearl_level 		{P2}		%;\
	/set spider_web_level		{P3}		%;\
	/set goldenrod_level		{P4}		%;
;


;
; |   mandrake:957    pine needles:997    nightshade:998    bloodmoss:10      |
; |   mandrake:957    pine needles:997    nightshade:998    bloodmoss:10      |






