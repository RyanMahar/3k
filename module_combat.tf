;; module_combat.tf
;
;;
;   BEGIN NUMBERS VAF PERK ANALYSIS
;;
;Numbers are now on.
;;
;Numbers are now off.
;;
;You have turned off numbers.  Type 'numbers on' to turn them back on.
;;
;You have the 'numbers' vaf perk active.  You can turn off totals by
;typing 'numbers totals' (and rely on your guild object to show you)
;and you can turn them off all together with 'numbers off'
;;
/def -mregexp -t"You hit (.+) ([0-9]+) time(s?) for ([0-9]+) damage\." damagetracker = \
   /test totalhits := totalhits+%P2%;/test totaldamage := totaldamage+%P4 %;
;;;
;  Command: damagestats
;  Command Use: 
;;;
/def damagestats = /test averageperround := totaldamage/totalrounds%; \
  /test averageperhit := totaldamage/totalhits%; \
  /echo Average damage over %totalrounds rounds - %averageperround (%averageperhit per hit)
/def dmgs = /damagestats%;
;;;
;
;;;
/def dmg_reset = /test totaldamage := 1%;/test totalrounds := 1%;/test totalhits := 1%;
;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    COMBAT MESSAGES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;/def -F -E"damagegag" -ag -t"* missed *." miss
;/def -F -E"damagegag" -ag -t"* struck but did no damage to *." strucknodamage
;/def -F -E"damagegag" -ag -t"* tickled * in the stomach." tickle
;/def -F -E"damagegag" -ag -t"* grazed *." graze
;/def -F -E"damagegag" -ag -mregexp -t" hit .+[^ \d times? for \d+ damage]\." hit
;/def -F -E"damagegag" -ag -t"* hit * hard." hithard
;/def -F -E"damagegag" -ag -t"* hit * very hard." hitveryhard
;/def -F -E"damagegag" -ag -t"* struck * a mighty blow." mightyblow
;/def -F -E"damagegag" -ag -t"* smashed * with a bone crushing sound." bonecrush
;/def -F -E"damagegag" -ag -t"* pulverized * with a powerful attack." pulverize
;/def -F -E"damagegag" -ag -t"* trounced * up and down." trounce
;/def -F -E"damagegag" -ag -t"* pummeled * into small fragments." pummel
;/def -F -E"damagegag" -ag -t"* massacred * into tiny fragments." massacre
;/def -F -E"damagegag" -ag -t"* utterly annihilated *." annihilate
;/def -F -E"damagegag" -ag -t"* completely devastated * with awesome force." devestate
;/def -F -E"damagegag" -ag -t"* destroyed *." destroy
;/def -F -E"damagegag" -ag -t"* absolutely massacred *." amassacre
;/def -F -E"damagegag" -ag -t"* thrashed * completely." thrash
;/def -F -E"damagegag" -ag -t"* demolished *." demolish
;/def -F -E"damagegag" -ag -t"* obliterated *." obliterate
;/def -F -E"damagegag" -ag -t"* nearly exterminated *." exterminate
;/def -F -E"damagegag" -ag -t"* eradicated *." eradicate



;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; STANDARD COMBAT TRIGGERS
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;def combatstarted = \
;	/if ("necromancer" =~ guild) \
;		/set dodevour 1 %;
;	Do Combat Stuff here By guild

/def -mregexp -t"^(?:>\s|)You attack (.+)\." bcryattack = /combatstarted
;/def -mregexp -t"^(?:>\s|)You jump in and assist (.+)." bcryassist = /combatstarted
;/def -t"*attacks you!*" bcryattacked = /combatstarted
/def -t"GEE, what are we fighting then?" bcrygee = /combatstarted
;/def -t"You are now hunted by*" hunted = /refresh
;/def -t"You are now hunting*" hunting = /refresh
;/def -F -t"Your legs run away with you*" wimpy = /refresh
;/def -Fp100 -mregexp -t"Your legs run away with you( [a-z]+|)\." wimpy = /refresh%;/if (wimpyannounce) !ptell I ran away like a little girl%P1 %;/endif%;/if ("knight" =~ guild & bouncing) /fleeaction%;/endif
;/def -p9999 -F -t"{Parisienne|Noel|Nigel} dealt the killing blow to *" pkillingblow = /if (!pcorpse & !ktrig) /preserve %;/endif%;/craftingmob
;/def -p9999 -F -t"Daftna dealt the killing blow to *" dkillingblow = /if (!pcorpse & kits) /embalm%;share gold %;/else bury corpse%;/endif%;/craftingmobf/def -p9998 -F -mregexp -t"(.+) dealt the killing blow to (.+)\." killingblow = /set lastkill=%P2%;/if (lastkill !~ "Daftna" & lastkill !~ "Parisienne" & lastkill !~ "Taliesin" & lastkill !~ "Delphine" & lastkill !~ "Ceta" & lastkill !~ "Noel" & lastkill !~ "Beorn" & lastkill !~ "Beorntest") /refresh%;/if (pcorpse) /preserve %;/endif%;/if (kbeep & !ore) /beep%;/endif%;/if (ascended) /ascendkb %;/endif%;/if (wrangleall) !get essence%;!wrangle%;/endif%;/set health=100%;/set enemy=0%;/set dogdefendwait=0%;/set nigeltanking=0%;/unset maskoffset%;/if (0 < strlen({damagetype})) !comtrance invoke %mainschool%;/unset damagetype%;/endif%;/killingblowaction%;/if (getall) !get all %;/endif%;/test ++slain%;/test ++slainarea%;/endif

;;
;  BEING LOGGING HOW COMBAT CAN BE INITIATED
;;
;You attack Baby Dragon.
;;
;
;;
;   BEGIN LOGGING DAMAGE BEING DONE TO THE USER  
;;;
;Slimy Smurf missed you.
;;
;/def -ag -t'^(?:> )?[A-Za-z\-\'\s]+ missed you\.$' combat_miss 
;;;
;
;;;
;Crafty Smurf struck, but did no damage to you.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ struck, but did no damage to you\.$' combat_nodamage 
;;;
;
;;;
;Clockwork Smurf grazed you.
;;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ grazed you\.' combat_14
;;;
;
;;;
;Clockwork Smurf destroyed you.
;;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ destroyed you\.' combat_13
;;;
;
;;;
;Rabid Wolf hit you.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ hit you\.$' combat_hit1
;;;
;
;;;
;Rabid Wolf hit you very hard.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ hit you very hard\.' combat_hit2
;;;
;
;;;
;Queen's Elite Guardswoman struck you a mighty blow.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ struck you a mighty blow\.' combat_hit3
;;;
;
;;;
;Queen's Elite Guardswoman smashed you with a bone crushing sound.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ smashed you with a bone crushing sound\.' combat_hit4
;;;
;
;;;
;Queen's Elite Guardswoman pulverized you with a powerful attack.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ pulverized you with a powerful attack\.' combat_hit5
;;;
;
;;;
;
;;;
;Sylvan Elf trounced you up and down.
;;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ trounced you up and down\.' combat_hit6
;;;
;
;;;
;Slimy Smurf absolutely massacred you.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ absolutely massacred you\.' combat_hit7
;;;
;
;;;
;Creepy Smurf utterly annihilated you.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ utterly annihilated you\.' combat_hit8
;;;
;
;;;
;Slimy Smurf completely devastated you with awesome force.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ completely devastated you with awesome force\.' combat_hit9
;;;
;
;;;
;MOB massacred you into tiny fragments.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+  massacred you into tiny fragments\.' combat_hit10
;;;
;
;;;
;Slimy Smurf demolished you.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ demolished you\.' combat_hit11
;;;
;
;;;
;Slimy Smurf thrashed you completely.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ thrashed you completely\.' combat_hit12
;;;
;
;;;
;Nightmare pummeled you into small fragments.
;;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ pummeled you into small fragments\.' combat_hit15
;;
;
;;
;Creepy Smurf massacred you into tiny fragments.
;;
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ massacred you into tiny fragments\.' combat_hit16
