;------------------------------------------------------------------------
;Get array / get 2array : A virtual array function to similate a real array
;usage:
;get_array("Array name here", I) & get_2array("array name", I, I2)
;example get_array("Dir_Array", 43) returns the 43rd element from "Dir_Stack"
;
;------------------------------------------------------------------------
/def get_array = \
 /return _%1_array_%2

/def get_2array = \
 /return _%1_array_%2_%3

;------------------------------------------------------------------------
;PUT array / put 2array: A virtual array function to similate a real array
;usage:
;put_array("Array name here", I, st) & put_2array("array name", I, I2, st)
;example put_array("Dir_Array", 43, "sw") puts "sw" at element 43 in
;"Dir_Array"
;------------------------------------------------------------------------
/def put_array = \
 /IF (strlen({3}) > 0) \
   /set _%1_array_%2=%3%;\
 /ELSE \
   /unset _%1_array_%2%;\
 /ENDIF%;

/def put_2array = \
 /IF (strlen({4}) > 0) \
   /set _%1_array_%2_%3=%4%;\
 /ELSE \
   /unset _%1_array_%2_%3%;\
 /ENDIF%;

;------------------------------------------------------------------------
;PURGE array : Purges a virtual array made by get_array & put_array
;usage:
;purge_array("Array name here")
;example purge_array("Dir_Array"), deletes the whole array from memory
;NOTE: Purge array starts from element 0
;NOTE: this can also purge double demensiond arrays too.
;------------------------------------------------------------------------
/def purge_array = \
 /quote -S /unset `/listvar -s _%1_array_*

