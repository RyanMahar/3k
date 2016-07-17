;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	 
;Date: 02 Dec 1997 14:45:59 -0800
;From: David Moore <dmoore at UCSD dot EDU>
;
;"Kenn Persinger" <ken at sector7 dot com> writes:
;
;> Anyone having information of arrays and structures in TF?
;
;They are a little easier to do in tf4.0 taking advantage of the new
;macros-as-function calling convention.  Basically the trick is to make
;variables named foo_1, foo_2, etc to simulate an array named foo.
;
;Here is a quicky package I wrote the other night to do simple db like
;operations.  Not really documented, cope.
;
;The set_info and get_info functions are the easiest to use as
;structure/arrays, but require tf4.0.  They are currently set to be world 
;specific (ie, array named `foo' on world X is different than array named 
;`foo' on world Y), but you can probably see how to easily change that.
;
;The other functions allow you to do things like define "variables" that
;are world specific or global, or world specific but have a default
;value, etc.
;
;To do array/structure things you can do:
;
;/def set_age =\
;    /let who=%{1}%;\
;    /let age=%{2}%;\
;    /test set_info("PLAYER", who, "AGE", age)
;
;/def get_age =\
;    /let who=%{1}%;\
;    /echo $[get_info("PLAYER", who, "AGE")
;
;For arrays just use a number instead of a string like "AGE".  For
;example, it's really easy to make things like a linked list package on
;top of these routines.
;
;
;;; $Id: db.txt,v 1.1 1998/03/03 22:31:33 dittmar Exp $

/set db_encode_str=!@#$%^&*()_-+=|\\~`{[}]:;"'<,>.?/

/def -i db_encode =\
    /let left=%;\
    /let right=$[tolower(%1)]%;\
    /let i=%;\
    /while ((i := strchr(right, db_encode_str)) >= 0) \
	/test left := strcat(left, substr(right, 0, i))%;\
	/test left := strcat(left, "A", ascii(substr(right, i, 1)), "Z")%;\
	/test right := substr(right, i + 1)%;\
    /done%;\
    /echo -- %{left}%{right}


;;; /db_store [-d] [-g] [-w<WORLD>] name value...
;;; -g for a global var, otherwise world (-w<WORLD> to specify other world)
;;; -d allows setting if initial default value for world specific vars
/def -i db_store =\
    /let opt_d=0%;\
    /let opt_g=0%;\
    /let opt_w=${world_name}%;\
    /if (!getopts("dgw:")) /break%;/endif%;\
    /if (opt_g & opt_d) \
	/echo -e -- %0: -d not compatible with -g%;\
	/break%;\
    /endif%;\
    /let name=$(/db_encode %{1})%;\
    /let value=%{-1}%;\
    /if (opt_d) \
	/let var_name=db_default_%{name}%;\
    /elseif (opt_g) \
	/let var_name=db_global_%{name}%;\
    /else \
	/let opt_w=$(/db_encode %{opt_w})%;\
	/let var_name=db_world_%{opt_w}_%{name}%;\
    /endif%;\
    /set %{var_name}=%{value}


;;; /db_clear [-d] [-g] [-w<WORLD>] [-W] name
;;; -W means all worlds
/def -i db_clear =\
    /let opt_d=0%;\
    /let opt_g=0%;\
    /let opt_W=0%;\
    /let opt_w=${world_name}%;\
    /if (!getopts("dgWw:")) /break%;/endif%;\
    /if (opt_g & opt_d) \
	/echo -e -- %0: -d not compatible with -g%;\
	/break%;\
    /endif%;\
    /let name=$(/db_encode %{1})%;\
    /if (opt_d) \
	/let var_name=db_default_%{name}%;\
    /elseif (opt_g) \
	/let var_name=db_global_%{name}%;\
    /elseif (!opt_W) \
	/let opt_w=$(/db_encode %{opt_w})%;\
	/let var_name=db_world_%{opt_w}_%{name}%;\
    /endif%;\
    /if (!opt_W) \
	/unset %{var_name}%;\
    /else \
	/mapcar /unset $(/listvar -mregexp -s ^db_world_[^_]+_%{name}\$)%;\
    /endif


;;; /db_clear_world world
/def -i db_clear_world =\
    /if ({#} != 1) \
	/echo -e -- $0: illegal number of arguments%;\
	/break%;\
    /endif%;\
    /let which=$(/db_encode %{1})%;\
    /mapcar /unset $(/listvar -mregexp -s ^db_world_%{which}_)


;;; /echo $[db_fetch(name)]		- for global
;;; /echo $[db_fetch(name, "")]		- for current world
;;; /echo $[db_fetch(name, world)]	- for specified world
/def -i db_fetch =\
    /if ({#} > 2 | {#} < 1) \
	/echo -e -- $0: improper number of arguments%;\
	/break%;\
    /endif%;\
    /let name=$(/db_encode %{1})%;\
    /if ({#} == 1) \
	/let var_name=db_global_%{name}%;\
    /elseif ({2} !~ "") \
	/let which=$(/db_encode %{2})%;\
	/let var_name=db_world_%{which}_%{name}%;\
    /else \
	/let which=$(/db_encode ${world_name})%;\
	/let var_name=db_world_%{which}_%{name}%;\
    /endif%;\
    /let result=%;\
    /test result := {%{var_name}}%;\
    /if (result =~ "" & {#} > 1) \
	/let var_name=db_default_%{name}%;\
	/test result := {%{var_name}}%;\
    /endif%;\
    /return {result}


;;; The following build on the world specific settings to provide simple
;;; array/record operations.  Used to hold player/card info, etc.


;;; /test set_info(field1 [,field2 ,...], value)
/def -i set_info =\
    /if ({#} < 2) \
	/echo -e -- $0: at least 1 field and value are required%;\
	/break%;\
    /endif%;\
    /let name=$(/db_encode %{1})%;\
    /shift%;\
    /while ({#} > 1) \
	/let field=$(/db_encode %{1})%;\
	/test name := strcat(name, "_", {field})%;\
	/shift%;\
    /done%;\
    /let which=$(/db_encode ${world_name})%;\
    /set db_world_%{which}_%{name}=%{1}



;;; /test $[clear_info(field1 [,field2 ,...])
/def -i clear_info =\
    /if ({#} < 1) \
	/echo -e -- $0: at least 1 field is required%;\
	/break%;\
    /endif%;\
    /let name=$(/db_encode %{1})%;\
    /shift%;\
    /while ({#} > 0) \
	/let field=$(/db_encode %{1})%;\
	/test name := strcat(name, "_", {field})%;\
	/shift%;\
    /done%;\
    /let which=$(/db_encode ${world_name})%;\
    /unset db_world_%{which}_%{name}



;;; /echo $[get_info(field1 [,field2 ,...])
/def -i get_info =\
    /if ({#} < 1) \
	/echo -e -- $0: at least 1 field is required%;\
	/break%;\
    /endif%;\
    /let name=$(/db_encode %{1})%;\
    /shift%;\
    /while ({#} > 0) \
	/let field=$(/db_encode %{1})%;\
	/test name := strcat(name, "_", {field})%;\
	/shift%;\
    /done%;\
    /let which=$(/db_encode ${world_name})%;\
    /return {db_world_%{which}_%{name}}