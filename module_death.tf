/purge module_death_*

/set module_death_preface 0
/set module_death_no_kb 0

/def module_death_pre = \
  /if (module_death_no_kb == 1) \
    /set module_death_no_kb 0%;\
    /killing_blow%;\
  /elseif (module_death_preface == 1) \
    /echolog #-# MODULE DEATH PREFACE REPEATS%;\
    /panicmode%;\
  /else \
    /set module_death_preface 1%;\
  /endif

/def module_death_killing_blow = \
  /if (module_death_preface == 0) \
    /echolog #-# MODULE DEATH KB WITHOUT PREFACE%;\
    /panicmode%;\
  /else \
    /set module_death_preface 0%;\
    /killing_blow%;\
  /endif

/test module_death_tmpstr := strcat('-p7000 -t"', my_name_cap, \
    ' dealt the killing blow to *." module_death_i_killed = /module_death_killing_blow')
/eval /def %module_death_tmpstr

/def -p2 -mregexp -t"^([A-Z][a-z]*) dealt the killing blow to *." module_death_other_kill = \
  /if (module_death_preface == 0) \
    /echolog #-# MODULE OTHER DEATH KB WITHOUT PREFACE%;\
  /else \
    /set module_death_preface 0%;\
  /endif

; Note this might be a multiple word summon, but also might be a shout or other
; trick.
/def -p1 -mregexp -t" dealt the killing blow to *." module_death_other_kill_2 = \
  /set module_death_preface 0

/def module_death_no_kb_check = \
  /def -p88890 -n1 -mregexp -F -t"" module_death_no_kb_check_act = \
    /set tmpstr=%%PR%%;\
    /if (regmatch(" gurgles in (her|his|its) own blood as (he|she|it) dies.\$", tmpstr) | \
         regmatch(" screeches in agony and falls to the ground, dead.\$", tmpstr) | \
         regmatch(" gasps for breath, then slumps into death.\$", tmpstr)) \
      /set module_death_no_kb 1%%;\
    /endif

/def -p7000 -t"* gurgles in {her|his|its} own blood as {he|she|it} dies." module_death_pre_1 = /module_death_pre
/def -p7000 -t"* screeches in agony and falls to the ground, dead." module_death_pre_2 = /module_death_pre
/def -p7000 -t"* gasps for breath, then slumps into death." module_death_pre_3 = /module_death_pre

/def -ag -p7000 -t"You've killed *." module_death_post_1
/def -ag -p7000 -mregexp -t"^[A-Z]([a-z]*) dealt the killing blow\.      ( *)$" module_death_post_2
/def -ag -p7000 -t"Blood splatters on you." module_death_post_3
