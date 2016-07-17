;
; run: takes a string of numbers and letters.  Numbers are counts, letters
; are one-key shortcuts.  /run 3etz will do e e e ne sw.

/def run = \
  /let _arg=%*%;\
  /let _count=%;\
  /let _c=%;\
  /let _c2=%;\
  /let _i=-1%;\
  /while ((_c:=substr(_arg, ++_i, 1)) !~ "" ) \
    /if (_c =/ "[0-9]") \
      /@test _count:= strcat(_count, _c)%;\
      /if (_count > 999) \
        /echo ### RUN COUNT MAXXED AT 999%;\
        /set _count 999%;\
      /endif%;\
    /elseif (_c =~ "B")\
      /forcebrief%;\
    /elseif (_c =~ "U")\
      /unbrief%;\
    /elseif (_c =~ "/")\
      /test _c2 := substr(_arg, ++_i)%;\
    /elseif (regmatch("[ZCFHPMLSVbdeghijklmnoprsuwx]", _c)) \
      /if (_c =~ "Z") /let _c=home 182%; /endif%;\
      /if (_c =~ "C") /let _c=chaos%; /endif%;\
      /if (_c =~ "F") /let _c=fantasy%; /endif%;\
      /if (_c =~ "M") /let _c=mission scout%; /endif%;\
      /if (_c =~ "H") /let _c=home 324%; /endif%;\
      /if (_c =~ "m") /let _c=magic%; /endif%;\
      /if (_c =~ "P") /let _c=path%; /endif%;\
      /if (_c =~ "S") /let _c=science%; /endif%;\
      /if (_c =~ "R") /let _c=resid%; /endif%;\
      /if (_c =~ "V") /let _c=vortex%; /endif%;\
      /if (_c =~ "x") /let _c=exit%; /endif%;\
      /if (_c =~ "b") /let _c=brief on no%; /endif%;\
      /if (_c =~ "g") /let _c=guild%; /endif%;\
      /if (_c =~ "i") /let _c=in%; /endif%;\
      /if (_c =~ "L") /let _c=leave%; /endif%;\
      /if (_c =~ "o") /let _c=out%; /endif%;\
      /if (_c =~ "p") /let _c=portal%; /endif%;\
      /if (_c =~ "r") /let _c=enter%; /endif%;\
      /if (_c =~ "e") /let _c=east%; /endif%;\
      /if (_c =~ "s") /let _c=south%; /endif%;\
      /if (_c =~ "n") /let _c=north%; /endif%;\
      /if (_c =~ "w") /let _c=west%; /endif%;\
      /if (_c =~ "j") /let _c=ne%; /endif%;\
      /if (_c =~ "h") /let _c=nw%; /endif%;\
      /if (_c =~ "l") /let _c=se%; /endif%;\
      /if (_c =~ "k") /let _c=sw%; /endif%;\
      /if (mud == "3k") \
        /test _c := strcat("!", _c)%;\
      /endif%;\
      /for _j 1 %{_count-1} /send %{_c}%;\
      /let _count=%;\
    /else \
      /echo *** Unrecogized on run: %{_c} ***%;\
    /endif%;\
  /done

/def reverserundir = \
  /if ({1} =~ "n") /return "s"%; \
  /elseif ({1} =~ "s") /return "n"%; \
  /elseif ({1} =~ "e") /return "w"%; \
  /elseif ({1} =~ "w") /return "e"%; \
  /elseif ({1} =~ "h") /return "l"%; \
  /elseif ({1} =~ "l") /return "h"%; \
  /elseif ({1} =~ "k") /return "j"%; \
  /elseif ({1} =~ "j") /return "k"%; \
  /elseif ({1} =~ "u") /return "d"%; \
  /elseif ({1} =~ "d") /return "u"%; \
  /else /return %1%;/endif
