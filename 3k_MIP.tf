;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                         MIP                             ;;;
;;;                                for TF by Zorbo on 3K                    ;;;
;;;                             Changed for use by Zion on 3K               ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/loaded z::zmip.tf

;;; Required files ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;


;;; ZMIP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Idea for this from Balthus on 3K and his TinTin++ script from
; http://necro.wikidot.com/tintin-mip
; See (PORTAL FOR WINDOWS MIP V9.0) for further information.
; Written for TinyFugue version 5.0 beta 8

; version 0.01i        March 17, 2010         Changed Parsemip YET AGAIN to clear up dollarsign problems in
;                        echoed strings.
;
; version 0.01h        March 11, 2010         Changed Parsemip AGAIN to hopefully clear up ansi problems.
;
; version 0.01g        March 11, 2010         Cleaned up code by making trialx variables local instead
;                            of global (duh)
;                        Reformated this section for better readability.
;                        Removed/commented code from 0.01e change as this didn't seem
;                            to be working as desired
;                        Added checks to ensure it is only loaded once
;                        Reformated zhelp entrys
;
; version 0.01f     March 1, 2010         Changed Parse_mip once again to fix (I hope) problems 
;                        with echoing the partial strings starting with '-' 
;                        that could cause problems.
;
; version 0.01e     February 11, 2010     Changed Parse_mip to better echo partial strings 
;                        left over from mip packets by fixing the encoding
;                        so that '<esc>[blah blah' is properly displayed.
;                        
; version 0.01d     February 10, 2010    Intergrated into Zhelp system  
;                        Mip_FFFJ modified to correct for no follower

; The version of this code
;
/set TFMipVer=1

; {} has special meaning in regexps in TF 5.0 - we know this, so turn off the warnings
/set warn_curly_re=off

; expand_tabs is a special system variable that converts tabs to spaces and other stuff
; this seems to make some things show up wrong
/set expand_tabs=off

;;; MIP CONNECT TRIGGER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; One shot trigger that catches the welcome message when first logging on
;
/def -n1 -p1000 -mglob -t'*elcome*' Mip_trigger0 = /MipJumpstart

;;; MipJumpStart ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; this IS called with a one shot trigger for '*elcome*' to automaticly start Mip processing
;
; Makes and sends a 5 digit id code. This also makes gag/triggers to capture the data
; sent from the mud.
; TF uses PROMPT HOOK to deal with unterminated lines. Note that the mud may send
; unterminated lines containing several MIP packets, that may also have extra data
; that is terminated so two trigger are required. Priority for these is set to 1000
; which can be changed to reflect your needs. These are NOT fallthrough triggers.
; removed 'g' from both /def below "/def -p1000 -mregexp -ag
;
/def MipJumpStart = \
    /set MipId=$[rand(10000,99999)]%; \
    /set MipHeader=$[strcat("#K%",MipId)]%; \
    /if (ismacro("Mip_trigger0")) \
        /undef Mip_trigger0%; \
    /endif%; \
    /eval /send 3klient $[MipId]~TF$[TFMipVer]%; \
 
    /def -p1000 -mregexp -a -t"\#K\%%$[MipId]\\\d{3}\\\D{3}." MIP_trigger1 = /ParseMip %%*%; \
    /def -p1000 -mregexp -a -h"PROMPT \#K\%%$[MipId]\\\d{3}\\\D{3}." MIP_trigger2 = /ParseMip %%*
;/test zhelp_add("zmip_mipjumpstart","Generates random 5 digit id code and sets triggers for mip packets. \
;    Use this if you do not /quit but reconnect otherwise it will be triggered automaticly.")

;;; ParseMip ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Routine to pull out each mip packet and pass it to the appropriate routine
; Extra non mip data on the end is tested first for trigger use and if not
; handeled by a trigger it is simply echoed. NOTE: If the 'extra' causes a trigger
; to fire, this code WILL NOT display it. If you want it displayed, /echo it in YOUR
; trigger. At this point, the /trigger below is the ONLY way for the extra non mip
; data to trigger YOUR code as previous Mip_trigger1 and Mip_trigger2 are also gags and not
; fallthough.
;
; NOTE: /trigger will NOT count macros WITHOUT bodies. This means that if you have GAGS,
;    HILIGHTS, or other triggers WITHOUT bodies then it will NOT COUNT THEM and this code
;    will echo the text and you will think your gags do not work. The solution is to give
;    your GAGS a dummy body i.e. = /let dummy=0  This is, I think, a bug in TF.
;
/def ParseMip = \
    /set Mip_total=Mip_total%*%; \
    /let StartMip=0%; \
    /while (StartMip>-1) \
        /let StartMip=$[strstr(Mip_total,MipHeader,0)]%; \
        /if (StartMip>-1) \
            /set Mip_total=$[substr(Mip_total,StartMip)]%; \
            /set Mip_chr_count=$[0 + substr(Mip_total,8,3)]%; \
            /set Mip_literal=$[substr(Mip_total,11,3)]%; \
            /set Mip_data=$[substr(Mip_total,14,Mip_chr_count-3)]%; \
            /set Mip_total=$[substr(Mip_total,Mip_chr_count+11)]%; \
            /if (Mip_literal!~"") \
                /Mip_$[Mip_literal] $[Mip_data]%; \
            /else \
                /eval /test $[echo("ParseMip: Mangled packet:$[Mip_data]:","","","e")]%; \
            /endif%; \
        /elseif (Mip_total!~"") \
            /set Mip_total=$[strcat("-- ",Mip_total)]%; \
            /let triggered=$[trigger(Mip_total)]%; \
            /if (triggered==0) \
                /set Mip_total=$[replace("$","\$",Mip_total)]%; \
;                /eval /echo -p $[encode_attr(decode_ansi(Mip_total))]%; \
                /eval /echo -p $[Mip_total]%; \
            /endif%; \
            /set Mip_total=%; \
        /endif%; \
    /done

;;; Mip_xxx ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Each of the following routines are based on the documentaion of
;                  (PORTAL FOR WINDOWS MIP V9.0)
; Some of these routines call other macros/functions that are not included in
; this file. Some set SB_xxxxxx variables that I may/may not use.
; NonWindows versions of TF would be able to play sounds, show images, etc.
; The cgywin dll limits shell use in the Windows version of TF.
; Adjust the following defs to your own use.
;
; sound
/def Mip_AAA = \
    /set SB_sound=%*

; image
/def Mip_AAB = \
    /set SB_image=%*

; reboot
;2.0 days
/def Mip_AAC = \
    /set SB_reboot=%*%; \
;    /if (SB_reboot=~"1:05") \
;        /test PPNotice(3,"REBOOT IN $[SB_reboot]")%; \
;    /endif

; music
/def Mip_AAD = \
    /set SB_music=%*

;uptime
;13:25
/def Mip_AAF = \
    /set SB_uptime=%*

;avi
/def Mip_AAG = \
    /set SB_avi=%*

;media
/def Mip_AAH = \
    /set SB_media=%*

;special
/def Mip_BAA = \
    /set SB_special=%*

;tells
/def Mip_BAB = \
    /set SB_tell=%*
;    /if (comm_tells <= 0) \
;        /eval /set comm_tells=$[tfopen('~/tf/comms/comm_tells','w')]%; \
;    /endif%; \
;    /test tfwrite({comm_tells},$[SB_tell])

;special2
;The magical protection sparkles from your body
/def Mip_BAC = \
    /set SB_special2=%*

;short room description
;Crew Quarters (e,s,n,w)
;Right Flight Squad Deck (detach,nw,ne)
/def Mip_BAD = \
    /set SB_shortroom=%*

;mudlag
;0.00
/def Mip_BAE = \
    /set SB_mudlag=%*

;edit
/def Mip_BAF = \
    /set SB_edit=%*

;gp1mask
/def Mip_BBA = \
    /set SB_gp1mask=%*

;gp2mask
/def Mip_BBB = \
    /set SB_gp2mask=%*

;hpmask
/def Mip_BBC = \
    /set SB_hpmask=%*

;spmask
/def Mip_BBD = \
    /set SB_spmask=%*

;chats
;atalk~Auction~Edward~[Auction House] Edward has placed Head of Edward up for bids at the Auction House starting at 777 coins (buy it now for 777!)
/def Mip_CAA = \
    /set SB_chats=%*

;caption
/def Mip_CAP = \
    /set SB_caption=%*

;contfile
/def Mip_CCF = \
    /set SB_contfile=%*

;downloadfile
/def Mip_CDF = \
    /set SB_downloadfile=%*

;endfile
/def Mip_CEF = \
    /set SB_endfile=%*

;roomcode
;
; space delimited exits from room
;
/def Mip_DDD = \
    /set SB_roomcode=%*

;unknown but mud sends this at reboot?
/def Mip_EEE = \
    /set SB_EEE=%*

;;; Mip_FFF Composites ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This macro strips out the composite data from the FFF mip packet.
; NOTE: Documentation (PORTAL FOR WINDOWS MIP V9.0) is incorrect in that
;              'Formatted Example: #K%00005020FFFA312~C300~E57~L75'
; in the document is NOT what is currently (1/12/10) being sent (see below samples from 3K mud)
; Basicly, a delimiter "~" is being placed between the composit and its data - contrary to the documentation.
; This means data is in pairs x~data<end> or x~data~x~data<end>
; or SOMETIMES it is like x~~x~data...OR SOMETIMES LIKE x~data~x~data~x~<with NO DATA>
; which makes for interesting coding...
;
; Examples of FFF mip packets received:
; #K%30996007FFFG~30
; #K%68371088FFFC~363~E~400~I~ <vC:5>  <gWorth:125%>  Tport:2/2  <gBlaz:6/6>  <gProt:ON>  Circle:92
; #K%44541032FFFK~Eldar Dire Avenger~L~100~M~
;
; This macro is called with the parsed data packet, ie:
; G~30
; C~363~E~400~I~ <vC:5>  <gWorth:125%>  Tport:2/2  <gBlaz:6/6>  <gProt:ON>  Circle:92
;
/def Mip_FFF = \
    /let trial1=0%; \
    /let TotalLine=%{*}%; \
    /if (substr(TotalLine,0,1)=~"~") /let TotalLine=$[substr(TotalLine,1)]%; /endif%; \
    /let TotalLine_len=$[strlen(TotalLine)]%; \
    /while (TotalLine_len>0) \
        /test trial1:=regmatch("([^~]+)~([^~]+)",TotalLine)%; \
        /if (trial1!=0) \
            /let TotalLine=$[{PR}]%; \
            /if (substr(TotalLine,0,1)=~"~") /let TotalLine=$[substr(TotalLine,1)]%; /endif%; \
            /let TotalLine_len=$[strlen(TotalLine)]%; \
            /MIP_FFF_$[{P1}] $[{P2}]%; \
        /else \
            /let TotalLine=%; \
            /let TotalLine_len=0%; \
        /endif%; \
    /done

;current hp
/def Mip_FFF_A = \
    /set SB_chp=%*

;max hp
/def Mip_FFF_B = \
    /set SB_mhp=%*

;current sp
/def Mip_FFF_C = \
    /set SB_csp=%*

;max sp
/def Mip_FFF_D = \
    /set SB_msp=%*

;current np
/def Mip_FFF_E = \
    /set SB_cnp=%*

;max np
/def Mip_FFF_F = \
    /set SB_mnp=%*

;repower
/def Mip_FFF_G = \
    /set SB_repower=%*

;unknown
/def Mip_FFF_H = \
    /set SB FFF_H=%*

;;; Mip_FFF_I guildstuff1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;Colored HPBar stuff - CCconfigure(able)?
;
; <vC:1>  <gWorth:125%>  Tport:2/2  <r{blazing:6%}>  <gProt:ON>  Circle:92%
; <vC:4>  <gWorth:125%>  Tport:2/2  <gBlaz:6/6>  <gProt:ON>  Circle:93
; <vC:4>  <gWorth:125%>  Tport:2/2  <g{blazing:100%}>  <gProt:ON>  Circle:0%
; <vC:3>  <gWorth:125%>  Tport:2/2  <gBlaz:6/6>  <rProt:OFF>  Circle:0%
/def Mip_FFF_I = \
    /let guildstuff1=%*%; \
    /let trial2=0%; \
    /let trial3=0%; \
    /let trial4=0%; \
    /test trial2:=regmatch("\<vC\:([^\>]*)\>  \<.Worth\:([^\%]*)\%\>  Tport\:([^\/]*)\/([^ ]*)  \<.([^\>]*)\>  \<.Prot:([^\>]*)\>  Circle\:([^\%]*)\%",guildstuff1)%; \
    /eval /set SB_icc=$[{P1} + 0]%; \
    /eval /set SB_worth=$[{P2} + 0]%; \
    /eval /set SB_ctp=$[{P3} + 0]%; \
    /eval /set SB_mtp=$[{P4} + 0]%; \
    /let temp_glam=%{P5}%; \
    /eval /set SB_prot=%{P6}%; \
    /eval /set SB_circle=$[{P7} + 0]%; \
    /test trial3:=strchr(temp_glam,"/")%; \
    /if (trial3>0) \
        /test trial4:=regmatch("Blaz\:([^\/]*)\/([^\>]*)",temp_glam)%; \
        /eval /set SB_cgl=$[{P1} + 0]%; \
        /eval /set SB_mgl=$[{P2} + 0]%; \
    /else \
        /test trial4:=regmatch("\{blazing\:([^\%]*)\%\}",temp_glam)%; \
        /eval /set SB_pgl=$[{P1} + 0]%; \
    /endif%; \
    /endif%; \
    /set SB_tcc=$[SB_tcc + 0]

;;; Mip_FFF_J guildstuff2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;more colored guild/hpbar stuff - CCconfigure(able)?
;
;<gUndead:108%>  <gHPf:64/64>  <gSPf:64/64>
;<gUndead:143>  <gHPf:68/68>  <gSPf:68/68>
;Undead:none  <gHPf:76/76>  <gSPf:76/76>
/def Mip_FFF_J = \
    /let guildstuff2=%*%; \
    /let trial1=0%; \
    /let trial2=0%; \
    /let trial3=0%; \
    /test trial1:=regmatch("\<.Undead\:([^\>]*)\>",guildstuff2)%; \
    /if (trial1==2) \
        /eval /set SB_fol_php=$[{P1} + 0]%; \
    /else \
        /set SB_fol_type=None%; \
        /eval /set SB_fol_php=0%; \
        /set SB_fcc=0%; \
    /endif%; \
    /test trial2:=regmatch("\<.HPf\:([^\/]*)\/([^\>]*)\>",guildstuff2)%; \
    /if (trial2==3) \
        /eval /set SB_fhp=$[{P1} + 0]%; \
        /eval /set SB_mfhp=$[{P2} + 0]%; \
        /eval /set SB_pfhp=$[((SB_fhp * 100) / SB_mfhp)]%; \
    /endif%; \
    /test trial3:=regmatch("\<.SPf\:([^\/]*)\/([^\>]*)\>",guildstuff2)%; \
    /if (trial3==3) \
        /eval /set SB_fsp=$[{P1} + 0]%; \
        /eval /set SB_mfsp=$[{P2} + 0]%; \
        /eval /set SB_pfsp=$[((SB_fsp * 100) / SB_mfsp)]%; \
    /endif%; \

;attacker
/def Mip_FFF_K = \
    /set SB_scan_target=%*

;;;  Mip_FFF_L attacker hp percent ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; compares the last scan to current scan and (if AutoMonitor = 1) reports it
; variables LastScan, ScanDiff, and SB_scan are available for use
;
/def Mip_FFF_L = \
    /set SB_scan=%*%; \
    /if (LastScan=0) /set LastScan=100%; /endif%; \
    /set ScanDiff=$[SB_scan-LastScan]%; \
    /if (ScanDiff!=0) \
        /let rndsremain=$[trunc(SB_scan / abs(ScanDiff))]%; \
    /else \
        /let rndsremain=Unknown%; \
    /endif%; \
    /if (AutoMonitor) \
        /let noticeline=$[strcat("@{xBCgreen}Target: @{n}@{xBCcyan}",{SB_scan_target},"@{n}",\
                ": @{xBCred}",{SB_scan},"@{n}% ",\
                ": @{xBCyellow}",{ScanDiff},"@{n}% "," est. rnds",\
                ": @{xBCmagenta}",{rndsremain},"@{n}")]%; \
        /let LenNoticeLine=$[strlen(decode_attr(noticeline))]%; \
        /let LenLeadin=$[75-LenNoticeLine]%; \
        /eval /echo -p %Leadin %noticeline%; \
    /endif%; \
    /set LastScan=$[SB_scan]

;attacker image
/def Mip_FFF_M = \
    /set SB_image2=%*