;;;CmdParse = Command Parser with Repeat ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT USE FOR COMMANDS WITH %* You can use $[] however
;
; usuage:
;
;/CmdParse [-s"<CmdSeperator>"][-n"<NumSeperator>] \ 
;[n<NumSeperator>]<cmd><CmdSeperator>[n<NumSeperator>]<cmd><CmdSeperator>....
;    <CmdSeperator> defaults to "/"
;    <NumSeperator> defaults to "-"
;    and <cmd> is any string
;
; Examples:
;    /CmdParse 21-n/3-ne/s/enter
;        will do n 21 times then ne 3 times then s then enter
;
;    /CmdParse #give corpse/absorb
;        will do #give corpse then absorb
;
;    /CmdParse -s"~" qtrance #give corpse/absorb~woo
;        will do qtrance #give corpse/absorb then the woo soul
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/def CmdParse = \
    /let opt_s=/%; \
    /let opt_n=-%; \
    /if (!getopts("s:n:")) /return 0%; /endif %; \
    /let TotalLine=%{*}%; \
    /let Start=0%; \
    /let SepCmd=0%; \
    /while (SepCmd > -1) \
        /let SepCmd=$[strchr(TotalLine,opt_s,Start)]%; \
        /if (SepCmd > 0) \
            /let ThisCmd=$[substr(TotalLine,Start,SepCmd)]%; \
        /else \
            /let ThisCmd=$[TotalLine]%; \
        /endif%; \
        /let TotalLine=$[substr(TotalLine,SepCmd+1)]%; \
        /let SepNum=$[strchr(ThisCmd,opt_n)]%; \
        /if (SepNum > 0) \
            /let ThisRpt=$[0 + (substr(ThisCmd,0))]%; \
            /let ThisCmd=$[substr(ThisCmd,SepNum+1)]%; \
            /while (--ThisRpt >= 0) \
                /eval /send $[ThisCmd]%; \
            /done%; \
        /else \
            /eval /send $[ThisCmd]%; \
        /endif%; \
    /done