;;Adapted from Fjord's chat monitor by Parisienne. regex contributions from Balthus

/set chat=1

/if (strstr($[${world_name}],"3s") > 0)		\
	/eval /set chat_open ~/.tf/logs/3s.chat	%;\
/else						\
        /eval /set chat_open ~/.tf/logs/3k.chat %;\
/endif

/eval /set lines=$[tfopen(chat_open, 'a')]
/eval /set windowmsg=<$[ftime("%Y:%m:%d::%I:%M:%S", time())]>
/eval /let retval=$[tfwrite(lines, encode_ansi(windowmsg))]
/eval /set lastline=%{lines} 

/def -F -p10 -mregexp -t'^[^ ]' setline = /set lastline=0
;/def -F -p10 -mregexp -t'^ {0,3}' setline = /set lastline=0
;/def -p2 -F -mregexp -t'\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s([\|\\\/\*\+\-\^vO1-9]\s?)+' longlinecartography = /longline

/def timestamp = /eval /set ts $[ftime("%Y%m%d::%H:%M:%S", time())]> 

; stop shouts from interfering with other triggers
/def -p1 -mregexp -t'^[A-Za-z0-9]+ shouts:.*$$' shoutblock = /return%;

/def chatline = \
  /def -E"chat" -p1 -F -mregexp -t"%{-1}" chatline_%{1} = \
    /timestamp %%;\
	  /eval /set windowmsg=%%{ts}$$[escape("\$\%\;",{P0})] %%;\
	  /eval /let retval=$$[tfwrite(lines, encode_ansi(chatpromptremove({P0})))] %%;\
	  /eval /set lastline=%%{lines}

;detects the prompt "> " in chat messages and strips it, if there	  
/def chatpromptremove = /eval /set chatpromptcheck=$[substr({*},0,2)]%;/if (chatpromptcheck =~ "> ") /return substr({*},2) %;/else /return {*}%;/endif

; This pre-empts the chatline trigger to ignore routine spam.
; to restore original functionality change {P0} to windowmsg
/def unchatline = /def -p2 -mregexp -t"%{-1}" unchatline_%{1} 

; This takes care of multi-line messages (makes them go to the right place if you use 
; multiple capture windows)
/def -p2 -F -mregexp -t'^  +.*$$' longline = \
	/if (lastline) \
            /timestamp%;\
	  /eval /set windowmsg=%{ts}$[escape('$%;',{P0})]%;\
	  /eval /let retval=$[tfwrite(lastline, encode_ansi({P0}))]%;\
	/endif

;block cartography
/unchatline cartography \s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s([\|\\\/\*\+\-\^vO1-9]\s?)+
/unchatline gwho /=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\
/unchatline kitt ( 48021 ) 

;chatlines

/chatline   tell ^(?:>\s|)(?:A ghostly form of )?[A-Za-z0-9@]+ tells?( you)? ?\(?([A-Za-z0-9,@]+)?\)? ?: ..+$$
/chatline   linktell ^(?:>\s|)[A-Za-z0-9@]+ LTs? \(.*\)$$
;/chatline	lts ^(?:>\s|)   LT: (.+)$$
;/chatline tell ^(?:>\s|)(?:>\s|)(?:>;\s|)(You tell \w+|\w+ tells you|\w+ LTs \(.+\)|You LT \(.+\))\:?(.*)$$(.*)$$

/chatline afk ^(?:>\s|)(\w+) is afk\: (.*)$$
/chatline idle ^WARNING: [A-Za-z0-9@]+ has been idle for [0-9]M\.
/chatline linkdead NOTE: [A-Z][a-z@3]+ is linkdead - message will be left in (his|her|its) tellhist.

/chatline   party ^(?:>\s|)(\[PARTY\])( [^(?:>\s|):]+:? .+)$$
;/chatline	partyshare ^(?:>\s|)Your share of the GOLD: \d+\.
/unchatline party_divvy ^(?:>\s|)\[PARTY\] All gold divvied, total:
/unchatline party_divvy2 ^(?:>\s|)\[PARTY\] GOLD divvy called by 

/chatline   emotes ^(?:>\s|)From afar, .*$$
/chatline   whisper ^(?:>\s|)[A-Za-z0-9]+ whispers? to [A-Za-z]+: .*$$
/chatline   spouse ^(?:>\s|)--<@ [A-Za-z]+ @>-- .*$$

/chatline alpha ^(?:>\s|)[A-Z][a-z0-9]+ \<ALPHA Uplink\>\:.*$$
/chatline book (:?[A-Z][a-z@3]+ |)\>\>BOOK\>\> *.*$$

;add 'some mist'
;/chatline   say ^(?:>\s|)[A-Za-z0-9]+(?:' ghost|) says?: .*$$
/unchatline dogcollar ^(?:>\s|)\w+ says?: WOOF!
/unchatline saychatgag ^(?:>\s|)(Theela|Blade|Haggis|Arundin|Guard|Bertolo|Savon|Netta|Zachary|Jix|Karak|Chavee|Mircarla|Talula|Wisewoman|Lyriac|Rex|Ayla|Alana|Boomer|Scientist|Warrior) says: .*$$

;/chatline watch ^(?:>\s|)(?:3[ks]\:\s|)(\[\w+ (?:enters the game|reconnects|disconnects)\])

;mud lines
/chatline shout ^(?:>\s|)(\w+) shouts:(.*)$$
/chatline gshout ^(?:>\s|)[A-Z][a-z@3]+ gshouts:(.*)$$
;/chatline auction ^(?:>\s|)\[Auction(?: House|)\] (\w+) ?(\(\w+\) )?: (.*)$
/chatline house ^(?:>\s|)(\w+) \<House.*\>(.*)$$
/chatline omp ^(?:>\s|)[A-Z][a-z@3]+ \-\=\(OMP\)\=\- (.*)$
/chatline professions ^(?:>\s|)[A-Z][a-z@3]+ \{Professions\}: (.*)$
/chatline poll ^(?:>\s|)\[Poll\] [A-Z][a-z@3]+: .*$
/chatline politics ^(?:>\s|)\[Politics:[A-Z][a-z]+\] .*$$
/chatline explorers ^(?:>\s|)([A-Z][a-z]+ \(Exp\): )(.*)$$
/chatline explorers_rank ^(?:>\s|)[A-Z][a-z]+ has advanced (his|her) rank to #[0-9]+ in the top [0-9]+ explorers!$
/chatline 3kp ^(?:>\s|)[A-Z][a-z]+ ~3kp~: .*$$
/chatline craft ^(?:>\s|)[A-Z@a-z]+ \<(Craft|C-Trade)\>:.*$$
;>  <Congratulations!> : Xena has joined the Crafter's Guild!
/chatline pk ^(?:>\s|)[A-Z][a-z]+ -=PK=-: .*$$
/chatline arenachat ^(?:>\s|)\[Arena Chat\] [A-Z][a-z]+: .*$$
/chatline anarchydeath ^(?:>\s|)[A-Z][a-z]+ \([a-z]+\) has just defeated [A-Z][a-z]+ \([a-z]+\)!
/chatline sports ^(?:>\s|)(AUTORACING|BASEBALL|BASKETBALL|FOOTBALL|GOLF|HOCKEY|SOCCER)!!! [A-Z][a-z]+(?:\s|): .*$$
/chatline portal ^(?:>\s|)\[Portal: [A-Z][a-z]+\] .*$$
/chatline gladiator ^(?:>\s|)\[\<Gladiator ([A-Z][a-z]+)\>\]: .*$$
/chatline pinnaclephone ^(?:>\s|)(Your phone is ringing\.\.\. RING!!|You answer the phone\.|The other party hangs up the phone\.|You decide to hang up as well\.|CLICK!|Ring\.\.\.|The other party answers the phone\.|You hang up the phone\.|You speak into the phone\.|The phone says: .*)$$

/chatline nexwear ^(?:>\s|)\[NEX\] : [A-Z@a-z]+ embraces the power of the Lord of the Unliving.
/chatline nexremove ^(?:>\s|)\[NEX\] : [A-Z@a-z]+ abandons the power of the Lord of the Undead.
/chatline nex ^(?:>\s|)[A-Z@a-z]+\[NEX\] : .*$$

/chatline cyberstrike ^(?:>\s|)[A-Z][a-z]+ transmits:  .*$$
/chatline cyberstrike2 ^(?:>\s|)You activate your strike suit's battle radio\.
/chatline magic ^(?:>\s|)[A-Z][a-z]+ \[\>Magic\<\]: .*$$
/chatline cultist ^(?:>\s|)[A-Z][a-z]+ \<cgame\>: .*$$
;/chatline cultists 
/chatline cultistgargoyle ^(?:>\s|)Gargoyle whispers: .*$$
/chatline gamers ^(?:>\s|)\[Gamers\]:[A-Z][a-z]+ (?:[\{\}\s\w\d]+)?: .*$$
;add:[Gamers]:Flaxen {3k} : where are the rabbits?

;Spaz@3s tells you: found another chatline for your tell monitor
;        'canlink'. its from the haunted manor quest, lol

/chatline antcave ^(?:>\s|)You yell into the caves\.\.\.
/chatline antcaveother ^(?:>\s|)[A-Z][a-z]+ echoes from somewhere (above|below) you in the caves\.\.\.
;Kortor echoes from somewhere far below you in the caves...

;clan/syndicate
/chatline corp1 ^(?:>\s|)\[(?:Corp|Syndicate)( CEO)?\] [A-Za-z]+: .*
/chatline corp2 ^(?:>\s|)\[Corp Notify\] .*
/chatline court1 ^(?:>\s|)\[(Clan|CLAN)\]:? ([A-Za-z]+ : )?.*
/chatline council ^(?:>\s|)\[\{(Council|COUNCIL)\}\]:? [A-Za-z]+ : ?.*
/chatline clanshout ^(?:>\s|)[A-Za-z]+\(.*\) .*
/chatline clanannounce ^(?:>\s|)\[(War|Map) (Status|Notice|Machine)\](?:\s|):(?:\s|) .*$$ 

;guilds
/chatline ascended ^(?:>\s|)\[(Ascended|ascended|ARRIVED|DEPARTED|\*ADVANCE\*|\*SEVER\*)\] (.*)$$

/chatline necro ^(?:>\s|)([A-Z][a-z@3]+) \[(.+)\]: (.*)$$
;/chatline nec_emote ^\[(\d{2,}\-\w)\]: (.*)$$
;/chatline nec_death ^(?:>\s|)\[\-=(DEATH|GUILD)=\-\]\: .+
/chatline nec_alarm ^(?:>\s|).+ tripped the alarm placed at\.\.\.$
/chatline scryorb ^(?:>\s|)\(ScryOrb\)\>\>(.*)$$

/chatline warder ^(?:>\s|)\<(Warders|Admin|High Admin|Heroes|Wheel of Time)\> .*$$

/chatline knightarrive ^(?:>\s|)\((Arrive|Leave)\) .*$$
/chatline knight ^(?:>\s|)[A-Z][a-z]+ \(.*\): .*$$
/chatline knight2 ^(?:>\s|)\(.*\) [A-Z][a-z]+:? .*$$
/chatline knightannounce ^(?:>\s|)\(Guild Announcement(?: by [A-Z][a-z]+|)\): .*$$
/chatline knighttrain ^\[(ANNOUNCE|GQUEST)\] .*$$
/chatline knightjoust ^==J=O=U=S=T==\>  .*$$

/chatline mageannounce ^(?:>\s|)\[\[MAGE\]\] .*$$
/chatline mage ^(?:>\s|)\[Mage\(\d+\)\] [A-Z][a-z]+ : .*$$
/chatline mageschool ^(?:>\s|)\[Crimson Rose\] [A-Z][a-z]+ : .*$$
/chatline magesorc ^(?:>\s|)\[Sorcerer\] [A-Z][a-z]+ : .*$$


/chatline jedi_telepathy ^(?:>\s|)[A-Z][a-z]+ thinks \. o O \(.*$

;/chatline bard ^(?:>\s|)[A-Z][a-z]+ \[[0-9]+\]:.*$$
/chatline hibard ^(?:>\s|)[A-Z][a-z]+ \[(HighBard|Gallant)\]:.*$$
/chatline bard50 ^(?:>\s|)[A-Z][a-z]+ \[Fifty\]:.*$$

;/chatline priest ^(?:>\s|)[A-Z@a-z ]+ \(Priest [A-Za-z0-9]+\):.*$$
/chatline priest_emote ^(?:>\s|)\(Priest \d+\) [A-Z\.@a-z ]+:.*$$
;/chatline priest_bitch ^(?:>\s|)[A-Z\.@a-z ]+ \(Bitch\):.*$$
;/chatline priest_announce ^(?:>\s|)\(Announcement\).*$$

/chatline gentech ^(?:>\s|)(?:A ghostly form of )?[A-Z\.@a-z ]+ \[Gen-[A-Z][a-z]+\] :.*$$
/chatline gennotify ^(?:>\s|)\[Gen-[A-Z][a-z]+\]:.*$$

/chatline psicorps ^(?:>\s|)\[ADVANCE\] [A-Z][a-z]+ has advanced to Tour [0-9]+!!

;necro main line takes care of this
;/chatline interguild ^(?:>\s|)[A-Z][a-z@3]+ \[G[a-z]+\]:.*$$

;high chatlines
/chatline highmortal ^(?:>\s|)(\w+) \<HM-(\w+)\>: (.*)$$
;^(?:>\s|)[A-Z@a-z]+ \<HM -[A-Z][a-z]+\>:.*$$
;Parisienne <HM-Seeker>: meep
/chatline player_review_board ^(?:>\s|)[A-Z][a-z]+ \[\>PRB\<\]: .+
/chatline iguild ^(?:>\s|)\<IGuild\([A-Z][a-z@3]+\)\> [A-Z][a-z@3]+(?:\[Wiz\]|): (.*)$&

;mobs
/chatline cae ^(?:>\s|)Ganderei drinks a potion and his body contorts in pain!$$
/chatline prysmatia ^(?:>\s|)Prysmyia\'s [a-z]+ casing cracks, then shatters apart!$$
/chatline arachnus ^(?:>\s|)A blinding crimson flash comes from the body of the spider god!$$
/chatline crysmal ^(?:>\s|)In a mighty shattering, The \w+ casing cracks apart from Crysmal!
/chatline westersea ^(?:>\s|)The mission '.+$$

;Euchre
/chatline eukr ^(?:>\s|)\{Eukr\} (\w+) : (.*)$$

;3S Gossip
/chatline gossip ^(?:>\s|)(\w+) \<Gossip\>: (.*)$$

;to-do
/chatline euchreshout \{Eukr Shout\} (\w+) : .*$$
;poker
;(3K-UnoShout) Parisienne
/chatline unotell \[UNO:[A-Z][a-z]+\] [A-Z][a-z]+
;  test
;bridge

;defunkt
/chatline jugger ^(?:>\s|)(\[-?Jugger\(?[A-Z]*\)?-?\] )([A-Za-z]+: )?(.*)$$
;/chatline juggerbear ^(?:>\s|)(\[Bear(\([A-Z]+\))?\] )([A-Za-z]+:)?(.*)$$
;/chatline elemental ^(?:>\s|)([a-zA-Z]+ \[[A-Z][0-9]+\]:)(.*)$$
;/chatline elementalarrive^(?:>\s|)(\[{ENTER|EXIT}\])(.*)$$
