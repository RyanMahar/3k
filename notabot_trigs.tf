;Notabot triggers

;;
;HP[878(124)/878] SP[118/501] NP[406/460|34c] E[Queen's Elite ~:59%]
;


;/load numbers.tf
;/load directions.tf
;/load module_dog.tf
;/load gag.tf
/def bot = /eval /boton%;/stepping %{1}%;/key_f8

;;;
;HANDLE CLEARING COFFIN
;;
/alias dp /eval qtrance keep all/unwrap all%;qtrance preserve remains>35%;qtrance get all/give all to bayen/get all/give all to bayen%; qtrance smuggle corpse>20%;qtrance get all/keep all/wrap all/pant%;
;;;

;;;
;COMBAT HAS BEGUN
;; 12/21/13 -- removed duto to fam auto vaf
;/def -t'^You attack' do_attack = /eval call%;/repeat -00:00:03 1 rabies%;
;;;

;;;
;GAG THIS TEXT: Your link to the guild tells you:
;;
/def -ag -t'Your link to the guild tells you:' gagfornow
;;;

;;;
;GAG THIS TEXT: I'm already here for you mistress.
;; 12/21/13 -- removed duto to fam auto vaf
;/def -ag -t'\s\sI\'m already here for you mistress\.' familiar_already_here
;;;

;;;
/def -ag -t'\/\/\/The magical strands sparkle from your body\.' protection_dropped = protection%;
;;  NEW CAPTURE TEXT NEEDED for MAX OMEGA

;///The magical strands sparkle from your body.

;You reach into your animal soul and fly into a fury!
;/def -t'You reach into your animal soul and fly into a fury\!' do_fury = roar%;

;The animal fury fades from your soul.
;/def -t'The animal fury fades from your soul\.' stop_fury = sigh%;

;;;
;GAG THIS TEXT: 0 attacks Notabot's adversary!
;;

;;;

;;;
;GAG THIS TEXT: 0 attacks Notabot's foe!
;;

;;;

;;;
;GAG THIS TEXT: > 0 the 0 moves away.
;;

;;;
;GAG THIS TEXT: 
;*Swordsman's Armband
/def -ag -t'\*Swordsman\'s Armband' dogagprof_swordsman
; *Assassin's Mark
/def -ag -t'\*Assassin\'s Mark' dogagprof_assassin
; *A hand in the game of Euchre
/def -ag -t'\*A hand in the game of Euchre' dogag_euchre
; *Worn leather book
/def -ag -t'\*Worn leather book' dogag_wornbook
; *A ring of house keys
/def -ag -t'\*A ring of house keys' dogag_keys
; *A Crafter's Satchel
/def -ag -t'\*A Crafter\'s Satchel' dogag_satchel
; *An auction line
/def -ag -t'\*An auction line' dogag_auctionline
;*Magic: The Gathering Chatline
/def -ag -t'\*Magic\: The Gathering Chatline' dogag_mtgchatline
; *Tactician's Manual
/def -ag -t'\*Tactician\'s Manual' dogag_tactician
; *A magician\'s Top Hat
/def -ag -t'\*A magician\'s Top Hat' dogag_magician
;;;
;follow zanadu
;;;
;/def -t'Zanadu arrives' dofollow_zanadu = follow zanadu%;
;;
;;
;;;
;Get corpses for zanadu
/def -t'Zanadu shoots you in the head' dopres_for_zanadu = /rp 50 pr%;
/def -t'\/\/\/The protective spirits break away from your body and fade away\.' do_protection_again = prot%;
;/def -t'You throw a pinch of mandrake' do_rabies_zan = rr%;

;/def -t'^The animal fury fades from your soul\.' dofury = fury%;

