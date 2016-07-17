/set monster 0
/set player 0
;/set step_prompt 1   Changed to test reducing screen noise. 	   20130612 - RM
;/set step_prompt 0   Revert - Attempt to reduce stopped movement. 20130612 - RM
/set step_prompt 1
/set step_auto off

/def -t'^=P=' step_player = /set player 1

;/eval /def -t'=M=%{mobnames}\.' step_mob =		\
/def -t'^=M=([\w\s\(\)\,\-\']+){?(\d+)?}?.' step_mob =		\
	/set mobname $[tolower({P1})]				%;\
        /if (strstr(mobname," attacking you") > 0)		\
		/set mobname $[substr(mobname,0,strstr(mobname," attacking you"))]	%;\
	/endif					 			%;\
	/if (({step_prompt})&			         		 \
	     (strstr(mobname,"kluckenthal") <0)&                         \
	     (strstr(mobname,"courier") <0)&                         \
             (strstr(mobname,"skunk") < 0)&      	        	 \
	     (strstr(mobname,"a small wolf") < 0)&		         \
	     (strstr(mobname,"trell") < 0)&		         \
	     (strstr(mobname,"lena") < 0)&		         \
	     (strstr(mobname,"triock") < 0)&		         \
	     (strstr(mobname,"atiaran") < 0)&		         \
	     (strstr(mobname,"broodlings") < 0)&		         \
	     (strstr(mobname,"kerensky") < 0)&		         	 \
	     (strstr(mobname,"guardswoman") < 0)&			 \
	     (strstr(mobname,"diesel") < 0)&				 \
	     (strstr(mobname,"an old woman") < 0)&				 \
	     (strstr(mobname,"whorgrim") < 0)&				 \
	     (strstr(mobname,"time") < 0)&				 \
	     (strstr(mobname,"beatrix") < 0)&				 \
	     (strstr(mobname,"nova scotia duck tolling") < 0)&	 	 \
	     (strstr(mobname,"tank named") < 0)&			 \
	     (strstr(mobname,"canis") < 0)&				 \
	     (strstr(mobname,"mad cat") < 0)&				 \
	     (strstr(mobname,"a small wolf") < 0)&			 \
	     (strstr(mobname,"wandering spider") < 0)&			 \
	     (strstr(mobname,"storm servant") < 0)&			 \
	     (strstr(mobname,"bela") < 0)&				 \
	     (strstr(mobname,"nag") < 0)&				 \
	     (strstr(mobname,"shaggz") < 0)&			 	 \
	     (strstr(mobname,"agnes") < 0)&				 \
	     (strstr(mobname,"esquire") < 0)&			 	 \
	     (strstr(mobname,"dalandra") < 0)&			 	 \
	     (strstr(mobname,"great dane") < 0)&		 	 \
	     (strstr(mobname,"akita") < 0)&				 \
	     (strstr(mobname,"husky") < 0)&			        \
	     (strstr(mobname,"terrier") < 0)&			        \
	     (strstr(mobname,"wolfhound") < 0)&			        \
;	     (strstr(mobname,"german shepherd") < 0)&		        \
	     (strstr(mobname,"beagle") < 0)&		                \
	     (strstr(mobname,"keeshond") < 0)&				\
	     (strstr(mobname,"mastiff") < 0)&				\
	     (strstr(mobname,"spaniel") < 0)&				\
	     (strstr(mobname,"american staffordshire terrier") <0)&	\
	     (strstr(mobname,"tank named nightmare") < 0)&		\
	     (strstr(mobname,"miniature bull terrier") < 0)&		\
	     (strstr(mobname,"packmule") < 0)&				\
	     (strstr(mobname,"main battle tank") < 0)&			\
	     (strstr(mobname,"funkyone") < 0)&				\
	     (strstr(mobname,"valithyn") < 0)&				\
	     (strstr(mobname,"black patrol") < 0)&			\
	     (strstr(mobname,"cleric") < 0)&				\
	     (strstr(mobname,"beagle") < 0)&				\
	     (strstr(mobname,"gunnery sergeant gregory danvers") < 0)&	\
	     (strstr(mobname,"corporal freddy bowles") < 0)&		\
	     (strstr(mobname,"unkillable") < 0))			\
		/if ({P2})						\
			/set monster $[monster + {P2}]			%;\
		/else							\
			/set monster $[monster + 1]		%;\
		/endif						%;\
	/endif								

/def -h'PROMPT (> )+' catch_prompt = 				\
;	/echo STEP>						%;\
	/if ({step_prompt})					\
		/if ({player})					\
			/echo -aBCbgblue PROMPT: Player Skip	%;\
			/set step_prompt 1			%;\
			/set player 0				%;\
			/set monster 0				%;\
			/step					%;\
		/elseif ({monster})				\
			/set step_prompt 0			%;\
			/if ({killname} =~ "mobname")		\
				/if ({dog_attacking} !~ "on")	\
				/eval !kill %mobname		%;\
				/endif				%;\
			/elseif ({killname} !~ "aggro")		\
				/if ({dog_attacking} !~ "on")   \
				/eval !kill %killname		%;\
				/endif				%;\
			/endif					%;\
		/else						\
;			/echo -aBCbgblue PROMPT: STEP		%;\
			/step					%;\
		/endif						%;\
	/endif

/def -p1000 -t'([\w\s\']+) dealt the killing blow' step_corpse_trig =\
        /set combat 0						%;\
	/if ((tolower({P1})=~${world_character})|		\
	    ({P1} =~ "Notabot")|				\
	    ({P1} =~ "Zanadu")|				\
	    ({P1} =~ "Xanadu")|				\
            ({P1} =~ "Sundubu")|				\
	    ({P1} =~ "Lilman")|				\
	    ({P1} =~ "Wound")|				\
	    ({P1} =~ "Hyperion")|				\
	    ({P1} =~ "Zion")|				\
	    ({P1} =~ "Maxx")|				\
	    ({P1} =~ "Brazzin")|				\
	    ({P1} =~ "Nova Scotia Duck Tolling Retriever")|    \
	    ({P1} =~ "Rubicon"))				\
		/use_corpse 					%;\
		/if (boms)					\
			!get all				%;\
			!put all in vortex			%;\
		/endif						%;\
		!divvy gold					%;\
	/else !wrap						%;\
	/endif							%;\
	/if ({monster} > 0) 					\
		/set monster $[{monster} - 1]			%;\
	/else /set monster 0					%;\
	/endif
/def -ag -t'There is no money here to share!' step_dg1 = \
	/if ({step_auto} =~ "on")				\
		/set step_prompt 1				%;\
;		/echo -aBCbgblue PROMPT SET			%;\
	/else							\
		/echo -aBCbgblue READY FOR NEXT!  F12 		%;\
		/beep						%;\
	/endif
/def -p10000 -F -ag -t'\[PARTY\] All gold divvied' step_dg2 = \
	/if ({step_auto} =~ "on")				\
		/set step_prompt 1				%;\
;		/echo -aBCbgblue PROMPT SET			%;\
	/else							\
		/echo -aBCbgblue READY FOR NEXT!  F12		%;\
		/beep						%;\
	/endif
/def -ag -t'There is no (\w+) here.$' step_no_mob = \
	/if ({P1} =~ killname) 				\
		/set monster 0 					%;\
		!divvy gold 					%;\
	/endif



/def -t'The coffin is full!' step_coffin = 			\
;	/beep							%;\
/eval /repeat -00:00:01 1 /def use_corpse = evoke corpse drain%;\
	/if (corpsing) 						\
	       b					%;\
	/endif
;; TODO - create a module_coffin to handle this. do_coffin_full

/def -t'You ponder the situation.' step_endpath = /eval /botoff%;/load module_chat.tf%;/stepback%;/gg%;coins%;/repeat -00:55:02 1 /set $[area]_l 0%;/set $[area]_l 1 %;/end_$[area]%;

/def -t'You say: gargamels' step_smurf2garg = /stepping gargamels
/def -t'You say: balthazars' step_smurf2balth = /stepping balthazars
/def -t'You say: aegis2' step_aegis2 = /stepping aegis2
/def -t'You say: aegis3' step_aegis3 = /stepping aegis3

/def -t'^\'Gimme that belt, bitch!\'' wwf_mon = /set monster $[{monster}+1]
