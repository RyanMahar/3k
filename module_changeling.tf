;; module_changeling.tf
; Changeling Guild General Setup - 3Kingdoms - http://www.3k.org
; Ryan Mahar - ryan.mahar@gmail.com
; Version History:
; Last Modified: 20130610
;
;  V 0.2  - Initial Logging of Form Outputs     - 20130608
;  V 0.1  - Initial Logging of Guild Mud Output - 20130605
;
;
;; Ideas
;
;; Alter transmogrify periodically.
;
;;

;You have not yet set this forms appearance.
;Valid looks are:
;  L-1  vicious-looking              
;  L-13 cute
;  L-2  evil-looking                 
;  L-14 beautiful
;  L-3  menacing-looking              
;  L-15 sleepy-looking
;  L-4  sad-looking                   
;  L-16 scary-looking
;  L-5  happy-looking                 
;  L-17 mottled
;  L-6  furious-looking              
;  L-18 kinky-looking
;  L-7  creepy-looking                
;  L-19 attractive-looking
;  L-8  noble-looking                
;  L-20 lazy
;  L-9  sinister-looking              
;  L-21 hideous-looking
;  L-10 ugly                          
;  L-22 old
;  L-11 hungry-looking                
;  L-23 young
;  L-12 angry-looking
;;
;;
;;Valid sizes are:
;  S-1  tiny        
;  S-4  large       
;  S-7  massive     
;  S-10 fat
;  S-2  small       
;  S-5  huge        
;  S-8  giant
;  S-3  little      
;  S-6  enormous    
;  S-9  gargantuan
;Valid colours are:
;  C-1  red               
;  C-8  silver            
;  C-15 grey
;  C-2  blue              
;  C-9  bronze            
;  C-16 scarlet
;  C-3  green             
;  C-10 brown             
;  C-17 chromatic
;  C-4  yellow            
;  C-11 black             
;  C-18 polka-dot
;  C-5  purple            
;  C-12 white             
;  C-19 lilac
;  C-6  pink              
;  C-13 orange
;  C-7  gold              
;  C-14 translucent

;;
;; 
;
;; 
;; 
;
;; 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  Begin Periodic Guild Output 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;Your body ripples and shakes as energy flows into you.
;;
/def -ag -t'^(?:> )?Your body ripples and shakes as energy flows into you\.' greset
;;
;
;You bit Red Chinese Dragon's head clean off!
/def -ag -t'^(?:> )?You (bit|cleave) [A-Za-z\s\-\']+\'s head clean off!' kb_guild
;;
;--> You sense an approaching surge of chaotic energy <--
;;
;
;; 
;You concentrate on the scar tissue, and feel your cells start to shift. You
;will the damaged cells to reform, and the scar slowly disappears.
;You have no need of this power now.
;;
;
;;
;You feel more confident with your current form.
;;
;
;;
;Sensing danger, your instincts leap into action!
;;
/def -ag -t'^(?:> )?Sensing danger, your instincts leap into action!' inst_spam 
;;
;
;
;;;;;;  Begin Logging Open Guild Commands ;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "form"
;  Command Use:  Displays information about the users current form.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  
;<+>========================================================================<+>
; | Current Form  : Microraptor                  Form Group : Reptile        |
; | Familiarity   : 30                           Next Point :                |
; | Intimacy      : 30                           Next Point :                |
; |--------------------------------------------------------------------------|
; | Masked Name   : Zion                                                     |
; | Description   : A tiny old microraptor                                   |
; | Enter Message : A tiny old microraptor struts into the room              |
; | Exit Message  : A tiny old microraptor struts                            |
; | Disposition   : Extremely swift and agile but very frail                 |
;<+>========================================================================<+>
;
;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "skills"
;  Command Use:  Displays information about the users guild skill level and cost
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;<+>========================================================================<+>
; | Val  Skill                 Next Pt | Val  Skill                  Next Pt |
; |------------------------------------+-------------------------------------|
; |  50  Density                15.86% |  41  Morphogenesis           45.98% |
; |  46  Homeostasis            21.39% |  47  Resilience              28.51% |
; |  47  Mitosis                25.66% |                                     |
;<+>========================================================================<+>
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "forms"
;  Command Use:  Displays the forms known by the user and form familiarity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;<+>========================================================================<+>
; | Form                 Lvl   Next Pt | Form                  Lvl   Next Pt |
; |------------------------------------+-------------------------------------|
; | Anaconda               9+   40.76% | Skunk                  25    49.08% |
; | Asp Caterpillar       30+          | Slime                  13+   71.29% |
; | Crocodile             17+   86.60% | Spider Wasp             5+    2.02% |
; | Eagle                  6    30.89% | Tasmanian Devil        30+          |
; | Human                  3+    4.30% | Toad                   30+          |
; | Kitten                25+    4.74% | Turtle                 30+          |
; | Microraptor           30+          | Vampire Bat             2    20.00% |
; | Panda                 20    32.22% | Wandering              30+          |
; | Sabre Tooth Tiger      8+   88.91% | Wolf                    4+   21.56% |
;<+>======================== Available Points: 123 =========================<+>
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "confighp"
;  Command Use:  Displays configuration of users hpbar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;Your current HP string is:
;HP:$CHP/$MHP/$CSP ST:$STA PP:$PPM $BPL[$SKP] E[$MON] $CFX $STS
;Which looks like:
;HP:2114/2114/3 ST:30.45% PP:34.96% 47[16.18%] E[8%] 2/58% B DHV
;You may use the following tokens for substitution:
;  $BPL - # of Bioplasts    $FRM - Current Form      $SKN - Config Skill
;  $CFX - Chaos Flux        $MHP - Maximum HP        $SKP - Config Skill %
;  $CHP - Current HP        $MON - Enemy Status      $STA - Current Stam
;  $CRT - Carriage Return   $MSP - Maximum SP        $STS - Status String
;  $CSP - Current SP        $PFM - Perform Cmd       $COH - Cohesion
;  $FAM - Familiarity       $PPM - Current Proto
;Your configured skill is Density.
;Use "confighp reset #" to use one of the following standard HP bars:
;1: HP[2114/2114] SP[3/54] ST[30.45%] PP[34.96%] CF[2/58%] FF[_MAX_] E[8%] B DHV
;2: HP:2114/2114 SP:3/54 ST:30.45% PP:34.96% CF:2/58% FF:_MAX_ E:8% B DHV
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "gs"
;  Command Use:  Displays users lifetime guild information 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;<+>========================================================================<+>
; |                   Zion the Changeling - Complexity 231                   |
; |--------------------------------------------------------------------------|
; | Form        : Kitten                 Form Points : 123                   |
; | Intimacy    : 25                     Next Point  : 5.26%                 |
; | Stamina     : 96.31%                 Perform     :                       |
; | Protoplasm  : 100.00%                Instinct    : morph (2000 HP)       |
; | Chaos Flux  : 3/66%                  Instinct2   : consume bioplast (5%  |
; | Clone       :                                                            |
; |--------------------------------------------------------------------------|
; | Best Kill   : Huge Praying Mantis (interdimensional)   Class: 11,883,950 |
; | Arch Foe    : Clumsy Smurf                             Class:    493,191 |
; | Total Kills : 193,997                                                    |
; |--------------------------------------------------------------------------|
; | You have ingested 17,448,102 gold coins.                                 |
; |                                                                          |
; | You joined the guild on Thu Apr 29 22:47:19 2010, and have been active   |
; | for 195 days 15 hours 8 minutes 48 seconds. (17.27% of the time)         |
; |                                                                          |
; | You have fought for 132 days 4 hours 35 minutes 13 seconds, which is     |
; | 67.57% of your time in the guild.                                        |
;<+>========================================================================<+>
;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "lstats" 
;  Command Use:  Displays the users login statistics guild information
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;<+>=========================== Login Statistics ===========================<+>
; | Start     : Wed Jun 05 11:30:31 2013                                     |
; | Time      :   0D 17H 56M  [ 62.93%]                                      |
; | In Combat :   0D 14H 42M  [ 82.01%]                                      |
; |--------------------------------------------------------------------------|
; | Bioplasts : 387                          Bioplasts Created :         502 |
; | Corpses   : 0                            Relinquishes Used :         221 |
; | Fluxes    : 100                             Coins Ingested :       7,290 |
; |--------------------------------------------------------------------------|
; | Rounds    : 26,348                        Average Per Kill :       44.96 |
; | Kills     : 586                     Average Class Per Kill :     378,545 |
; | Delta Exp : -68,731,408               Average Exp Per Hour :  -3,831,656 |
; | Best Kill : Southron Wind                            Class :   2,893,395 |
; | Last Kill : A very large rat                         Class :     746,725 |
;<+>========================================================================<+>
;;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "lstats2"
;  Command Use:  Displays the users second login statistics guild information
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;<+>=========================== Login Statistics2 ==========================<+>
; |     #    Victim                                            Class         |
; |     ---  ------------------------------------------------- ----------    |
; |      1:  A very large rat................................. ....746725    |
; |      2:  A large furry spider............................. ....735725    |
; |      3:  A large furry spider............................. ....744630    |
; |      4:  A very large rat................................. ....746710    |
; |      5:  A very large rat................................. ....725700    |
; |      6:  A very large rat................................. ....742540    |
; |      7:  A large furry spider............................. ....734680    |
; |      8:  Creepy Smurf..................................... ....754575    |
; |      9:  Tracker Smurf.................................... ...1414095    |
; |     10:  Clumsy Smurf..................................... ....698160    |
; |--------------------------------------------------------------------------|
; | Form                  Emote                                              |
; | --------------------- -------------------------------------------------- |
; | Kitten:               You *TEAR* into Red Chinese Dragon, leaving trails |
; |                       of blood and flesh in the air!!                    |
; | Microraptor:          You *TEAR* into Rat, leaving trails of blood and   |
; |                       flesh in the air!!                                 |
; | Slime:                You <SMASH> a tentacle into Lumbering Ox with      |
; |                       DEVASTATING force, sending him reeling!!           |
; | Tasmanian devil:      You *TEAR* into Vanity Smurf, leaving trails of    |
; |                       blood and flesh in the air!!                       |
; | Toad:                 You wrap your tongue around Shansabyks head and    |
; |                       squeeze until its skull << CRACKS >> open!!!       |
;<+>========================================================================<+>
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "absorb"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;There is no corpse to absorb!
;;
/def -ag -t'^(?:> )?There is no corpse to absorb!' absorb_fail
;;
;
;;
;You let your body flow around the corpse, feeling refreshed as you absorb
;it into your being!
;;
/def -ag -t'^(?:> )?You let your body flow around the corpse, feeling refreshed as you absorb' absorb_suc
/def -ag -t'^(?:> )?it into your being!$' absorb_suc2
;;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "adrenalize"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "augment"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "bioextract"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "bioluminesce"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;Bioluminesce will be activated when relinquish ends.
;
;You resume your bioluminescence.
;;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "consume"
;  Command Use: Uses a bioplast to restore Protoplasm and Stamina
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;
;You consume the translucent bioplast and immediately feel a surge of energy throughout your body!
;
;You have no need to consume this now.
;;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "clone"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;
;You isolate a small sphere of protoplasm, hardening the outside then
;separating it to form an egg.  Inside, your clone is free to grow and
;develop in relative safety.
;;
;
;;
; Clone active in users inventory
;;
;1 A small egg.
;;
;
;;
; Clone active in users inventory - Kept
;;
;1 *A small egg.
;;
;
;
;;
;
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "digest"
;  Command Use:  Disposes of an item from the game
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;You digest the cog and feel a little revitalised.
;;
/def -ag -t'^(?:> )You digest the [A-Za-z\s]+ and feel a little revitalised\.' digest_suc
;;
;
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "dissipate"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "flow"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;You feel a strange, chaotic force take control of your actions!
/def -ag -t'^(?> )?You feel a strange, chaotic force take control of your actions!' flow_start
;;
;
;;
;An unknown force takes control of your actions!
;;
/def -ag -t'^(?:> )?An unknown force takes control of your actions!' flow_action
;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "fuse"
;  Command Use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "hyperproliferate"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;
;;
;You resume accelerating your natural regeneration.
;;
/def -ag -t'^(?:> )?You resume accelerating your natural regeneration\.' hyper_resume
;;
;
;;
;You begin to concentrate on accelerating your natural regeneration process.
;;
/def -ag -t'^(?:> )You begin to concentrate on accelerating your natural regeneration process\.' hyper_start
;;
;
;;
;Hyperproliferate will be activated when relinquish ends.
;;
/def -ag -t'^(?:> )?Hyperproliferate will be activated when relinquish ends\.' hyper_rel_yes
;;
;
;;
;Hyperproliferate will not activate when relinquish ends.
;;
/def -ag -t'^(?:> )?Hyperproliferate will not activate when relinquish ends\.' hyper_rel_no

;;
;You are too mentally drained to continue accelerating your regeneration!
;;
/def -ag -t'^(?:> )?You are too mentally drained to continue accelerating your regeneration!' hyper_drained
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "ingest"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;
;How much gold do you wish to ingest?
;;
;You engulf 1 coins with protoplasm and a familiar tingling sensation creeps
;throughout your body as you ingest them.
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "instinct"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;If your HP ever falls below 2000 you will instinctively "morph".
;;
;Format is: instinct <num_hp> <action>
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "instinct2"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;; OUTPUTS ARE IDENTICAL TO INSTINCT
;
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "intrinsics"
;  Command use: Displays the available guild skills and costs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;
;<+>========================================================================<+>
; | Intrinsic            De Ho Mi Mo Re | Intrinsic           De Ho Mi Mo Re |
; |-------------------------------------+------------------------------------|
; | Absorb                1  1  1  1  1 | Link                 1 18  1  1  1 |
; | Adrenalize            1  7  1  5  1 | Liquefy              1  5  1  6  1 |
; | Augment              15 18  1 18  1 | Lore                 1  1  1  1  1 |
; | Bioextract            1  1  1  1  1 | Mimic                1  8  1  9  1 |
; | Bioluminesce          1  3  1  3  1 | Morph                1  1  1  1  1 |
; | Clone                 1  1 18 18  1 | Perform              1  1  1  1  1 |
; | Digest                1  1  1  1  2 | Perseverance         1 13  1  1 13 |
; | Dissipate             1 15  1  1 15 | Relinquish          10 10 10 10 10 |
; | Flow                  1  3  1  1  1 | Revivify             1  1 11  1 11 |
; | Fuse                  1 14  1 14  1 | Secrete             15 14 15  1  1 |
; | Hyperproliferate      1  6  7  1  1 | Sense                1 30  1  1  1 |
; | Ingest                1  1  1  1  1 | Thermotaxis          1 29  1 26  1 |
; | Instinct              1  1  1  1  1 | Transmogrify         1  1  1 12  1 |
; | Instinct2             1 15  1 15  1 |                                    |
;<+>========================================================================<+>
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "link"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;You are not currently linked with anyone.
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "liquefy"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "lore"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;What did you want to lore?
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "mimic"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "morph"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;Your wounds close as you reform yourself.
;;
/def -ag -t'^Your wounds close as you reform yourself\.$' morph_reform
;;
;
;;
;You morph into a sabre tooth tiger!
;;
;
;;
;You have no need to reform as you are in perfect health!
;;
/def -ag -t'^You have no need to reform as you are in perfect health!$' morph_fail
;;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "perform"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;You are not set to perform any actions during combat.
;;
;You will no longer perform actions during combat.
;;
;You will now perform "on" every combat round.
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "perseverance"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;You focus on retaining your shape.
;;
/def -ag -t'^(?:> )?You focus on retaining your shape\.' persev_on = /set persevering on
;;
;
;;
;You will no longer persevere.
;;
/def -ag -t'^(?:> )?You will no longer persevere\.' persev_off = /set persevering off
;;
;
;;
;You are currently persevering.
;;
/def -ag -t'^(?:> )?You are currently persevering\.' persev_already_on = /set persevering on
;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "relinquish"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;You have already relinquished control to Chaos, to do so further would
;surely result in your death!
;;
/def -ag -t'^You have already relinquished control to Chaos, to do so further would' rel_on4
/def -ag -t'^surely result in your death!' rel_on5
;;
;
;;
;You relinquish yourself to Chaos, and immediately feel the unpredictable
;and powerful forces surge through you, threatening to sweep you away in an
;instant!
;;
;
;;
/def -ag -t'^(?:> )?You relinquish yourself to Chaos, and immediately feel the unpredictable' rel_on1
/def -ag -t'^(?:> )?and powerful forces surge through you, threatening to sweep you away in an' rel_on2
/def -ag -t'^(?:> )?instant!$' rel_on3
;;
;
;;
;Energy pours into you, rejuvenating lost stamina and protoplasm!
;;
/def -ag -t'^(?:> )?Energy pours into you, rejuvenating lost stamina and protoplasm!' rel_1
;;
;
;;
;The chaotic energies revitalize you!
;;
/def -ag -t'^(?:> )?The chaotic energies revitalize you!' relinquish_2
;;
;
;;
;The chaotic forces seeking control of you begin to wane, your control
;returning as the energies cease to course chaotically through you.
;;
/def -ag -t'^(?:> )?The chaotic forces seeking control of you begin to wane, your control' rel_off1
/def -ag -t'^returning as the energies cease to course chaotically through you\.' rel_off2
;;
;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "revivify"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;You concentrate on the scar tissue, and feel your cells start to shift. You
;will the damaged cells to reform, and the scar slowly disappears.
;You have no need of this power now.
;;
;
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "secrete"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;You may not secrete cytoplasm in your current state.
;;
/def -ag -t'^You may not secrete cytoplasm in your current state\.$' secrete_fail = \
  /echo Create a SECRETE_FAIL method.
;;
;
;;
;You create a small hole in your outer body and slowly secrete your precious
;cytoplasm into a pool on the ground.
;;
;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "sense"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;You expand your senses, using your unique affinity to chaos to sense the
;present effects of its unpredictable forces.  After a few moments you are
;able to determine the following about them:
; --> They are affecting the environment slightly beneficially.
; --> They are affecting your efficiency in extraordinarily beneficial ways.
; --> They are biased towards speed and agility.
; --> The next shift is likely to occur in the distant future.
;
;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command: "thermotaxis"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Command: "transmogrify"
;  Command use:  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;               BEGIN LOGGING OF FORM OUTPUTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;
;
;;
;Blood shoots from vital arteries as you dig your left claw deep into Faerie
/def -ag -t'^Blood shoots from vital arteries as you dig your left claw deep into ' at_1
;;
;
;;
;You bite Faerie Lizard so hard that blood spatters around the room!!!
;;
/def -ag -t'^You bite [A-Za-z\s]+ so hard that blood spatters around the room!!!' at_2
;;
;
;;
;You *TEAR* into Faerie Lizard, leaving trails of blood and flesh in the air!!
;;
/def -ag -t'^You *TEAR* into [A-Za-z\s]+ , leaving trails of blood and flesh in the air!!' at_3
;;
;
;;
;You bite limbs off Faerie Lizard!!
;;
/def -ag -t'^You bite limbs off [A-Za-z\s]+!!' at_4
;;
;
;;
;You shred Faerie Lizard like she was made of butter!
;;
/def -ag -t'^You shred [A-Za-z\s]+ like she was made of butter!' at_5
;;
;
;;
;You tear the HELL OUT OF Rabid Wolf with your razor sharp fangs!!!
;;
;
;;
/def -ag -t'^You tear the HELL OUT OF [A-Za-z\s]+ with your razor sharp fangs!!!' at_6


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;               BEGIN LOGGING OF FORM DODGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;
;The attack bounces off your thick hairy hide!
;;
/def -ag -t'^The attack bounces off your thick hairy hide!' dodge_1
;;
;You leap out of the way of the attack.
;;
/def -ag -t'^You leap out of the way of the attack\.$' dodge_2 
;;
;
;;
;You ooze out of the way of the attack.
;;
/def -ag -t'^You ooze out of the way of the attack\.$' dodge_3
;;
;
;;
;You flap out of the way of the attack.
;;
/def -ag -t'You flap out of the way of the attack\.' dodge_4
;;
;
;;
;You avoid some of the attack by hopping sideways.
;;
/def -ag -t'^You avoid some of the attack by hopping sideways\.$' dodge_5
;;
;
;;
;You hop out of the way of the attack!
;;
/def -ag -t'^(?:> )?You hop out of the way of the attack!' dodge_6
;;
;
;;
;The attack bounces off your hard shell!
;;
/def -ag -t'^The attack bounces off your hard shell!' dodge_7
;;
;
;;
;You duck out of the way of the attack!
;;
/def -ag -t'^(?:> )?You duck out of the way of the attack!' dodge_8
;;
;
;;
;You barely manage to leap out of the way.
;;
/def -ag -t'^You barely manage to leap out of the way\.' dodge_9
;;
;
;;
;You crawl out of the way of the attack.
;;
/def -ag -t'^You crawl out of the way of the attack\.' dodge_10
;;
;
;;
;The attack knocks you about inside the shell!
;;
/def -ag -t'The attack knocks you about inside the shell!' dodge_11
;;
;
;;
;You slither out of the way of the attack.
;;
/def -ag -t'^(?:> )?You slither out of the way of the attack\.' dodge_12
;;
;
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;               BEGIN LOGGING OF FORM DAMAGE EMOTES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;; CATCHALL second line gag
/def -ag -t'^[A-Z-a-z]+!$' second_line_gag
;;
;Blood shoots from vital arteries as you dig your right claw deep into Azreal!
;;
/def -ag -t'Blood shoots from vital arteries as you dig your right claw deep into [A-Za-z]+' dmg_1
;;
;
;;
;You shred Azreal like she was made of butter!  
;;
/def -ag -t'You shred [A-Za-z\'\s]+ like (s?he|it) was made of butter!' dmg_2
;;
;
;;
;You hear bones splinter as you bite into Azreal!!  
;;
/def -ag -t'^You hear bones splinter as you bite into [A-Za-z\'\s]+!!' dmg_3
;;
;
;;
;Your bite absolutely <SHREDS> Azreal!!!
;;
/def -ag -t'^Your bite absolutely \<SHREDS\> [A-Za-z\'\s]+!!!' dmg_4
;;
;
;;
;You *TEAR* into Azreal, leaving trails of blood and flesh in the air!!
;;
/def -ag -t'^You \*TEAR\* into [A-Za-z\'\s]+, leaving trails of blood and flesh in the air!!' dmg_5
;;
;
;;
;You rake your right claw through Azreal, tearing muscle and sinew as you go!
;;
/def -ag -t'^You rake your (left|right) claw through [A-Za-z\'\s]+, tearing muscle and sinew' dmg_6
;;
;
;;
;Your bite smashes bones as you gnaw down on Azreal's body!!
;;
/def -ag -t'^Your bite smashes bones as you gnaw down on [A-Za-z\'\s]+\'s body!!' dmg_7
;;
;
;;
;You tear limbs off Azreal!
;;
/def -ag -t'^You tear limbs off [A-Za-z\'\s]+!' dmg_8
;;
;
;;
;You bite right into Brainy Smurf's body and reposition vital organs!!!
;;
/def -ag -t'^You bite right into [A-Za-z\'\s]+\'s body and reposition vital organs!!!' dmg_9
;;
;
;;
;You tear pounds of flesh off Brainy Smurf.
;;
/def -ag -t'^You tear pounds of flesh off [A-Za-z\'\s]+\.' dmg_10
;;
;
;;
;You nonchalantly bite a vital appendage off Smelly Smurf!
;;
/def -ag -t'^You nonchalantly bite a vital appendage off [A-Za-z\'\s]+!' dmg_11
;;
;Your bite rips a hole through Crafty Smurf!
;;
/def -ag -t'Your bite rips a hole through [A-Za-z\s]+\!' dmg_12
;;
;
;;
;You bite a massive chunk of flesh off of Roach's body!
;;
/def -ag -t'^(?:> )?You bite a massive chunk of flesh off of [A-Za-z\s]+\'s body!' dmg_13
;;
;
;;
;You crunch up Red Butterfly like a bug!!
;;
/def -ag -t'^You crunch up [A-Za-z\s\']+ like a bug!!' dmg_14
;;
;
;;
;S is *CRUSHED* by your tongue as you grab it like a fly!!
;;
/def -ag -t'^(?:> )?[A-Za-z/s]+ is \*CRUSHED\* by your tongue as you grab it like a fly!!' dmg_15
;;
;
;;
;You slap S into a bloody mess with your tongue!
;;
/def -ag -t'^(?:> )You slap [A-Za-z/s]+ into a bloody mess with your tongue!' dmg_16
;;
;
;;
;With perfect aim you ** RIP ** S's eye out with your tongue!
;;
/def -ag -t'^(?:> )?With perfect aim you \*\* RIP \*\* [A-Za-z\s]+\'s eye out with your tongue!' dmg_17
;;
;
;;
;You lick S's scalp off << EXPOSING >> bone !!!
;;
/def -ag -t'^(?:> )?You lick [A-Za-z\s]+\'s scalp off \<\< EXPOSING \>\> bone !!!' dmg_18
;;
;
;;
;You wrap your tongue around S's body and <<< SQUEEZE >>> him into an hour-glass.
;;
/def -ag -t'^(?:> )?You wrap your tongue around [A-Za-z\s]+\'s body and \<\<\< SQUEEZE \>\>\> him into an hour\-glass\.' dmg_19
;;
;
;;
;You hear a sick ** GURGLE *** from Y as your tongue hits it in the throat!
;;
/def -ag -t'^(?:> )?You hear a sick \*\* GURGLE \*\*\* from [A-Za-z\s]+ as your tongue hits it in the throat!' dmg_20
;;
;
;;
;Jokey Smurf is *CRUSHED* by your tongue as you grab him like a fly!!
;;
/def -ag -t'^(?:> )?[A-Za-z\s]+ is \*CRUSHED\* by your tongue as you grab him like a fly!!' dmg_21
;;
;
;;
;You tear gaping holes in Spider with your teeth!
;;
/def -ag -t'^(?:> )?You tear gaping holes in [A-Za-z\s]+ with your teeth!' dmg_22
;;
;
;;
;You wrap a tentacle around Pipe Moron, attempting to crush the life out of him!
;;
/def -ag -t'^You wrap a tentacle around [A-Za-z\'\-\s]+\, attempting to crush the life out of him!' dmg_23
;;
;
;;
;You knock Pipe Moron's organs into unnatural positions with a vicious slap!
;;
/def -ag -t'^You knock [A-Za-z\'\s\-]+\'s organs into unnatural positions with a vicious slap!' dmg_24
;;
;
;;
;You knock a bone out of Pipe Moron's body with a horrendous <CRUNCH>!
;;
/def -ag -t'^You knock a bone out of [A-Za-z\'\-\s]+\'s body with a horrendous <CRUNCH>!' dmg_25
;;
;
;;
;You leave a large dent in Pipe Moron's body with a vicious blow!
;;
/def -ag -t'^You leave a large dent in [A-Za-z\'\-\s]+\'s body with a vicious blow!' dmg_26
;;
;
;;
;F cringes in pain as you land a solid sting on it!
;;
/def -ag -t'^[A-Za-z\'\s\-]+ cringes in pain as you land a solid sting on it!' dmg_27
;;
;
;;
;F SHUDDERS and WRITHES in agony as you sting it viciously!!!
;;
/def -ag -t'^[A-Za-z\'\s\-]+ SHUDDERS and WRITHES in agony as you sting it viciously!!!' dmg_28
;;
;
;;
;F SPASMS violently as you sting it!!
/def -ag -t'^[A-Za-z\'\s\-]+ SPASMS violently as you sting it!!' dmg_29
;;
;
;;
;F's body goes limp for a moment as you sting it!
/def -ag -t'^[A-Za-z\s\-\']+\'s body goes limp for a moment as you sting it!' dmg_30
;;
;
;;
;B's eyes bug out as you sting it right where it hurts!
;;
/def -ag -t'^[A-Za-z\'\-\s]+\'s eyes bug out as you sting it right where it hurts!' dmg_31
;;
;
;;
;You smash down on a joint and swat an appendage off of Jade Phoenix's body!!
;;
/def -ag -t'^You smash down on a joint and swat an appendage off of [A-Za-z\s\-\']+\'s body!!' dmg_32

