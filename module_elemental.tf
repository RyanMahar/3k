

;/stuff here

;rejuvenate

/def -t'^(?:> )?[MmAaSs]+ [TtRrIiAaDd]+ [SsPpAaMm]+: [YyOoUu]+ [AaRrEe]+ [AaTt]+ [FfUuLl]+ [EeNnRrGgYy]+, [HhPp]+, [AaNnDd]+ [SsPp]+\.$' elemental_regen_complete = d%;sw%;w%;s%;s%;hh%;rup%;

; MasS Triad spam
/def -t'^You cannot emit such a high power level\.  Your max is (\d)\.' emit_level_overage = \
	emit %P1 %;

/def -t'is too heavy for' vortex_full = /set boms 0
/def -t'^(?:>\s)? HP:(\d+)/([\0-9\*S]+) C:(\d+)\%  NRG:(\d+)/(\d+)\(([\d\+\-]+)\)  SP:(\d+)/(\d+)  B:(\d)\((\d+)\%\) G2N:([0-9k]+)[\s]+T:([A-Za-z\s]+):(\d+)\%' hpbarfound_mental = \
	/set hp                 %P1     %;\
	/set hp_max             %P2     %;\
	/status_graph hp hp_max %;\
	/set cohesion		%P3     %;\
	/set energy		%P4     %;\
	/set energy_max 	%P5	%;\
	/status_graph energy energy_max %;\
;	/if (regmatch("[\+\-]", $P6)) \
;	/endif%;\
;	/set emit		%P6
	/set sp			%P7	%;\
	/set sp_max 		%P8	%;\
	/status_graph sp sp_max %;\
	/set blasts 		%P9	%;\
	/set reset		%P10	%;\
	/set enemy		%P13	%;\
	/status_graph enemy mdef %;\
	/set g2n 		%P11	%;\
	/status_graph g2n mdef %;\
	/set ename		%P12	%;\
        /set status_bar $[pad("HP:",3,hp,4,"/",1,hp_max,4," C:",3,cohesion,3,"%_NRG:",6,energy,3,"/",1,energy_max,3,"_",1,ename,5,":",1,enemy,3,"%",1," _B:",4,blasts,1,"(",1,reset,3,"%) ",3," G2N:",5,g2n)]%;\
        /set status_bar2 $[pad("HP:",3,hp_graph,10,"_NRG:",5,energy_graph,10,"_SP:",3,sp_graph,10,"_",1,ename,5,":",1,enemy_graph,10,"_G2N:",5,g2n,4)]     %;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;         Initalization
;  "what to do when you don't know"
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Assume Ignorance -- Set Everything
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/def gg = \
        hh           %; \
        guild        %; \
        /run n2en    %; \
        nw           %; \
        u            %;

;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

;-- Current Thrust: 1200.1  Bonus Thrust:  59.8/289.9                    --
;-- You may tap into your home plane 3 more times.                       --
;-- You may engulf 4 more times today.  You have 1982 soul gems.         --
;-- You have the ability to enshroud 3 more armours.                     --
;-- You may shield yourself from any one element 2 more times this week. --
;-- You've drawn 100% of the energy required to hold corporeal form.     --
;-- You will evoke rebuild at 600 hit points.                            --
;-- You have resolved to do toxic damage at 69% consistency.             --
;-- Energy emission competency for emit 10: 100%                         --
;--                                                                      --
;-- Guild Age : 1 week 4 days 6 hrs 31 mins 6 secs                       --
;-- You joined the guild on Fri Jul 20 19:08:49 2012                     --
;-- You were recruited into the guild by Primal                          --
;-- You have recruited 1 people.  To see them type 'recruits'.           --
;-- You have donated a *very* large pile of gold to the guild.           --
;-- You have very few item donations.                                    --
;-- You have slaughtered many for the sake of the Triad.                 --
;--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
;
;
;Player stats for this login:
;Rooms Explored      :    8016
;Total XP Gained     : 30102176       Total Energy Gained :  213736 (15488/hr)
;Total Kills         :    1472       XP Per Kill  : 20449.85
;Energy Per Kill     :  145.20
;;;

;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    GUILD GAGS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;That creature is not weak enough to be drained of energy.
/def -ag -t'^That creature is not weak enough to be drained of energy\.$' energy_drain_fail

;;Sorry, that can be done only once while the monster is in that condition.
/def -ag -t'^Sorry, that can be done only once while the monster is in that condition\.$' energy_drain_already


;The shimmering shield around you flashes weakly and fades.
/def -t'^The shimmering shield around you flashes weakly and fades\.' gem_fades = \
	/if (geming) /eval gv gem%;keep gem%;/endif%;

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;   GUILD ALIASES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

/alias -                emit 11
/alias 0                emit 10
/alias 00               evoke resolve as radiation
/alias 1                emit 1
/alias 11               evoke resolve as slashing
/alias 2                emit 2
/alias 22               evoke resolve as crushing
/alias 3                emit 3
/alias 33               evoke resolve as fire
/alias 4                emit 4
/alias 44               evoke resolve as ice
/alias 5                emit 5
/alias 55               evoke resolve as acid
/alias 6                emit 6
/alias 66               evoke resolve as shocking
/alias 7                emit 7
/alias 77               evoke resolve as mental
/alias 8                emit 8
/alias 88               evoke resolve as magical
/alias 9                emit 9
/alias 99               evoke resolve as toxic
/alias `                emit 0
/alias aa               activatea
/alias ab               activate blast
/alias ac               acheck
/alias as               activates
/alias b                evoke corpse drain
/alias da               drop all
/alias dda              get all from vortex
/alias ecb              evoke create blast
/alias ed_on            evoke perform as combat eed:99,eed:99,eed:99,ed_on
/alias edoff            evoke perform as combat hp
/alias ee               evoke equipollent
/alias eed              evoke energy drain
/alias eval             evoke evaluate
/alias fillrod          =perform as fillh 500:4,fills 50:10,=rebuild,fillrod
/alias fta              fill out application
/alias gav              get all from vortex
/alias gemoff            reflex remove sp 20%
/alias gemon           reflex add sp 20% release gem
/alias gg               divvy gold
/alias gs               escore
/alias gs2              escore2
/alias gta              give application to richard
/alias hh               home 324
/alias hhh              home 182
/alias jj               evoke rebuild
/alias k1               ktrig evoke rebuild
/alias k2               ktrig evoke trap the soul/evoke rebuild
/alias k3               ktrig evoke corpse drain/evoke rebuild
/alias k4               ktrig evoke rebuild/eat corpse
/alias kc               kill citizen
/alias kg               kill guard
/alias kh               kill human
/alias ll exa
/alias ls pstats
/alias ls2 pstats2
/alias m evoke mental depletion
/alias nc               =natural convergence
/alias pb               put all in box
/alias ps               presage best
/alias pth              ptell -h
/alias pv               put all in vortex
/alias r                wrap all
/alias rg               release gem
/alias sa               sell all
/alias swr              swim river
/alias th tellhist
/alias vi vlist
/alias wnewb newb Welcome $*,  type 'newb' to talk on this chatline with us as you get familiarized with 3Kingdoms
/alias x evasion
