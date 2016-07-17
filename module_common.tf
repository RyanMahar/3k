;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SEND TEXT MESSAGE
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;
;/def sendsms = /quote !echo "$[replace('"', "'", {*})]" | mailx 9365530173@txt.att.net%;
;
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;     CHOOSE BOON
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/def -t"You can now 'choose' which stats to apply the blessing to/." chooseboon = /beep%;/beep%;/beep

;
;

;** You have items/money to collect from the auction house **
;"^\*\* You have items\/money to collect from the auction house \*\*" 
;/def -t'
/def -t'^\*\* You have items\/money to collect from the auction house \*\*' auction_success_reminder = /auction_retrieve
;
;;
;;
;Your reputation with Mahjongg has increased slightly.
/def -t'^(?:> )?Your reputation with [A-Za-z\s\']+ has (increased|decreased) slightly\.' rep_change = /reps%;


;;
;
;;
;Saving clan status.
;;
/def -ag -t'^(?:> )?Saving clan status\.' clan_save
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Command:  'wrap'
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;There is no corpse here to wrap!
;/def -ag -t'^There is no corpse here to wrap!' wrap_fail

;You pick up The bashed up, freshly slain corpse of Handy smurf and
;wrap it up into the coffin's protective hold!
;/def -ag -t'^(?:> )?You pick up The (\w) up, (\w) slain corpse of [A-Za-z\'\-\s]+' wrap_line1
;/def -ag -t'^(?:> )?[A-Za-z\'\-\s]+ up into the coffin\'s protective hold!' wrap_line2



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Command:  'divvy gold'
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;[PARTY] GOLD divvy called by zion.
;Your share of the GOLD: 720.
;[PARTY] All gold divvied, total: 720.
/def -mregexp -t"^Your share of the GOLD: ([0-9]+)\." coinsdivvy = /test coins := coins+%P1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Command:  'afk'
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;You set your away-from-keyboard message...
;
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
;  Command:  'xp'
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;You have 23,292,975,328 total xp.
;You need 1,394,024,672 experience to achieve your next level.
;You have 825,975,328 to spend.
;XP Gain for the last 30 minutes: 3,547,037
;At this rate you will level in 1 week 1 day 4 hours 30 minutes



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    Score
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/def -F -mregexp -t'^Str:(.*) ([0-9]+) \(([0-9]+)\)(.*) Level    : ([A-z]+) \(([0-9]+)\)(.*)Exp    : (.*)$' str-level-xp = \
	/set str %P2%;\
	/set strength %P3%;\
	/set level %P6%;\
	/set xp %P8

/def -F -mregexp -t'^Wis:(.*) ([0-9]+) \(([0-9]+)\)(.*) Guild    : ([A-z]+) \(([0-9]+)\)(.*)Bank   : (.*)$' wis-guild-co = \
	/set wis %P2%;\
	/set wisdom %P3%;\
	/set guild $[tolower({P5})]%;\
	/set bank %P8

/def -F -mregexp -t'^Dex:(.*) ([0-9]+) \(([0-9]+)\)(.*) Age      : (.*) (.*)Money  : (.*)$' dex-age-coins = \
	/set dex %P2%;\
	/set dexterity %P3%;\
	/set mudage %P5%;\
	/set coins %P7

/def -F -mregexp -t'^Int:(.*) ([0-9]+) \(([0-9]+)\)(.*) Status   : (.*) Quests : (.*)$' int-status-quests = \
	/set int %P2%;\
	/set intelligence %P3

/def -F -mregexp -t'^Con:(.*) ([0-9]+) \(([0-9]+)\)(.*) Arch foe : (.*)$' con-arch = \
	/set con %P2%;\
	/set constitution %P3
/def -F -mregexp -t'^Cha:(.*) ([0-9]+) \(([0-9]+)\)(.*) Best kill: (.*)$' cha-bk = \
	/set cha %P2%;\
	/set charisma %P3

/def -h'SEND sharestats *' sharestatshook = /send -h %{-1} Str: (%str) %strength Dex: (%dex) %dexterity Wis: (%wis) %wisdom Int: (%int) %intelligence Con: (%con) %constitution Cha: (%cha) %charisma

/def -F -mregexp -t'^Resistances:\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)\s+(None|Low|20|40|60|80|100|High|Buff|Imm\.)$' resistances = \
	/set edgedac=%P1%;\
	/set bluntac=%P2%;\
	/set fireac=%P3%;\
	/set iceac=%P4%;\
	/set acidac=%P5%;\
	/set electricac=%P6%;\
	/set mindac=%P7%;\
	/set energyac=%P8%;\
	/set poisonac=%P9%;\
	/set radiationac=%P10

/def -mregexp -t"You have ([0-9,]+) total xp\." xptotal = \
	/set xplasttotal=%xptotal%;\
	/set xptotal=$[replace(",", "", {P1})]%;\
	/set xpchange=$[xptotal-xplasttotal]%;\
	/echo XP gain since last usage: %xpchange

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;           Coins
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/def -mregexp -t"^You are carrying ([0-9]+) coins in loose change" coins = /set coins=%P1
/def -mregexp -t"^You have ([0-9]+) coins in bags" coinsbags = /set coinsbags=%P1
/def -mregexp -t"^You have ([0-9]+) coins in the bank" coinsbank = /set coinsbank=%P1
/def -mregexp -t"coins \(([0-9]+)\): Taken." getcoins = /test coins := coins+%P1

/def deposit = \
	/if ($[coins-55555] > 0) \
		bank%;\
		/eval /send deposit $[coins-25015] %; \
		hh%;\
	/endif 






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;           ALIASES ACROSS ALL GUILDS WITHIN 3KINGDOMS
;
;	1) ALL ALIASES MUST DERIVE ACTION THROUGH VARIABLE "guild"
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


/def boxstuff = \
	/boxtomes%;\
	resid%;\
	hhh%;\
	d%;\
	d%;\
	n%;\
	gav%;\
	pb%;\
	e%;\
	gav%;\
	pb%;\
	se%;\
	gav%;\
	pb%;\
	s%;\
	gav%;\
	pb%;\
	sw%;\
	gav%;\
	pb%;\
	w%;\
	gav%;\
	pb%;\
	nw%;\
	gav%;\
	pb%;\
	n%;\
	gav%;\
	pb%;\
	/run e2u%;\
	resid%;\
	hh%;


