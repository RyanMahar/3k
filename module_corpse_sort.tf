;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                                                                     ;;;;
;;;;                                      ZCORPSE.TF                                     ;;;;
;;;;                                                                                     ;;;;
;;;;                                     ZORBO ON 3k                                     ;;;;
;;;;                                  CORPSE SORTER FILE                                 ;;;;
;;;;                                                                                     ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; sortcorpses ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; routine must DROP corpses as there is no foolproof way to sort in place
; (may not have room on a follower who may or not be here or not have room in smuggle etc)
;  I use client aliases (using alias.tf) to call this routine, ie:
;    /alias sortme    /sortcorpses -i -a
;    /alias sortmed    /sortcorpses -i -d
;    /alias sortf    /sortcorpses -f -a
;    /alias sortfd    /sortcorpses -f -d
;    /alias sorts    /sortcorpses -s -a
;    /alias sortsd    /sortcorpses -s -d
;  although you could set up defs, ie:
;    /def sortm = /sortcorpes -i -a
;    etc.
; or could call it directly - what ever works
;
; NOTE: I used the 'think' soul on the mud to trigger the end of the corpse listing
;    and the 'bot' soul on the mud to trigger the end of the sort. If these are
;    changed you MUST changed the triggers.
;
; syntax:
; /sortcorpses &lt;-a | -d&gt; &lt;-i | -s | -f&gt;
;    option -a = ascending
;    option -d = decending
;    option -i = corpse inventory of player
;    option -s = smuggled corpses
;    option -f = corpse inventory of follower
;
; examples:
; /sortcorpses -i -d    sorts corpses in inventory in decending order
; /sortcorpses -s -d    sorts smuggled corpses in decending order
; /sortcorpses -f -a    sorts corpses carried by follower in ascending order
;
/def sortcorpses = \
    /let opt_a=0%; \
    /let opt_d=0%; \
    /let opt_i=0%; \
    /let opt_s=0%; \
    /let opt_f=0%; \
    /if (!getopts("adisf")) /return 0%; /endif %; \
    /if ((opt_a + opt_d)&gt;1) \
        /eval /echo -p @{BCgreen}%%%@{n} @{BCred}Invalid sort: -a OR -d@{n} @{BCgreen}%%%@{n} %; \
        /return 0%; \
    /elseif ((opt_s + opt_i + opt_f)&gt;1) \
        /eval /echo -p @{BCgreen}%%%@{n} @{BCred}Invalid sort: -i OR -s OR -f@{n} @{BCgreen}%%%@{n} %; \
        /return 0%; \
    /endif%; \
    /if ((opt_a + opt_d)=0) /let opt_a=1%; /endif%; \
    /if ((opt_i + opt_s + opt_f)=0) /let opt_i=1%; /endif%; \
    /set sort_inventory=$[opt_i]%; \
    /set sort_smuggle=$[opt_s]%; \
    /set sort_follower=$[opt_f]%;\
    /set sort_ascend=$[opt_a]%; \
    /set sort_decend=$[opt_d]%; \
    /set sort_min=100%; \
    /set sort_max=0%;\
    /set sort_dropped=0%; \
    /set sort_active=1%; \
    /set sort_list=1%; \
    /set sort_ncorpses=0%; \
    /eval /echo -p @{BCgreen}%%%%%%%%%%@{n} @{BCcyan}Starting Corpse Sort@{n} @{BCgreen}%%%%%%%%%%@{n} %; \
    /if (sort_inventory) /send ic%; \
    /elseif (sort_smuggle) /send smuggle%; \
    /elseif (sort_follower) /send iu c%; \
    /endif%; \
    /send think

;; FoundCorpse ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; triggers when a corpse is listed and we are sort_list(ing)
; assigns values to each corpse
; and determines the max and min values in the corpses
; because we don't need to drop ALL the corpses, just those to be rearranged
;
/def -p599 -E(sort_list) -ag -F -mregexp -t'\(([^ ]*)\) ([^.]*)corpse' FoundCorpse1 = \
    /test sort_ncorpses := $[sort_ncorpses + 1]%; \
    /let value=11%; \
    /if     ({P1} =~ "|----") /let value=1%; \
    /elseif ({P1} =~ "-|---") /let value=2%; \
    /elseif ({P1} =~ "--|--") /let value=3%; \
    /elseif ({P1} =~ "---|-") /let value=4%; \
    /elseif ({P1} =~ "----|") /let value=5%; \
    /elseif ({P1} =~ "----*") /let value=6%; \
    /elseif ({P1} =~ "---**") /let value=7%; \
    /elseif ({P1} =~ "--***") /let value=8%; \
    /elseif ({P1} =~ "-****") /let value=9%; \
    /elseif ({P1} =~ "*****") /let value=10%; \
    /endif%; \
    /set corpse_%{sort_ncorpses}=%{value}%; \
    /if (value&lt;sort_min) /set sort_min=$[value]%; /endif%; \
    /if (value&gt;sort_max) /set sort_max=$[value]%; /endif

/def -p599 -E(sort_list) -ag -F -mregexp -t'\[([^ ]*)\] ([^.]*)corpse' FoundCorpse2 = \
    /test sort_ncorpses := $[sort_ncorpses + 1]%; \
    /let value=11%; \
    /set corpse_%{sort_ncorpses}=%{value}%; \
    /if (value&lt;sort_min) /set sort_min=$[value]%; /endif%; \
    /if (value&gt;sort_max) /set sort_max=$[value]%; /endif

;; DoCorpseSort ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; the meat of the whole thing - triggers when the 'think' soul fires (after the corpse listing)
;  runs through the corpselist and drops appropriate corpses in sorted order then picks them up
;
/def -p599 -E(sort_active) -F -mglob -t'*think carefully.' DoCorpseSort = \
    /set sort_list=0%; \
    /let thisvalue=0%; \
    /set sort_dropped=0%; \
    /if (sort_ascend) \
        /let value=$[sort_min - 1]%; \
        /while (++value &lt; sort_max) \
            /let index=1%; \
            /while (index &lt;= sort_ncorpses) \
                /test thisvalue:=\{corpse_%{index}\}%; \
                /if (value == thisvalue) \
                    /if (sort_inventory) \
                        /send drop corpse $[index]%; \
                        /set sort_dropped=$[sort_dropped + 1]%; \
                    /elseif (sort_smuggle) \
                        /send smuggle remove corpse $[index]%; \
                        /send drop corpse%; \
                        /set sort_dropped=$[sort_dropped + 1]%; \
                    /elseif (sort_follower) \
                        /send #drop corpse $[index]%; \
                        /set sort_dropped=$[sort_dropped + 1]%; \
                    /endif%; \
                    /let index2=$[index - 1]%; \
                    /let newnumcorpses=$[sort_ncorpses - 1]%; \
                    /while (++index2 &lt; newnumcorpses) \
                        /let index3=$[index2 + 1]%; \
                        /test newvalue:=\{corpse_%{index3}\}%; \
                        /set corpse_%{index2}=$[newvalue]%; \
                    /done%; \
                    /test sort_ncorpses := $[newnumcorpses]%; \
                /else \
                    /let index=$[index + 1]%; \
                /endif%; \
            /done%; \
        /done%; \
    /elseif (sort_decend) \
        /let value=$[sort_max + 1]%; \
        /while (--value &gt; sort_min) \
            /let index=1%; \
            /while (index &lt;= sort_ncorpses) \
                /test thisvalue:=\{corpse_%{index}\}%; \
                /if (value == thisvalue) \
                    /if (sort_inventory) \
                        /send drop corpse $[index]%; \
                        /set sort_dropped=$[sort_dropped + 1]%; \
                    /elseif (sort_smuggle) \
                        /send smuggle remove corpse $[index]%; \
                        /send drop corpse%; \
                        /set sort_dropped=$[sort_dropped + 1]%; \
                    /elseif (sort_follower) \
                        /send #drop corpse $[index]%; \
                        /set sort_dropped=$[sort_dropped + 1]%; \
                    /endif%; \
                    /let index2=$[index - 1]%; \
                    /let newnumcorpses=$[sort_ncorpses - 1]%; \
                    /while (++index2 &lt; newnumcorpses) \
                        /let index3=$[index2 + 1]%; \
                        /test newvalue:=\{corpse_%{index3}\}%; \
                        /set corpse_%{index2}=$[newvalue]%; \
                    /done%; \
                    /test sort_ncorpses := $[newnumcorpses]%; \
                /else \
                    /let index=$[index + 1]%; \
                /endif%; \
            /done%; \
        /done%; \
    /endif%; \
    /let index=0%; \
    /while (++index &lt;= sort_dropped) \
        /if (sort_inventory) \
            /send take corpse%; \
        /elseif (sort_smuggle) \
            /send take corpse%; \
            /send smuggle corpse%; \
        /elseif (sort_follower) \
            /send #get corpse%; \
        /endif%; \
    /done%; \
    /send bot

;; EndCorpseSort ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; triggers when the actions of DoCorpseSort are complete (off the 'bot' soul)
; just clears the gags and turns off the sorting
; needed because if done in DoCorpseSort, the gags would be disabled BEFORE the mud processed
; the commands and you would see the spam
;
/def -p599 -E(sort_active) -F -mglob -t'*confess to being a bot.' EndCorpseSort = \
    /set sort_active=0%; \
    /eval /echo -p @{BCgreen}%%%%%%%%%%@{n} @{BCcyan}Ending Corpse Sort@{n} @{BCgreen}%%%%%%%%%%@{n}

;; sortgag? ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; collection of gags that are enabled when sorting corpses - reduces spam
;
/def -p599 -E(sort_active) -ag -F -mglob -t'* Corpses carried...' sortgag1

/def -p599 -E(sort_active) -ag -F -mglob -t'* drop *' sortgag2

/def -p599 -E(sort_active) -ag -F -mglob -t'*: Taken.' sortgag3

/def -p599 -E(sort_active) -ag -F -mglob -t'*currently smuggling *' sortgag4

/def -p599 -E(sort_active) -ag -F -mglob -t'*corpses carried by your undead*' sortgag5

/def -p599 -E(sort_active) -ag -F -mglob -t'*command the * to drop the*' sortgag6

/def -p599 -E(sort_active) -ag -F -mglob -t'* drops a *' sortgag7

/def -p599 -E(sort_active) -ag -F -mglob -t'* takes *' sortgag8

/def -p599 -E(sort_active) -ag -F -mglob -t'Ok*' sortgag9

/def -p599 -E(sort_active) -ag -F -mglob -t'* smuggle*' sortgag10

/def -p599 -E(sort_active) -ag -F -mglob -t'* unsmuggle*' sortgag11

