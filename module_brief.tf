; briefmode: -2 = fixing, -1 = uninitialized,
;            0 = verbose, 1 = brief, 2 = forcebrief

/set forcebrief_mode 0
/set brief_mode -1
/set mapping_mode -1

/def -mregexp -p9 -t"^Your brief setting is currently: \[(on|off), (no mapping|mapping yes)\]$" module_brief_mode = \
  /if (forcebrief_mode != 0) \
    /echolog #-# MODULE BRIEF MODE ENCOUNTERED DURING FORCEBRIEF, DISABLING FORCEBRIEF%;\
    /set forcebrief_mode 0%;\
  /endif%;\
  /if ({P1} =~ "on") \
    /set brief_mode 1%;\
  /else \
    /set brief_mode 0%;\
  /endif%;\
  /if ({P2} =~ "no mapping") \
    /set mapping_mode 0%;\
  /else \
    /set mapping_mode 1%;\
  /endif

/def -ag -p9 -t"  When traveling you will see the Short descriptions of rooms" module_brief_filt_1
/def -ag -p9 -t"  When traveling you will see the Long descriptions of rooms" module_brief_filt_2
/def -ag -p9 -t"  and you will not see the cardinal minimap." module_brief_filt_3
/def -ag -p9 -t"  and you will see the cardinal minimap." module_brief_filt_4

/def forcebrief = \
  /if (forcebrief_mode == 0) \
    /def -ag -p88888 -n1 -t"Your brief setting is currently: \\\[on, no mapping\\\]" module_brief_force_filt%;\
    /send !brief on no%;\
  /endif%;\
  /test forcebrief_mode += 1

/def unbrief = \
  /test forcebrief_mode := forcebrief_mode - 1%;\
  /if (forcebrief_mode == 0) \
    /if (brief_mode == 0) \
      /if (mapping_mode == 0) \
        /send !brief off no%;\
      /else \
        /send !brief off yes%;\
      /endif%;\
    /else \
      /if (mapping_mode == 1) \
        /send !brief on yes%;\
      /endif%;\
    /endif%;\
  /endif
