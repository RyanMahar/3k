/load tick.tf
/alias home_pol2 /eval /run mp15eL8en%;climb left tree%;
/ticksize 600
/def tick_action = /load module_chat.tf
/def tick_warn = /echo "------------ CHAT LOG REFRESH ---------- "
/load module_combat.tf
/load module_dog.tf
/load module_professions.tf
/load module_skills.tf
/load gag.tf
/load module_common.tf
/load module_elemental.tf

;; STEPPER MACRO

/def bot = /eval /boton%;/stepping %{1}%;/key_f8


;; HP:640/640 C:100%  NRG:348/380(10)  SP:129/129  B:2(31%) G2N:16k
;1 /def -t'^(?:>\s)? HP:(\d+)/(\d+) C:(\d+)\%  NRG:(\d+)/(\d+)\(([\d\+\-]+)\)  SP:(\d+)/(\d+)  B:(\d)\((\d+)\%\) G2N:([0-9k]+)[\s]+T:([A-Za-z\s]+):(\d+)\%' hpbarfound_foamy = \
;2 /def -t'HP:([0-9]+)/([0-9]+) C:([0-9]+)\%  NRG:([0-9]+)/([0-9]+)\(([0-9]+)[\+\-]?\)[\s]+SP:(\d+)/(\d+)[\s]+B:(\d)\((\d+)\%\)[\s]+G2N:([0-9k]+)[\s]+T:([A-Za-z\s]+):(\d+)\%' hpbarfound_foamy = \
/def -t'HP:([0-9]+)/([0-9S]+) C:([0-9]+)\%  NRG:([0-9]+)/([0-9]+)\(([0-9]+)[\+\-]?\)[\s]+SP:(\d+)/(\d+)[\s]*' hpbarfound_foamy = \
;/echo "-------------    HP BAR   --------------" %;\
	/set hp                 %P1     %;\
	/set hp_max             %P2     %;\
	/status_graph hp hp_max %;\
	/set cohesion		%P3     %;\
	/set energy		%P4     %;\
	/set energy_max 	%P5	%;\
	/status_graph energy energy_max %;\
;	/if (regmatch("[\+\-]", $P6)) \
;	/endif%;\
;	/set emit		%P6
	/set sp			%P7	%;\
	/set sp_max 		%P8	%;\
	/status_graph sp sp_max %;\
	/set blasts 		%P9	%;\
	/set reset		%P10	%;\
	/set enemy		%P13	%;\
	/status_graph enemy mdef %;\
	/set g2n 		%P11	%;\
	/status_graph g2n mdef %;\
	/set ename		%P12	%;\
        /set status_bar $[pad("HP:",3,hp,4,"/",1,hp_max,4," C:",3,cohesion,3,"%_NRG:",6,energy,3,"/",1,energy_max,3,"_",1,ename,5,":",1,enemy,3,"%",1," _B:",4,blasts,1,"(",1,reset,3,"%) ",3," G2N:",5,g2n)]%;\
        /set status_bar2 $[pad("HP:",3,hp_graph,10,"_NRG:",5,energy_graph,10,"_SP:",3,sp_graph,10,"_",1,ename,5,":",1,enemy_graph,10,"_G2N:",5,g2n,4)]     %;



;; FOR SUMMERSET WARRENS AREA  --- MOVE TO .AREA_ MODULE
/def -t'^You decide to find another way to cross the river\.' summerset_river = \
	search reeds			%;\
	ride board			%;

/def -t'^The Mortician says: Your generous donation of' reset_usage = /def use_corpse = wrap%;

; As the last bit of life force escapes your enemy you quickly capture its
;power in your prepared soul gem.
/def -t'As the last bit of life force escapes your enemy you quickly' elemental_gem_create = smuggle gem%;put gem in vortex%;

