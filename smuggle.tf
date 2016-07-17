;;; sm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; shows what is in smuggle
/def sm = /CmdParse smuggle/hp

;;; smc = Smuggle Corpse ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; /smc [start] [count]
; /smc
;     smuggle corpse
;
; /smc 4
;    smuggle corpse 4
;
; /smc 5 3
;    smuggle corpse 5
;    smuggle corpse 5
;    smuggle corpse 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/def smc = \
    /let start=%{1}%; \
    /let count=%{2}%; \
    /if (start =~ "") \
        /send smuggle corpse%; \
    /elseif ((start != "") & (count =~ "")) \
        /send smuggle corpse $[start]%; \
             /elseif ((start != "") & (count != "")) \
        /let i=0%; \
        /while (++i <= count) \
            /send smuggle corpse $[start]%; \
        /done%; \
    /endif%; \
    /send hp

;;; smrc = Smuggle Remove Corpse ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; /smrc [start] [count]
; /smrc
;     smuggle remove corpse
;
; /smrc 4
;    smuggle remove corpse 4
;
; /smrc 5 3
;    smuggle remove corpse 5
;    smuggle remove corpse 5
;    smuggle remove corpse 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/def smrc = \
    /let start=%{1}%; \
    /let count=%{2}%; \
    /if (start =~ "") \
        /send smuggle remove corpse%; \
    /elseif ((start != "") & (count =~ "")) \
        /send smuggle remove corpse $[start]%; \
    /elseif ((start != "") & (count != "")) \
        /let i=0%; \
        /while (++i <= count) \
            /send smuggle remove corpse $[start]%; \
        /done%; \
    /endif%; \
    /send hp

;;; smra ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fills inventory with smuggled corpes
/def smra = /CmdParse smuggle remove all/hp