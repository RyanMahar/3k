;HP:2541/2541/64 ST:77.28% PP:100.00% 37[40.13%] E[] 2/25% N AGDH

; basically hp/maxhp/sp stamina protoplasm
;      bioplast[showskill] e[opponent] relinquish/flux force
;      status
/set hyperproliferating off
/set relinquishing off
/set persevering off
/set dissipating off
/def -t'^(?:> )?HP:(\d+)/(\d+)/(\d+) ST:([\d\.]+)\% PP:([\d\.]+)\% (\d+)\[([\d\.]+)\%\] E\[([\d\w\.\%]*)\] (\d+)/(\d+)\% (\w) (\w+)' zion_hp = \
	/set hp		        %P1	%;\
	/set hp_max		%P2	%;\
	/set sp		        %P3	%;\
	/set stamina		%P4	%;\
	/set protoplasm	        %P5	%;\
	/set bioplasts	        %P6	%;\
	/set shadowskill	%P7	%;\
	/set enemy		%P8	%;\
	/set relinquish	        %P9	%;\
	/set flux		%P10	%;\
	/set force		%P11	%;\
	/set powers		%P12	%;\
	/test totalrounds := totalrounds+1%;\
        /status_graph hp hp_max		%;\
	/status_graph stamina mdef	%;\
	/status_graph protoplasm mdef	%;\
	/status_graph enemy mdef	%;\
       /set status_bar $[pad("HP:",3,hp,4,"/",1,hp_max,4,"/",1,sp,2,"_ST:",4,stamina,6,"%",1,"_PP:",4,protoplasm,6,"%_",2,bioplasts,3,"[",1,shadowskill,6,"%]_E[",5,enemy,6,"]_",2,relinquish,1,"/",1,flux,2,"%_",2,force,1,"_",1,powers,4)]%;\
	/set status_bar2 $[pad("HP:",3,hp_graph,10,"_ST:",4,stamina_graph,10,"_PP:",4,protoplasm_graph,10,"_E:",3,enemy_graph,10)]     %;\
	/if ((hp < hp_max)&(protoplasm > 99))	\
		!morph				%;\
	/endif					%;\
	/if ((persevering =~ "off")&(protoplasm < 30))\
		!perseverance on	      %;\
	/endif				      %;\
	/if ((persevering =~ "on")&((stamina<50)|(protoplasm >= stamina)))\
		!perseverance off	      %;\
	/endif				      %;\
	/if ((fusing =~ "yes")&(hp > 500))   	 \
		!morph			       %;\
		!fuse 500	      		%;\
		!fuse 500	      		%;\
		!fuse 500	      		%;\
		!fuse 500	      		%;\
		!fuse 500	      		%;\
		!fuse 500	      		%;\
		!fuse 500	      		%;\
		!morph			     	 %;\
	/endif					%;\
	/if ((stamina < 20)&(relinquish > 0)&(relinquishing =~ "off")) \
		!relinquish			%;\
		/set relinquishing off		%;\
	/endif					%;\
	/if ((protoplasm < 80)&(hyperproliferating =~ "off")&(sp > 10)) \
		!hyperproliferate on		%;\
	/endif					%;\
	/if ((persevering =~ "off")&(stamina > 90) & ((protoplasm + 10) < stamina))\
		!perseverance on		%;\
	/endif					%;\
	/if ((dissipating =~ "off"))\
		!dissipate on			%;\
	/endif					%;\
	/if ((relinquish = 0)&(stamina < 30)&(protoplasm < 20)) \
		/eval !smuggle remove bioplast%;!consume bioplast%; \
		/eval !smuggle remove bioplast%;!consume bioplast%; \
		/eval !smuggle remove bioplast%;!consume bioplast%; \
	/endif					%;\
	/if ((protoplasm > stamina)&(persevering !~ "off"))\
		!per off			%;\
        /endif					%;\
	/if ((flux > 50)&(relinquish > 2))	\
		!relinquish			%;\
	/endif					%;\
	/if ((flux > 80)&(relinquish > 1))	\
		!relinquish			%;\
	/endif					%;\
	/if ((flux > 98)&(relinquish > 0))	\
		!relinquish			%;\
	/endif					%;

/load module_combat.tf
/load module_dog.tf
;/load module_professions.tf
/load module_changeling.tf
;/load module_elemental.tf
;/load foamy_trigs.tf
;/load foamy_aliases.tf
;/load test_trigs.tf
;/load module_skills.tf
;/load gag.tf


;; STEPPER MACRO

/def bot = /eval /boton%;/stepping %{1}%;/key_f8

/alias dp /eval unwrap all%;/rp 35 b%;bsort%;

;; MOVE TO DOG.TF

/def -t'^Your dog looks up at your expectantly, as if awaiting your command' dog_command_add =\
	/set commands 1			%;
/def -t'^Your dog has begun combat with' dog_combat_start = \
	/if (commands = 1) do_incite = vi%;\
	/endif
/def -t'^Your pet is not ready for another command!' no_incite = \
	/set commands 0			%;

;;                           ;;
;; Hyperproliferating Events ;;
;;                           ;;

/def -t'You are too mentally drained to continue accelerating your regeneration!' hyperproliferate_off_1 = \
	/set hyperproliferating off	%;
/def -t'You begin to concentrate on accelerating your natural regeneration process.' hyperproliferate_on1 = \
	/set hyperproliferating on	%;
/def -t'You cease to concentrate on accelerating your regeneration.' hyperproliferate_off2 = \
	/set hyperproliferating off	%;
/def -t'You resume accelerating your natural regeneration.' hyperproliferate_on4 = \
        /set hyperproliferating on		%;

;;                      ;;
;; Relinquishing Events ;;
;;                      ;;

/def -t'You relinquish yourself to Chaos, and immediately feel the unpredictable' relinquishing_on1 = \
	/set relinquishing on		%;
/def -t'The chaotic forces seeking control of you begin to wane, your control' relinquishing_off1 = \
	/set relinquishing off		%;
/def -t'returning as the energies cease to course chaotically through you.' relinquishing_off2 = \
	/set relinquishing off		%;
/def -t'Hyperproliferate will be activated when relinquish ends.' hyperproliferate_off3 = \
	/set hyperproliferating on	%;
/def -t'You are not currently using hyperproliferate.' hyperproliferate_off7 = \
	/set hyperproliferate off	%;


;;                     ;;
;; Perseverence Events ;;
;;                     ;;

/def -t'You focus on retaining your shape.' persevering_on1 = \
	/set persevering on		%;
/def -t'You will no longer persevere.' persevering_off2 = \
	/set persevering off		%;
/def -t'You resume accelerating your natural regeneration.' hyperproliferate_on4 = \
	/set hyperproliferating on		%;
/def -t'You are not currently persevering.' perseverance_off4 = \
	/set persevering off		%;
/def -t'You are currently persevering.' perseverance_on5 = \
	/set persevering on		%;
/def -t'You are too fatigued to continue to persevere!' perseverance_off5 = \
	/set persevering off		%;\
	!smuggle remove bioplast	%;\
	!consume bioplast		%;

;;                  ;;
;; Dissipate Events ;;
;;                  ;;
   
/def -t'^You are too fatigued to dissipate any more attacks!' dissipate_off = \
	/set dissipating off		%;\
	!smuggle remove bioplast	%;\
	!consume bioplast		%;\
	!dissipate on			%;
/def -t'You are currently dissipating attacks against you.' dissipate_on2 = \
	/set dissipating on		%;
/def -t'You will no longer dissipate attacks against you.' dissipate_off2 = \
	/set dissipating off		%;
/def -t'You begin to concentrate on turning aside harmful attacks.' dissipate_on = \
	/set dissipating on		%;

;;                       ;;
;; Changeling Guild Gags ;;
;;                       ;;

/def -ag -t'Zion gives A bioplast \([a-z]+\) to you\.' bsort_gag1
/def -ag -t'You give A bioplast \([a-z]+\) to Zion\.' bsort_gag2

