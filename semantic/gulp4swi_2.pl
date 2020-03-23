% GULP 4 ready to compile or run for SWI Prolog 5.6.39.

% This is only for SWI, no others.  Use GULP 3 with other Prologs.
% Older GULP programs will need conversion to GULP 4 syntax.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% File GULP4SWI.PL
% Michael A. Covington
% Artificial Intelligence Center
% The University of Georgia
% Athens, Georgia 30602-7415
% July 28, 1994; 
% April 18, 2001; 
% January 30, 2003; 
% August 9, 2004; 
% March 28, 2005; 
% April 19, 2007; 
% September 12, 2007
%
%---------------------------------------------------------------------------%
%
%   GULP -- Graph Unification and Logic Programming
%   Version 4.0b  (using ~ instead of : to join feature to value)
%
%   CONDITIONS OF DISTRIBUTION:
%   Copyright (C) 2007 Michael A. Covington.
%   Portions copyright 1988 Quintus Computer Systems, Inc.
%   GULP is distributed with no warranty.
%
%   For documentation see "GULP 3.1: An Extension of Prolog
%   for Unification-Based Grammar," available as a research
%   report from the above address.
%
%%  Modified for use with SWI-Prolog 2.x September 1995.  Most of my
%%  changes can be found by searching for `%%  ' and/or `gulp__'.
%%  Last modified March 1996 by martin.jansche@urz.uni-heidelberg.de
%
%%  Modified March 2005 to make the operator declarations pertain to
%%  the "user" (global) module, and to do the same for
%%  term_expansion/2 and portray/1.
%
%%  Modified September 2007 (creating version 4.0) to change the
%%  feature-value operator from : to ~ to avoid increasingly serious
%%  collisions with the module system, and to eliminate the O'Keefe
%%  DCG translator in favor of the native SWI one, needed by edit/1
%%  and other builtins.
%
%---------------------------------------------------------------------------%
%
% HOW TO RUN GULP:
%  The simplest way is to simply consult gulp4swi.pl into Prolog.
%  However, you can also build executable versions of Prolog
%  (including the compiler) in which GULP is built-in.
%
%
%---------------------------------------------------------------------------%
%
% New in version 4.0a,b:
%   Reduces redundant calls to term_expansion.
%
% New in version 4.0:
%   Only 3 changes, but they are far-reaching.
%     The feature-value separator is ~ not : and all existing GULP programs
%       will have to be revised.
%     O'Keefe's DCG translator is no longer used or included; the native SWI
%       one has to be used in order to avoid breaking edit/1, spy/1, and 
%       possibly other built-in predicates.
%     GULP notation can be used in queries (at the ?- prompt) as well as
%       in programs.
%
% New in Version 3.1:
%   R. O'Keefe's DCG translator is built into GULP and is used in place
%     of whatever may be built into the implementation.
%     This gives greater portability and tighter integration of
%     GULP with the Prolog environment.
%
% New in Version 3.0:
%   GULP translation is performed automatically
%     by consult, reconsult, and compile.  The old user interface
%     (ed, load, etc.) is not used.
%   Considerably more efficient data structures are used to represent
%     feature structures internally.
%   Declarations (g_features) are still optional, but there is a gain
%     in efficiency if some or all features are declared.
%
% New in Version 2.0:
%   The separator for feature-value pairs is .. rather than ::. For
%     compatibility, :: is still accepted. /* :: dropped in 4.0 */
%   A completely different method of translation using stored schemas,
%     resulting in much faster translation of GULP notation into
%     the internal representation for feature structures and vice versa.
%   The g_features clause is OPTIONAL.
%   Many minor changes have been made to the utility predicates
%     available to the user.
%   Backtranslation of feature structures containing variables is
%     now correct.
%   Nested loads are now supported. That is, a file being loaded can
%     contain a directive such as ':- load file2.' which will be
%     executed correctly.  /* Dropped in GULP 3. */
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%  For SWI-Prolog 5
%%

%%  N.B.: No clause or directive may precede the :-module/2 directive.
%%

:- module(gulp4,
          [g_translate/2,
           g_display/1,
           display_feature_structure/1,
           g_fs/1,
           g_not_fs/1,
           g_vl/1,
           g_printlength/2,
           remove_duplicates/2,
           call_if_possible/1,
           g_herald/0,
%		   writeln/1,     % new in 2007     % redefined in module user, later on
           {}/1           % new in 2007
          ]).

:- module_transparent call_if_possible/1,{}/1.   %%  meta predicates

'{}'(Goals) :- call(Goals).                 %% formerly built in, now needed (2007)


g_version('GULP 4.0b for SWI-Prolog, 2007 September 17').

gulp__dont_translate(Term) :-
        var(Term),
        !.
		
gulp__dont_translate(Term) :-
        atomic(Term),
        !.
		
call_if_possible(A) :- gulp__call_if_possible(A).

gulp__window_title.





%%***************************************************************************/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/************************
 * Start of GULP proper *
 ************************/


/*************************
 * Operator declarations *
 *************************/

:- op(600, xfy, user:(~)).     % formerly :
:- op(602, xfy, user:(..)).


/**********************
 * Other declarations *
 **********************/

:- dynamic   g_features/1.
:- multifile g_features/1.

:- dynamic g_forward_schema/3.
:- dynamic g_backward_schema/2.


/******************************************************************
 * Translation of feature structures to value lists or vice versa *
 ******************************************************************/

g_translate(X,X) :-
        var(X),
        !.       /* Rare case, but not covered by other clauses */

g_translate(Structure,List) :-
        var(List),
        !,
        nonvar(Structure),
        g_tf(Structure,List).

g_translate(Structure,List) :-
        nonvar(List),
        g_tb(Structure,List).


/*************************************************************
 * Translation backward -- value lists to feature structures *
 *************************************************************/

/*
 * g_tb(FeatureStructure,ValueList)     "Translate Backward"
 *
 *   Translates backward using g_backward_schema.
 */


g_tb(Value, Value) :-
        gulp__dont_translate(Value),
        !.

        /* Variables and atomic terms do not need any conversion. */

g_tb(FS,Term) :-
        \+ functor(Term,g__,_),
        !,
        Term =.. [Functor | Args],
        g_tb_list(NewArgs,Args),
        FS =.. [Functor | NewArgs].

        /* Term is a structure, but not a value list.
           Recursively convert all its arguments, which
           may be, or contain, value lists. */

g_tb(FS,Term) :-
        call(g_backward_schema(RawFS,Term)),   %%  Why is call/1 here?
        g_tb_fixup(RawFS,FS).

        /* If we get here, we know Term is a value list. */


/*
 * g_tb_fixup(RawFeatureStructure,FeatureStructure)
 *
 *   Reverses the order of the feature~value pairs.
 *   Recursively backtranslates the values.
 *   Also discards pairs with uninstantiated value.
 */

g_tb_fixup(F~V,Result) :-                  /* Singleton case */
        g_tb_fixup_rest(F~V,_,Result).

g_tb_fixup(F~V..Rest,Result) :-
        g_tb(BTV,V),
        g_tb_add(F~BTV,_,FV),
        g_tb_fixup_rest(Rest,FV,Result).   /* Start the recursion */

g_tb_fixup_rest(F~V..Rest,ResultSoFar,Result) :-
        g_tb(BTV,V),
        g_tb_add(F~BTV,ResultSoFar,FVR),
        g_tb_fixup_rest(Rest,FVR,Result).  /* Continue the recursion */

g_tb_fixup_rest(F~V,ResultSoFar,FVR) :-
        g_tb(BTV,V),
        g_tb_add(F~BTV,ResultSoFar,FVR).   /* End the recursion */


g_tb_add(_~V,R,R)          :- var(V), !.   /* Unmentioned variable */
g_tb_add(F~g_(V),R,F~V)    :- var(R).      /* First contribution
                                                        to empty R */
g_tb_add(F~g_(V),R,F~V..R) :- nonvar(R).   /* Ordinary case */


/*
 * g_tb_list(FeatureStructureList,ValueListList)
 *
 *   Applies g_tb to ValueListList giving FeatureStructureList.
 */

g_tb_list([],[]).

g_tb_list([FH|FT],[VH|VT]) :-
        g_tb(FH,VH),
        g_tb_list(FT,VT).



/************************************************************
 * Translation forward -- feature structures to value lists *
 ************************************************************/

/*
 * This is more complicated than translation backward because any
 * feature can occur anywhere in the feature structure. If several
 * features are specified, separate value lists are constructed
 * for them and then unified. Recursion is performed because the
 * the value of a feature structure may itself be a feature structure.
 */

/*
 * g_tf(FeatureStructure,ValueList)     "Translate Forward"
 *
 *  Recursively examines FeatureStructure and replaces all
 *  feature structures with equivalent value lists.
 */


g_tf(Term,Term) :-
        gulp__dont_translate(Term),
        !.
        /* Simplest and most frequent case: Term is atomic or special. */

g_tf(Term,_) :-
        g_not_fs(Term),
        functor(Term,X,_),   
        (X = '~' ; X = '..'),
        !,
        g_error(['Invalid GULP notation (maybe : for ~ ): ' ,Term]).
        /* If Term is a structure with a colon as its functor,
           but is not a valid feature structure, then we have
           a syntax error. */


g_tf(Term,NewTerm) :-
        g_not_fs(Term),
        !,
        Term =.. [Functor|Args],
        g_tf_list(Args,NewArgs),
        NewTerm =.. [Functor|NewArgs].

        /* Term is a structure, but not a feature structure.
           Recurse on all its arguments, which may be, or
           contain, feature structures. */

g_tf(Feature~Value,ValueList) :-
        !,
        g_tf(Value,NewValue),
        g_tfsf(Feature,g_(NewValue),ValueList).

        /* We have a Feature~Value pair. Recursively
           translate the value, which may itself be
           or contain a feature structure, and then
           convert Feature~NewValue into a value list
           in which only one value is specified. */

        /* In Version >=2, this adds g_/1 in front
           of every value actually mentioned in
           the program. */


g_tf(FeatureStructure .. Rest,ValueList) :-
        !,
        g_tf(FeatureStructure,VL1),
        g_tf(Rest,VL2),
        g_unify(FeatureStructure..Rest,VL1,VL2,ValueList).

        /* A compound feature structure is handled by
           translating all the feature structures
           individually and then unifying the resulting
           value lists. */



/*
 * g_tf_list(ListOfTerms,ListOfResults)  "Translate Forward List"
 *
 *       Applies g_tf to a list of arguments giving a list of results.
 */


g_tf_list([],[]).

g_tf_list([H|T],[NewH|NewT]) :-
        g_tf(H,NewH),
        g_tf_list(T,NewT).


/*
 * g_tfsf(Keyword,Value,ValueList)      "Translate Forward Single Feature"
 *
 *      Turns a keyword and a value into a value list in which
 *      only one feature is specified.
 */


/*  Totally new in version 2.0  */

g_tfsf(Keyword,Value,ValueList) :-
        call_if_possible(g_forward_schema(Keyword,Value,ValueList)),
        !.

g_tfsf(Keyword,Value,ValueList) :-
        writeln(['% Generating declaration for feature: ',Keyword]),
        ( retract(g_features(List)) ; List = [] ),
        !,   /* the above line should not generate alternatives */
        append(List,[Keyword],NewList),
        asserta(g_features(NewList)),
        g_add_another_feature(Keyword),
        !,
        g_tfsf(Keyword,Value,ValueList).
             /* Try again, and this time succeed! */



/********************************
 * Output of feature structures *
 ********************************/

/*
 * g_display(X)
 *
 *   Equivalent to display_feature_structure(X).
 *   Retained for compatibility.
 *
 */

g_display(X) :- display_feature_structure(X).


/*
 * display_feature_structure(X)
 *
 *   Writes out a feature structure in a neat indented format.
 *   Feature structure can be in either Feature~Value notation
 *   or internal representation.
 */

display_feature_structure(Term) :-
        g_tb(FS,Term), /* Convert value lists into feature structures */
        g_di(0,0,FS).  /* Display them */


/*
 * g_di(CurPos,Indent,FS)     "Display Indented"
 *
 *   CurPos is the current position on the line;
 *   Indent is the indentation at which this item should be printed.
 */

% This could be made more efficient by changing the order of
% arguments so that indexing on the first argument would work.

g_di(CurPos,Indent,Variable) :-
        var(Variable),
        !,
        g_di_tab(Indent,CurPos),
        write(Variable),
        nl.

g_di(CurPos,Indent,F~V..Rest) :-
        !,
        g_di(CurPos,Indent,F~V),
        g_di(0,Indent,Rest).

g_di(CurPos,Indent,F~V) :-
        !,
        g_di_tab(Indent,CurPos),
        write(F), write(' ~ '),
        g_printlength(F,PL),
        NewIndent is Indent+PL+3,
        g_di(NewIndent,NewIndent,V).

g_di(CurPos,Indent,OrdinaryTerm) :-
        g_di_tab(Indent,CurPos),
        write(OrdinaryTerm),
        nl.



g_di_tab(Indent,CurPos) :-
        Tabs is Indent-CurPos,
        tab(Tabs).


/**************************************
 * Maintenance of translation schemas *
 **************************************/

/*
 * g_make_backward_schema
 *
 *   Makes a backtranslation schema containing all
 *   possible features in both external and internal notation,
 *   e.g., g_backward_schema(c~Z..b~Y..a~X,g__(..etc..)).
 */

g_make_backward_schema :-
        retractall(g_backward_schema(_,_)),
        bagof((Feature~Value)/Schema,
              g_forward_schema(Feature,Value,Schema),
              [((F~V)/S)|Rest]),
        g_make_whole_aux(Rest,F~V,S).


g_make_whole_aux([],FSSoFar,SchemaSoFar) :-
        assertz(g_backward_schema(FSSoFar,SchemaSoFar)).

g_make_whole_aux([((F~V)/S)|Rest],FSSoFar,SchemaSoFar) :-
        NewFS = (F~V .. FSSoFar),
        SchemaSoFar = S,  /* unify SchemaSoFar with S */
        %%  Why is explicit unification used in this case?
        g_make_whole_aux(Rest,NewFS,SchemaSoFar).

/*
 * Defaults, in case the user never declares any features
 */

g_backward_schema('no features declared',g__(_)).


/*
 * g_make_forward_schemas(List)
 *
 *   Given a list of feature names, makes and stores a
 *   set of forward translation schemas for them.
 */

g_make_forward_schemas(List) :-
        length(List,L),
        L1 is L+1,
        g_make_forward_schemas_aux(List,2,L1).

g_make_forward_schemas_aux([Feature|Rest],N,L) :-
        functor(Schema,g__,L),
        arg(N,Schema,Value),
        assertz(g_forward_schema(Feature,Value,Schema)),
%Test   write('[asserting g_forward_schema('),write(Feature),write('...)]'),nl,
        N1 is N+1,
        g_make_forward_schemas_aux(Rest,N1,L).

g_make_forward_schemas_aux([],_,_).



/*
 * g_add_another_feature(Feature)
 *      adds a feature by further instantiating the first element
 *      of the schema, which is an open list (initially _);
 *      creates a forward schema, and updates the backward schema.
 */

g_add_another_feature(Feature) :-
        g_backward_schema(_,Schema),
        arg(1,Schema,Hook),

        % further instantiate Hook,
        g_add_another_feature_aux(Hook,Value),

        assertz(g_forward_schema(Feature,Value,Schema)),
%Test   write('[asserting g_forward_schema('),write(Feature),write(']'),nl,
        g_make_backward_schema.


g_add_another_feature_aux(Hook,Value) :-
        var(Hook),
        !,
        Hook = [Value|_].

g_add_another_feature_aux([_|Hook],Value) :-
        g_add_another_feature_aux(Hook,Value).




/****************************
 * Miscellaneous predicates *
 ****************************/

/*
 * g_fs(X)       "Feature Structure"
 *
 *   Succeeds if X is a feature structure.
 */

g_fs(X ~ _)  :- atom(X).
g_fs(X .. Y) :- g_fs(X), g_fs(Y).


/*
 * g_not_fs(X)   "Not a Feature Structure"
 *  (Avoids use of "not" in compiled Arity Prolog.)
 */

g_not_fs(X) :- g_fs(X), !, fail.
g_not_fs(_).


/*
 * g_vl(X)          "Value List"
 *
 *   Succeeds if X is a value list.
 */

g_vl(Term) :- functor(Term,g__,_).


/*
 * g_unify(Text,X,Y,Z)
 *      Unifies X and Y giving Z.
 *      If this cannot be done, Text is used in an
 *      error message.
 */

g_unify(_,X,X,X) :- !.

g_unify(Text,X,Y,_) :-
        \+ (X = Y),
        g_error(['Inconsistency in ',Text]).


/*
 * g_printlength(Term,N)
 *
 *     N is the length of the printed representation of Term.
 */

g_printlength(Term, N) :-
        name(Term, List),
        !,
        length(List, N).

g_printlength(_,0).  /* if not easily computable, we probably don't
                        need an accurate value anyhow */

/*
 * g_error(List)
 *    Ensures that i/o is not redirected,
 *    then displays a message and aborts program.
 */

g_error(List) :-
        repeat,
          seen,
          seeing(user),
        !,
        repeat,
          told,
          telling(user),
        !,
        writeln(['GULP ERROR: '|List]),
        abort.


/**************************************
 *           I/O utilities            *
 **************************************/

% Modified in 2007 to operate in module user

:- redefine_system_predicate(user:writeln(_)).  % new 2003

user:writeln(X) :- writeln(X).  % cross modules

:- redefine_system_predicate(writeln(_)).  % new 2003

/*
 * writeln(List)
 *   writes the elements of List on a line, then
 *   starts a new line. If the argument is not a list,
 *   it is written on a line and then a new line is started.
 *   Any feature structures found in List are converted
 *   to Feature:Value notation.
 */

writeln(X) :- 
  g_tb(TranslatedX,X), writeln_aux(TranslatedX).

writeln_aux(X) :- var(X), !, write(X), nl.
writeln_aux([]) :- !, nl.
writeln_aux([H|T]) :- !, write(H), writeln(T).
writeln_aux(X) :- write(X), nl.



/**************************************
 * Filling gaps in particular Prologs *
 **************************************/

/* These are built-in predicates from other Prologs that
   are defined here for implementations that lack them. */

/*
 * append(X,Y,Z)
 *   concatenates lists X and Y giving Z.
 *   Has interchangeability of unknowns.
 */

gulp__append([],   X, X).
gulp__append([H|T],X, [H|Y]) :-
        gulp__append(T, X, Y).


/*
 * member(Element,List)
 *   succeeds if Element is in List.
 *   Has interchangeability of unknowns.
 */

gulp__member(X, [X|_]).
gulp__member(X, [_|Y]) :-
        gulp__member(X,Y).

/*
 * remove_duplicates(List1,List2)
 *    makes a copy of List1 in which only the
 *    first occurrence of each element is present.
 *    List1 must be instantiated at time of call.
 */

remove_duplicates(X,Y) :-
        rem_dup_aux(X,Y,[]).

rem_dup_aux([],[],_).

rem_dup_aux([H|T],X,Seen) :-
        member(H,Seen),
        !,
        rem_dup_aux(T,X,Seen).

rem_dup_aux([H|T],[H|X],Seen) :-
        rem_dup_aux(T,X,[H|Seen]).


/*
 * retractall(Predicate)
 *    retracts all clauses of Predicate, if any.
 *    Always succeeds.
 */

gulp__retractall(Head) :-
        \+ ( clause(Head,_,Ref), \+ erase(Ref) ).


/*
 * phrase(PhraseType,InputString)
 *   Initiates DCG parsing.
 *   For example, ?- phrase(s,[the,dog,barks]) is
 *   equivalent to ?- s([the,dog,barks],[]).
 */

gulp__phrase(PhraseType, InputString) :-
        call(PhraseType, InputString, []).
%%  if your Prolog does not support call/[2-6] use
%%      apply(PhraseType, [InputString, []]).


/*
 * call_if_possible(Goal)
 *   Calls Goal.
 *   If there are no clauses for the predicate,
 *   the call fails but an error condition is not raised.
 */

gulp__call_if_possible(Goal) :-
        current_predicate(_, Goal),
        call(Goal).


/**********
 * Herald *
 **********/

g_herald :-
        gulp__window_title,
        nl,
        g_herald_line(70),
        g_version(X),
        write(X), nl,
        write('Copyright 2007 Michael A. Covington'), nl,
        nl,
        write('NOTE: GULP 4 uses ~ not : to join feature to value.'), nl,
		write('      Using : will cause error messages in some, not all contexts.'), nl,nl,
		write('NOTE: Unlike earlier GULPs, you can now use feature structures'),nl,
		write('      in queries typed at the ?- prompt, not just in programs.'),nl,
        g_herald_line(70),
        nl.

g_herald_line(0) :- !, nl.
g_herald_line(N) :- N>0, write('-'), NewN is N-1, g_herald_line(NewN).

/**********************
 * End of GULP proper *
 **********************/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% O'Keefe's Quintus DCG translator was formerly placed here.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


/*************************************************
 * Hook predicates for interfacing to SWI Prolog *
 *************************************************/

% Display feature structures as such in interactive debugging:

user:portray(X) :- g_vl(X), g_tb(FS,X), write(FS).  


% Translate feature structures to internal form automatically
% during consult and reconsult, and process g_features/1 properly.

% (Most of these clauses are new in GULP 4.0,
%  to take advantage of SWI's goal_expansion.)


% g_term_exp_aux

% Clause to handle a g_features declaration when found

user:term_expansion(g_features(List),
       [(:- dynamic g_features/1),g_features(List)]) :-
       !,
       write('% Declared features: '), write(List), nl,
       retractall(g_forward_schema(_,_,_)),
%Test  write('[retracted all forward schemas]'),nl,
       g_make_forward_schemas(List),
       g_make_backward_schema.

  % At present there is nothing to prevent the user from _first_ using some
  % undeclared features and _then_ giving a g_features declaration.
  % This situation should at least be detected, if possible.


% Clause to intercept DCG rules and run them through g_tf and then
% expand_term.  This will cause a loop because expand_term calls
% term_expansion.
% To prevent the loop, it fails if a change was not actually made.
% This results in DCG rules being run through g_tf twice,
% but not more.

user:term_expansion((A-->B),Result) :-
	!,
%	writeln(['% Entered term_expansion (1)',(A-->B)]),
	g_tf(A,AA),
	g_tf(B,BB),
	\+ ((A-->B) == (AA-->BB)),
%	writeln(['% Calling expand_term on    ',(AA-->BB)]),
	expand_term((AA-->BB),Result).


% Clause to intercept Prolog rules and process only the left side
% (because the right side will be processed by goal_expansion)

user:term_expansion((Head :- Goals),(HHead :- Goals)) :-
	!,
%	writeln(['% Entered term_expansion (2)',(Head :- Goals)]),
	g_tf(Head,HHead).
%       writeln(['% Translated to             ',(HHead :- Goals)]).
	

% Clause to handle everything else.

user:term_expansion(Term, Result) :-
%	writeln(['% Entered term_expansion (3)',Term]),
	g_tf(Term,Result).
%	writeln(['% Translated to             ',Result]).


% Goal expansion:
% This catches goals typed at the ?- prompt as well as goals
% in loaded clauses.  It is called redundantly most of the
% time, but some calls actually have an effect.
% Unlike term_expansion, there is no recursion issue.

user:goal_expansion(Term, Result) :-
%	write('Entered goal_expansion:   '), write(Term), nl, %TEST
	g_tf(Term,Result).



%% Code by Martin Jansche, not presently in use...
%%
%%  Uncomment this part if you want module support (probably unstable).
%%
%%  add_portray(V, Body) :-
%%      forall(user:clause(portray(V), Body, Ref), erase(Ref)),
%%      assertz(:-(user:portray(V), Body)).
%%
%%  :- add_portray(A, gulp4:portray(A)).
%%  :- assertz(:-(user:term_expansion(A,B), gulp4:term_expansion(A,B))).
%%
%%  portray/1 and term_expansion/2 cannot be exported via the
%%  export list of the :-module/2 directive as this would result
%%  in a name clash if other modules provide their own clauses
%%  of portray/1 and/or term_expansion/2.
%%  The `quick 'n' dirty' solution is to hook them directly into
%%  the user predicate space by using assert with an explicit
%%  module specification.

:- g_herald.


% THIS MUST BE THE END OF THE FILE.
% No part of GULP itself can follow term_expansion.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








