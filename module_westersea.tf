;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 Westersea Aliases                   ;;
;;                                                     ;;
;;           *All aliases start from Tinny             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Do all missions
/alias wsdoall wspickherb%;wspickmoss%;wspickroot%;wspickore%;wsgatherroot

;;Medical Herbs Mission
;Pick herbs
/alias wspickherb /run 3et%;pick%;w%;pick%;w%;pick%;nw%;pick%;e%;pick%;\
	e%;pick%;e%;pick%;e%;pick%;e%;pick%;n%;pick%;w%;pick%;w%;pick%;w%;\
	pick%;w%;pick%;w%;pick%;w%;pick%;s%;pick%;/run e2v3w

;;Medical Essence Mission
;Pick moss
/alias wspickmoss /run 9e%;jump wagon%;/run 3v3w%;pick moss%;nw%;pick moss%;\
	w%;pick moss%;w%;pick moss%;sw%;pick moss%;e%;pick moss%;e%;pick moss%;\
	e%;pick moss%;e%;sw%;pick moss%;w%;pick moss%;w%;pick moss%;/run t5e4q9w

;Pick root
/alias wspickroot /run 9ete%;search branch%;n%;push branches%;/run q3wqnq3nt6et4evz%;\
	pick%;w%;pick%;w%;pick%;w%;pick%;nw%;pick%;e%;pick%;e%;pick%;e%;pick%;\
	/run 3wv3etq4wz6wz3svsv3e2vswz9w

;Ice wolf tail requires killing wolves, no alias for this.

;;Magical Materials Mission
;Gather root
/alias wsgatherroot /run 8e%;gather%;e%;gather%;ne%;gather%;e%;gather%;e%;gather%;\
	se%;\gather%;nw%;ne%;gather%;e%;gather%;/run wzw%;search branch%;n%;\
	gather%;n%;gather%;s%;push branches%;gather%;nw%;gather%;w%;gather%;w%;\
	gather%;w%;gather%;nw%;gather%;/run v3e2vswz9w

;Pick ore
/alias wspickore /run 9ete%;search branch%;n%;push branches%;/run q3wqn%;pick%;nw%;pick%;\
	n%;pick%;n%;pick%;n%;pick%;ne%;pick%;e%;pick%;e%;pick%;ne%;pick%;n%;pick%;\
	e%;pick%;e%;pick%;s%;pick%;w%;pick%;w%;s%;pick%;e%;pick%;e%;pick%;e%;pick%;\
	sw%;pick%;w%;pick%;w%;pick%;/run 2e2t%;pick%;e%;pick%;e%;pick%;e%;pick%;e%;\
	pick%;se%;pick%;e%;pick%;/run wq4wz6wz3svsv3e2vswz9w

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Fishing                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/set fish_dir s
/def -t'You have nothing to bait the rod with!' fish_no_bait = !return%;!e%;!e%;!n%;!n%;!buy 5%;!s%;!s%;!w%;!w%;!fish %fish_dir%;!bait rod%;!fish
/def -t'You hear a loud snap as your line breaks!' fish_line_break = !thread rod%;!bait rod%;!fish
/def -t'You have nothing to thread the rod with!' fish_no_line = !return%;!e%;!e%;!n%;!n%;!buy 2%;!s%;!s%;!w%;!w%;!fish %fish_dir%;!thread rod%;!fish
/def -t'You successfully manage to retrieve your catch!' fish_caught = !tga%;!fish
/def -t'You fail to retrieve your catch!' fish_fail = !fish
/def -t'As no fish appear to be interested in your line, you pull it back up.' fish_no_bite = !bait rod%;!fish
/def -t'Your fishing rod bends violently and cracks in two!' fish_rod_break = !return%;!e%;!e%;!n%;!n%;!buy 6%;!s%;!s%;!w%;!w%;!fish %fish_dir%;!thread rod%;!bait rod%;!fish
/def -t'You\'re too tired to do that.' fish_no_end = !catch%;!fish
/def -t'You can\'t fish without a line!' fish_thread = !thread rod%;!bait rod%;!fish
/def -t'With a loud ~\'thwang~\', your line snaps. Perhaps you should pay more' fish_line_break = /fish_no_line
/def -t'You notice that your bait is gone!' fish_bait_gone = !bait rod%;!fish
/def -t'Even though you do everything right' fish_escape = !fish
/def -t'Suddenly something grabs hold of your line!!' fish_bite = !reel

/def -t'End:(\d+) E Req:(\d+|[LHM]) Dis:(\d+|[LHM])(?:cm)? Dir:([LRC+]+) Ten:(\d+|[LMH]) Line:(\d+|[LMH])+\%? Catch:(\d+|[LMH])+\%?' fish_prompt = \
	/set fend %P1 							%;\
	/set freq %P2							%;\
		/if (freq =~ ("L"|"H"|"M")) /set freq 80 %; /endif	%;\
	/set fdist %P3							%;\
		/if (fdist =~ "H") /set fdist 200 %; /endif		%;\
	/set fdir %P4							%;\
	/set ften %P5							%;\
	/set fline %P6							%;\
	/set fcatch %P7							%;\
/if (fend < freq) !catch %; /endif					%;\
/if ((ften > 30)|(ften=~"H")) !slack %; /endif				%;\
/if (fcatch > 40) !catch %; /endif					%;\
/if (fdist > 100) !reel	%;						%;\
	/elseif (fdir =/ "R*") !pull left				%;\
	/elseif (fdir =/ "L*") !pull right				%;\
	/elseif (fdist > 0) !reel %; /endif				%;\
/if ((freq + 40 > fend) & (fcatch > 15)) !catch %; /endif
/def -ag -t'You can\'t do another action yet.' fish_gag







;; Failed attempt at decoding Etah's script
;/def -t'Suddenly something grabs hold of your line!!' fish_bite = !reel
;
;/def -t'End:(\d+) E Req:(\d+|[LHM]) Dis:([LHM]|\d+)(?:cm)? Dir:([LRC+]+) Ten:([LMH]|\d+) Line:([LMH]|\d+)+\%? Catch:([LMH]|\d+)+\%?' fish_prompt = \
;	/set fend {P1} 							%;\
;	/set freq {P2}							%;\
;		/if ({P2} =~ ("L"|"H"|"M")) /set freq 80 %; /endif	%;\
;	/set fdist {P3}							%;\
;		/if ({P3} =~ "H") /set fdist 200 %; /endif		%;\
;	/set fdir {P4}							%;\
;	/set ften {P5}							%;\
;	/set fline {P6}							%;\
;	/set fcatch {P7}						%;\
;/if ((freq+40 > fend) & (fcatch > 15) !catch %; /endif			
;/if (faction = 0) \
;	/if (fend < freq) /beep %; wfish %; /endif			%;\
;	/if (ften > 50) slack %; /exit %; /endif			%;\
;	/if 
