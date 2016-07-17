


/def -t'^(?:> )?[A-Za-z]+ :: HP: (\d+)/(\d+)  Happy: ([\d\-]+)\%  Hungry: ([\d\-]+)\%  Level: (\d+)/(\d+)\%' dog_hp = \
	/set dog_hp  %P1				%;\
	/set dog_mhp %P2				%;\
	/set dog_hap %P3				%;\
	/set dog_hun %P4				%;\
	/set dog_lvl %P5				%;\
	/set dog_tnl %P6				%;\
	/if (dog_hp < dog_mhp*0.75)			\
		/echo -aBCbgred !DOG IS BEING DAMAGED 	%;\
		/beep					%;\
	/endif						%;\
	/if (dog_hp < dog_mhp*0.65)			\
		vet heal				%;\
	/endif						%;\
	/if (dog_hap < 95) !dog pet %; /endif		%;\
	/if (dog_hun > 40) \
		/if (dog_eat =~ "coffin") \
			!unwrap				%;\
			!dog eat			%;\
		/elseif (dog_eat =~ "cooler")		\
			!uncooler corpse		%;\
			!dog eat			%;\
		/elseif (dog_eat =~ "freezer")	\
			!deslab			%;\
			!dog eat			%;\
		/elseif (dog_eat =~ "inventory")	\
			!drop corpse			%;\
			!dog eat			%;\
		/else \
			/_echo DOGGIE HUNGRY -- ERROR!!	%;\
			/beep				%;\
		/endif					%;\
	/endif
/set dog_eat cooler

;; Dog Heel and Stay Toggles
/def -t'^(?:> )?(?:[SZFNiofcrenabtmy]+) command(?:s)? (?:everyone|your audience) to HEEL\!$' dog_heel_all = \
	!dog heel

/def -t'^(?:> )?([SZFNiofcrenabtmy]+) has commanded you to HEEL!$' dog_heel = \
	!dog heel

;/def -t'^(?:> )?(\w+) woofs at you\.$' dog_stay = \
;	!dog stay

/def -t'^(?:> )?([SZFNiofcrenabtmy]+) woof(?:s)?\.$' dog_stay_all = \
	!dog stay

;; Dog Heel and Stay Status
/def -t'^(?:> )?Your dog lays down and places his head on his paws, looking sad\.$' dog_stayed = \
	say Nova is staying here.

/def -t'^(?:> )?Your dog is so happy he can hardly stand it and runs around in circles\.$' dog_unstayed = \
	say Nova is following me.

/def -t'^(?:> )?Your dog looks disappointed, but slowly moves behind you\.$' dog_heeled = \
	say Nova is no longer assisting me in combat.

/def -t'^(?:> )?Your dog is so happy he can hardly stand it and bounds in front of you\.$' dog_unheeled = \
	say Nova is now assisting me in combat.

;; Dog Eat Updates
/def -t'^(?:> )?The cooler does not contain a corpse\.$' cooler_empty = \
	/set cooler off		%;\
	/set dog_eat freezer`

/def -t'^(?:> )?There is no reason to \'uncooler\' here\.' cooler_gone = \
	/set cooler off		%;\
	/set dog_eat freezer
/def -t'^(?:> )?There is no reason to \'deslab\' here\.' freezer_gone = \
	/set freezer off	%;\
	/set dog_eat coffin

;; Dog Auto-attack
/def -t'^(?:> )?Lilman, (?:\w+)\'s Beagle bounds into the room\.$' dog_enter = \
	/if (dog_attacking =~ "on")	\
		dog sicem %mobname	%;\
	/endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BEGIN DOG GAGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/def -ag -t'^Vet Commands: 0/12$' no_dog_commands_gag
/def -ag -t'^Your dog tears a chunk of flesh from [A-Za-z\s\'\-]+\.' dog_tear_gag
/def -ag -t'^Lilman, [FSNZamybtcreion]+\'s Beagle viciously tears into' dog_assist_gag
