;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       SHOPS of 3KINGDOMS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/def shoppcancer = shop%;sell all%;home


;perhaps 'too heavy' might work better to repeat the sell
/def -mregexp -F -t"(\: Too heavy\.|You cannot carry that much\.)" anothershoprunset = /if (boms) /set bomsflag=1 %;/endif
/def sellall = /set shoprun=1%;/ringsort%;/set anothershoprun=1
/def sellallend = /unset ringsort%;/unset shoprun%;/unset ringsortend%;/junk%;/donatei%;/rjunk%;/ushift

/def -Fp100 -t"*ring: Taken." ringsorttake = /if (ringsortend) !get ring%;!pams2 ring%;/elseif (ringsort) !consider ring%;/set ringsort2=1 %;/endif

/def -F -mregexp -t"(Against the school of crushing, protection is poor|Overall, against all schools, the protection provided is poor|Overall, against all schools, the protection provided is negative)" ringrejected = /if (ringsort2) pams2 ring%;!get ring%;/unset ringsort2 %;/endif

/def -F -mregexp -t"(Against the school of crushing, protection is very good|Overall, against all schools, the protection provided is extremely good)" ringpassed = /if (ringsort2) pc%;!get ring%;/unset ringsort%;/endif

/def ringsort = /nshift%;/set ringsort 1%;/set ringsortend=0%;swim%;sw%;bagset%;d%;get ring%;/def -1 -t"*There is no ring here." = pc%%;bagset%%;u%%;get ring%%;/set ringsortend=1%%;/def -1 -t"*There is no ring here." = /unset ringsort%%%;/unsort ringsortend%%%;ne%%%;shore%%%;/startselling

/def startselling = /junkroom%;/angeloshopgosell

/def -F -t"*You sell everything that you can.*" shopreturntrigger = /repeat -00:00:04 1 /shopreturn2

/def shopreturn2 = !get coins%;/%shopreturn%;qtrance fantasy/portal/e/e/e/e/e/e/e/e/e/e/e/e/e/e/e/leave/e/e/e/ne/ne/ne/e/portal/n/n/n/n/n/n/nw/n/w/w/w/w/w%;!donate all%;e%;qtrance e/e/e/e/s/se/s/s/s/s/s/s/portal/ne/ne/e/e/portal/home%;/nextdirective

/def -F -t"*You made * coins!*" shopcoinsmade = /repeat -00:00:05 1 /shopcoinsmade2

/def shopcoinsmade2 = /if (shoprun) /set anothershoprundisabled=1%;/randomgosell%;/endif

/def endsell = /unset shoprun%;/junk%;/donatei%;/rjunk

;FANTASY
;listofshopstohit angelogoshopsell
;angelo
/def angeloshopgosell = /getsellstuff%;/angeloshop%;sell all%;/set shopreturn rangeloshop
/def angeloshopsell = /getsellstuff%;/angeloshop%;sell all%;get coins%;/rangeloshop
/def angeloshop = fantasy%;portal wforest%;e%;s%;s%;w%;s%;w%;s%;w%;w%;s%;w%;w%;nw%;w%;nw%;w%;sw%;s%;s%;s%;s%;s%;s%;e%;e%;s
/def rangeloshop = n%;w%;w%;n%;n%;n%;n%;n%;n%;ne%;e%;se%;e%;se%;e%;e%;n%;e%;e%;n%;e%;n%;e%;n%;n%;w%;portal%;home

;blingdenwood
/def blingdenwoodshopgosell = /getsellstuff%;/blingdenwoodshop%;sell all%;/set shopreturn rblingdenwoodshop
/def blingdenwoodshopsell = /getsellstuff%;/blingdenwoodshop%;sell all%;get coins%;/rblingdenwoodshop
/def blingdenwoodshop = fantasy%;portal eforest%;e%;e%;s%;s%;s%;s%;s%;s%;s%;enter%;s%;w%;sw
/def rblingdenwoodshop = ne%;e%;n%;leave%;n%;n%;n%;n%;n%;n%;n%;w%;w%;portal%;home

;mews
/def mewsshopgosell = /getsellstuff%;/mewsshop%;sell all%;/set shopreturn rmewsshop
/def mewsshopsell = /getsellstuff%;/mewsshop%;sell all%;get coins%;/rmewsshop
/def mewsshop = fantasy%;portal square%;qtrance e>5%;nnf%;wwf%;vision ess
/def rmewsshop = vision nnw%;nnf%;ssf%;qtrance w>5%;portal%;home

;wayhaven
/def wayhavenshopgosell = /getsellstuff%;/wayhavenshop%;sell all%;/set shopreturn rwayhavenshop
/def wayhavenshopsell = /getsellstuff%;/wayhavenshop%;sell all%;get coins%;/rwayhavenshop
/def wayhavenshop = fantasy%;portal square%;vision eeeeeeeesssesssen
/def rwayhavenshop = v swnnnwnnnwwwwwwww%;portal%;home

;wayhavendock
/def wayhavendockshopgosell = /getsellstuff%;/wayhavendockshop%;sell all%;/set shopreturn rwayhavendockshop
/def wayhavendockshopsell = /getsellstuff%;/wayhavendockshop%;sell all%;get coins%;/rwayhavendockshop
/def wayhavendockshop = fantasy%;portal square%;vision wwwwwwwssssssssen
/def rwayhavendockshop = vision swnnnnnnnneeeeeeep%;home

;katin
/def katinshopgosell = /getsellstuff%;/katinshop%;sell all%;/set shopreturn rkatinshop
/def katinshopsell = /getsellstuff%;/katinshop%;sell all%;get coins%;/rkatinshop
/def katinshop = fantasy%;portal eforest%;vision nneeennnNEees
/def rkatinshop = vision nwwSWssswwwss%;portal%;home

;harfain
/def harfainshopgosell = /getsellstuff%;/harfainshop%;sell all%;/set shopreturn rharfainshop
/def harfainshopsell = /getsellstuff%;/harfainshop%;sell all%;get coins%;/rharfainshop
/def harfainshop = /harfain%;e%;s%;e%;s%;e
/def rharfainshop = w%;n%;w%;n%;w%;/rharfain

;troll alliance
/def trollallianceshopgosell = /getsellstuff%;/trollallianceshop%;sell all%;/set shopreturn rtrollallianceshop
/def trollallianceshopsell = /getsellstuff%;/trollallianceshop%;sell all%;get coins%;/rtrollallianceshop
/def trollallianceshop = fantasy%;portal eforest%;w%;w%;w%;sw%;sw%;s%;s%;s%;s%;s%;w%;w%;w%;in%;e%;e%;n
/def rtrollallianceshop = s%;w%;w%;out%;e%;e%;e%;n%;n%;n%;n%;n%;ne%;ne%;e%;e%;e%;portal%;home

;xaxis
/def xaxisshopgosell = /getsellstuff%;/xaxisshop%;sell all%;/set shopreturn rxaxis
/def xaxisshopsell = /getsellstuff%;/xaxisshop%;sell all%;get coins%;/rxaxisshop
/def xaxisshop = /xaxis%;e%;e%;e%;e%;s%;s%;w%;w
/def rxaxisshop = e%;e%;n%;n%;n%;w%;w%;w%;w%;/rxaxis

;westersea
/def westerseashopgosell = /getsellstuff%;/westerseashop%;sell all%;get coins%;/set shopreturn rwesterseashop
/def westerseashopsell = /getsellstuff%;/westerseashop%;sell all%;get coins%;/rwesterseashop
/def westerseashop = /wsea%;in%;w%;w%;w%;w%;w%;w%;in
/def rwesterseashop = out%;e%;e%;e%;e%;e%;e%;out%;/rwsea

;CHAOS

;revelwood
/def revelwoodshopgosell = /getsellstuff%;/revelwoodshop%;sell all%;/set shopreturn rrevelwoodshop
/def revelwoodshop2gosell = /getsellstuff%;/revelwoodshop2%;sell all%;/set shopreturn rrevelwoodshop
/def revelwoodshopsell = /getsellstuff%;/revelwoodshop%;sell all%;get coins%;/rrevelwoodshop%;/getsellstuff%;/revelwoodshop2%;sell all%;get coins%;/rrevelwoodshop
/def revelwoodshop = chaos%;vision reeesseennnn%;break arch%;say land%;vision wNWNWnnneNWnwNWwnnnnwww%;ford%;n%;climb vines%;vision uuSWNWww%;vision uNENE
/def revelwoodshop2 = chaos%;vision reeesseennnn%;break arch%;say land2%;vision wNWNWnnneNWnwNWwnnnnwww%;ford%;n%;climb vines%;vision uuSWNWww%;vision uNENE
/def rrevelwoodshop = vision SWSWSEeeeneeNENW%;chaos%;vision sssswwnnwww%;vortex%;home

;cowville
/def cowvilleshopgosell = /getsellstuff%;/cowvilleshop%;sell all%;/set shopreturn rcowvilleshop
/def cowvilleshopsell = /getsellstuff%;/cowvilleshop%;sell all%;get coins%;/rcowvilleshop
/def cowvilleshop = chaos%;enter%;e%;e%;e%;s%;s%;ride cow%;n%;n%;n%;n%;n%;n%;n%;n%;ne%;n%;n%;open east door%;e
/def rcowvilleshop = open door%;w%;s%;s%;sw%;s%;s%;s%;s%;s%;s%;s%;s%;path%;n%;n%;w%;w%;w%;vortex%;home

;crydee
/def crydeeshopgosell = /getsellstuff%;/crydeeshop%;sell all%;/set shopreturn rcrydeeshop
/def crydeeshopsell = /getsellstuff%;/crydeeshop%;sell all%;get coins%;/rcrydeeshop
/def crydeeshop = chaos%;vision rwwwweswseeunnddrseeen
/def rcrydeeshop = vision swwwnpuussuwwnenwweee%;vortex%;home

;darkmoore
/def darkmooreshopgosell = /getsellstuff%;/darkmooreshop%;sell all%;/set shopreturn rdarkmooreshop
/def darkmooreshopsell = /getsellstuff%;/darkmooreshop%;sell all%;get coins%;/rdarkmooreshop
/def darkmooreshop = chaos%;vision reeesseeneeeeeeeeeesss
/def rdarkmooreshop = vision nnnwwwwwwwwwwswwnnwww%;vortex%;home

;techno
/def technoshopgosell = /getsellstuff%;/technoshop%;sell all%;/set shopreturn rtechnoshop
/def technoshopsell = /getsellstuff%;/technoshop%;sell all%;get coins%;/rtechnoshop
/def technoshop = chaos%;vision rwwnnnngnnnee%;shop
/def rtechnoshop = vision owwsssgssssee%;vortex%;home

;chaos main shop
/def chaosmainshopgosell = /getsellstuff%;/chaosmainshop%;sell all%;/set shopreturn rchaosmainshop
/def chaosmainshopsell = /getsellstuff%;/chaosmainshop%;sell all%;get coins%;/rchaosmainshop
/def chaosmainshop = chaos%;vision reeesseennnnw
/def rchaosmainshop = vision esssswwnnwww%;vortex%;home

;science

;atlanta
/def atlantamainshopgosell = /getsellstuff%;/atlantamainshop%;sell all%;/set shopreturn ratlantamainshop
/def atlantamainshopsell = /getsellstuff%;/atlantamainshop%;sell all%;get coins%;/ratlantamainshop
/def atlantamainshop = /church%;e%;e%;e%;n
/def ratlantamainshop = s%;w%;w%;w%;/rchurch

/def atlantasecondshopgosell = /getsellstuff%;/atlantasecondshop%;sell all%;/set shopreturn ratlantasecondshop
/def atlantasecondshopsell = /getsellstuff%;/atlantasecondshop%;sell all%;get coins%;/ratlantasecondshop
/def atlantasecondshop = /church%;w%;s%;w%;w%;s%;s%;s%;s%;w%;s
/def ratlantasecondshop = n%;e%;n%;n%;n%;n%;e%;e%;n%;e%;/rchurch

;detroit
/def detroitshopgosell = /getsellstuff%;/detroitshop%;sell all%;/set shopreturn rdetroitshop
/def detroitshopsell = /getsellstuff%;/detroitshop%;sell all%;get coins%;/rdetroitshop
/def detroitshop = /detroit%;n%;n%;n%;n%;n%;n%;n%;e%;e%;e%;e%;e%;e%;n%;n%;n%;e
/def rdetroitshop = w%;s%;s%;s%;w%;w%;w%;w%;w%;w%;s%;s%;s%;s%;s%;s%;s%;/rdetroit

;htc northernexpansion
/def htcshopgosell = /getsellstuff%;/htcshop%;sell all%;/set shopreturn rhtcshop
/def htcshopsell = /getsellstuff%;/htcshop%;sell all%;get coins%;/rhtcshop
/def htcshop = science%;enter%;u%;n%;n%;n%;n%;d%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;e%;e%;e%;d%;e%;se
/def rhtcshop = nw%;w%;u%;w%;w%;w%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;u%;s%;s%;s%;s%;d%;out%;home

;luddite shop
/def ludditeshopgosell = /getsellstuff%;/ludditeshop%;sell all%;/set shopreturn rludditeshop
/def ludditeshopsell = /getsellstuff%;/ludditeshop%;sell all%;get all%;/rludditeshop
/def ludditeshop = science%;enter%;u%;n%;n%;n%;n%;d%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;w%;w%;w%;w%;w%;w%;w%;w%;w%;w%;w%;w%;path%;n%;n%;n%;w
/def rludditeshop = e%;s%;s%;s%;path%;e%;e%;e%;e%;e%;e%;e%;e%;e%;e%;e%;e%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;u%;s%;s%;s%;s%;d%;out%;home

;necromancershop
/def necromancershopsell = /getsellstuff%;qtrance fantasy/portal eforest/w/sw/w/sw/portal/n/n/n/n/n/n/nw/n/w/w/w/w%;w%;donate all%;e%;qtrance e/e/e/e/s/se/s/s/s/s/s/s/portal/ne/ne/e/e/portal/home

;allshopmacro -- removed %;/detroitshopsell due to stealing mobs
/def sellall2 = keep all corpse%;/atlantamainshopsell%;/atlantasecondshopsell%;/harfainshopsell%;/mewsshopsell%;/wayhavenshopsell%;/wayhavendockshopsell%;/katinshopsell%;/necromancershopsell%;/revelwoodshopsell%;/crydeeshopsell%;/darkmooreshopsell%;/technoshopsell%;/chaosmainshopsell%;/necromancershopsell%;/westerseashopsell%;/htcshopsell%;/ludditeshopsell%;/trollallianceshopsell%;/blingdenwoodshopsell%;/cowvilleshopsell%;/necromancershopsell%;/if (coinsbank > donations & coins > 140000000) !say corpsedonatehere! %;/endif

/def randomgosell = /test randomseed := rand(19)%;/if (randomseed == 1) /atlantamainshopgosell %;/elseif (randomseed == 2) /atlantasecondshopgosell %;/elseif (randomseed == 3) /harfainshopgosell %;/elseif (randomseed == 3) /mewsshopgosell %;/elseif (randomseed == 4) /wayhavenshopgosell %;/elseif (randomseed == 5) /wayhavendockshopgosell %;/elseif (randomseed == 6 | randomseed == 7 | randomseed == 8) /katinshopgosell %;/elseif (randomseed == 7) /revelwoodshop2gosell %;/elseif (randomseed == 8) /revelwoodshopgosell %;/elseif (randomseed == 9) /crydeeshopgosell %;/elseif (randomseed == 10 | randomseed == 11) /darkmooreshopgosell %;/elseif (randomseed == 30) /technoshopgosell %;/elseif (randomseed == 12) /chaosmainshopgosell %;/elseif (randomseed == 13) /junk%;/donatei%;/rjunk%;/randomgosell %;/elseif (randomseed == 14) /westerseashopgosell %;/elseif (randomseed == 15) /htcshopgosell %;/elseif (randomseed == 16) /ludditeshopgosell %;/elseif (randomseed == 17) /trollallianceshopgosell %;/elseif (randomseed == 18) /blingdenwoodshopgosell %;/elseif (randomseed == 19) /cowvilleshopgosell %;/elseif (randomseed == 0) /junk%;/donatei%;/rjunk%;/randomgosell %;/endif

/set dungeonjunk=1
/def getsellstuff = /if (dungeonjunk) qtrance chaos/enter/w/w/n/follow tracks/n/get all/climb gate/get all/n/get all/w/get all/n/get all/n/get all/e/get all/e/get all/n/get all/w/get all/s/get all/w/get all/n/get all%;/else /junk%;get all%;/endif%;stash all%;i2%;c%;/rjunk%;/echo drop 30000 coins%;i2

;kimlark add perplexus (inside angelo?), miyu, simpsons, ravenloft, dune, underdark, covenant, atlantis, mega-tokyo, royogi-pei, gug city, tookwich?, nethack?, disney, epcot

