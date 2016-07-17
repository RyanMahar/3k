;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Aliases file for 3Kingdoms                                         ;;
;; v 1.8.0                                                            ;;
;; CanisLupus                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; General Aliases
/alias goto houseedit gotoroom %1
/alias gl glance
/alias los lineofsight
/alias sl stashlist %*

;;Party aliases
/alias pnam !pname \033[31;1m-=\033[34;1m(\033[37;1mCanis Lupus\033[34;1m)\033[31;1m=-\033[0m


;;Fallout Shelter
/alias ergcheck d%;push button%;s%;w%;exa erg%;e%;s%;exa erg%;n%;e%;exa erg%;w%;n%;u
/alias focon console turn dial%;console flip switch%;console turn knob%;console move slider

;;Functions
;Repeat
/def rp = /repeat -0 -S %1 %-1

;Calculate
/def calc = /eval /_echo $$[%*]

;Idle
/def idle = \
	/if (!idle_pid) \
		/echo -aBCbgblue IDLE MODE ON %;\
		/repeat -30 100 /chkidle %;\
		/set idle_pid %? %;\
	/else \
		/echo -aBCbgblue IDLE MODE OFF %;\
		/kill %idle_pid %;\
		/unset idle_pid %;\
	/endif
	

/def chkidle = \
	/echo -aBCbggreen IDLE FOR:  $[idle()] %;\
	/if ((idle() >= idle_time)&(idle_pid))\
		/set borg off %;\
		/echo -aBCbgblue !IDLE!  ALL TRIGGERS OFF %;\
		/echo -aBCbgblue !IDLE MODE OFF! %;\
		/kill %idle_pid %;\
		/unset idle_pid %;\
	/endif
/set idle_time 0:05:00


;Switch Characters
/def switchto = \
	/set switching %1					%;\
	/if (${world_name} =~ "inix")				\
		/updplan %1					%;\
		/repeat -S -2 /echo PLAN UPDATED		%;\
	/endif							%;\
	/if (strstr(${world_name},"3s") > 0)			\
		/set switching $[strcat({switching},"3s")]	%;\
	/endif							%;\
	/dc							%;\
	/log off						%;\
	/purgedef						%;\
	/purgealias						%;\
	/load start.tf						%;\
	/connect %switching

/def start = \
	d		%;\
	touch post	%;\
	e		%;\
	home		%;\
	newbie		%;\
	/run 2w2s	%;\
	acquire		%;\
	/run 2n2eh	%;\
	keep all

; Bag
/alias bag !get all%;!put all in bag

;Reconnect (last in room)
/def reco = /dc%;/eval /connect ${world_name}

;Slime!
/alias slc !unwrap%;!slime feed corpse

; Death Taco formulas
/alias dtaco 'Sour cream:    Fire/Elec%;'Nacho Cheese:  Ice/Acid%;'Meat Paste:    Edged/Energy%;'Refried Beans: Blunt/Poison%;'Foil Wrapper: Mind/Radiation

/def ascii = \
	/if ({1} =~ "tell") \
		!converse %1 %2 %;\
		/set asc_path $[strcat("ascii/",{-2},".txt")] %;\
	/else \
		!converse %1 %;\
		/set asc_path $[strcat("ascii/",{-1},".txt")] %;\
	/endif %;\
	/quote -S '%asc_path %;\
	/send \*\*

;; Vampiric Blade Hiding
/alias voff unkeep blade%;put blade in belt%;smuggle belt%;wield sword
/alias von smuggle remove belt%;get blade from belt%;keep blade%;keep belt%;unwield%;wield blade

;; Puppies
/alias pupset /run Cr2wn%;follow tracks%;n%;s%;return%;/run s2eVh

/def shankey = \
	search bed	%;\
	pull lever	%;\
	search dresser	%;\
	open drawer	%;\
	get key		%;\
	keep key

/alias i1 insert hand into left hole
/alias i2 insert hand into centre hole
/alias i3 insert hand into right hole

/alias getcloud /run Cr3e2s2en3en2w4nrq2ws%;gaze into mirror%;roll cloud%;get cloud%;claim cloud%;s%;e%;slide on slide%;/run n2evo4s2es3ws2w2n3wVh

/set split_size -10
/def split = \
	/if ({1} =~ "up") \
		/sys tmux resize-pane -U %2 %;\
	/elseif ({1} =~ "down") \
		/sys tmux resize-pane -D %2 %;\
	/endif

/def splitpc = \
	/set split_size -15	%;\
	/split			%;\
	/set split_size -10

/alias th tellhist
/alias vetr veterinarian
/alias rem remove %*
/alias ga get all
/alias gc get coins
/alias gac get all from corpse
/alias kac keep all corpse
