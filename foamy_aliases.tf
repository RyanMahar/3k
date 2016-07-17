
;;
;;
;;; 
;;  Basic Setup Stuffs
;;;

;; 
;;;
;;  From house to guild between areas
;;;

;; /getready
/def gg = \
        hh           %; \
        guild        %; \
        /run n2en    %; \
        nw           %; \
        u            %;

/def rr = \
	/if ("rest" =~ area) /refresh%;\
	/else  /eval score%;coins%;gs%;home_$[area]%;flourish%;\
	/endif%;

/def boxtomes = \
	box2%;\
	put manual of vindaes in box%;\
	get manual of vindaes from vortex%;\
	put manual of vindaes in box%;\
	portal%;\
	craft%;\
	/rp 2 get tome from vortex%;\
	/rp 2 put tome in box%;\
	portal%;

/alias boxgem get yellow-striped topaz soul gem from vortex%;put yellow-striped topaz soul gem in box%;get red-striped topaz soul gem from vortex%;put red-striped topaz soul gem in box%;
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

/def boxcorpse = \
	crypt%;\
	uac%;\
	pb%;\
	/run sp%;\
	resid%;\
	hhh%;\
	/run 2d%;\
	uac%;\
	pb%;\
	s%;\
	pb%;\
	e%;\
	pb%;\
	n%;\
	pb%;\
	/run w2u%;\
	resid%;\
	hh%;
	
/alias bl ecb%;ab%;despam%;give blast to %*%;ecb%;ab%;despam%;give blast to %*%;

/def bl = \
	/eval /echo "Attempting to BLAST ::> $$[$[area]_killname] or $[mobname]" %;\
	/let modetype = /eval $$[$[area]_killname] %;\
	/if ("mobname" =~ modetype ) \
		/eval bl $[mobname]%;\
		drop blast%;\
	/else	\
		/eval bl $[area]_killname %;\
		drop blast%;\
	/endif %;

/def use_corpse = wrap%;

/alias rup /pitstop%;

/def morgue = \
	morgue%;\
;/rp 30 morgueaction%;\
	donate coffin%;\
	unwrap all%;\
	coins%;\
	/def use_corpse = wrap%;\
	hh%;

/alias morgueaction unwrap%;get corpse%;sell corpse%;

/def pitstop = \
	/morgue%;\
	/smithy%;\
	/deposit%;\
	/boxstuff%;\
	/def use_corpse = wrap%;\
	/nextdirective%;\
	/rr%;

/alias don resid%;hhh%;/run 2dn%;get all from box%;/run s2u%;guild%;/run n2e%;/rp 3 sell all%;/run 2ws%;hh%;
/alias don2 resid%;hhh%;/run 2dne%;get all from box%;/run ws2u%;guild%;/run n2e%;/rp 3 sell all%;/run 2ws%;hh%;
/alias don3 resid%;hhh%;/run 2d2e%;get all from box%;/run 2w2u%;guild%;/run n2e%;/rp 3 sell all%;/run 2ws%;hh%;
/alias don4 resid%;hhh%;/run 2ds2e%;get all from box%;/run n2w2u%;guild%;/run n2e%;/rp 3 sell all%;/run 2ws%;hh%;
/alias don5 resid%;hhh%;/run 2d2se%;get all from box%;/run w2n2u%;guild%;/run n2e%;/rp 3 sell all%;/run 2ws%;hh%;
/alias don6 resid%;hhh%;/run 2d2s%;get all from box%;/run 2n2u%;guild%;/run n2e%;/rp 3 sell all%;/run 2ws%;hh%;


/def smithy = smithy%;fix all%;hh%;coins%;
/def refresh = time%;

;;;;
;
;   BETA
;
;;;;


/def rr_color = \
	/set resolve_type $[strip_attr({resolve_type})]			%;\
	/if (resolve_type =~ "slashing")				\
		/set resolve_type $(/echo -aCcyan %resolve_type)	%;\
	/elseif (resolve_type =~ "crushing")				\
		/set resolve_type $(/echo -aBCwhite %resolve_type)	%;\
	/elseif (resolve_type =~ "fire")				\
		/set resolve_type $(/echo -aBCred %resolve_type)	%;\
	/elseif (resolve_type =~ "ice")					\
		/set resolve_type $(/echo -aCblue %resolve_type)	%;\
	/elseif (resolve_type =~ "acid")				\
		/set resolve_type $(/echo -aBCgreen %resolve_type)	%;\
	/elseif (resolve_type =~ "shocking")				\
		/set resolve_type $(/echo -aCyellow %resolve_type)	%;\
	/elseif (resolve_type =~ "mental")				\
		/set resolve_type $(/echo -aCmagenta %resolve_type)	%;\
	/elseif (resolve_type =~ "magical")				\
		/set resolve_type $(/echo -aBCmagenta %resolve_type)	%;\
	/elseif (resolve_type =~ "toxic")				\
		/set resolve_type $(/echo -aCgreen %resolve_type)	%;\
	/elseif (resolve_type =~ "radiation")				\
		/set resolve_type $(/echo -aBCcyan %resolve_type)	%;\
	/endif
	


;;;;;
;
;
;
;;;;;


