:- begin_tests(oio).

:- use_module(library(obo_metadata/oio)).

test(defined) :-
        findall(X-Y,has_related_synonym(X,Y),_).

    
:- end_tests(oio).


:- begin_tests(iao).

:- use_module(library(obo_metadata/iao_metadata)).

test(defined) :-
        findall(X-Y,definition(X,Y),_).

    
:- end_tests(iao).
    
:- begin_tests(all).

:- use_module(library(obo_metadata)).

test(defined) :-
        findall([X,Y,Z],synonym_scope(X,Y,Z),_).

    
:- end_tests(all).
    
:- begin_tests(example).

:- use_module(library(semweb/rdf11)).
:- use_module(library(semweb/rdf_turtle)).
:- use_module(library(obo_metadata)).
:- use_module(library(obo_metadata/oio)).
:- use_module(library(obo_metadata/iao_metadata)).
:- rdf_register_ns(obo,'http://purl.obolibrary.org/obo/').

test(all) :-
        rdf_load('tests/owl/nucleus.ttl'),
        \+ \+ definition(obo:'GO_0005575',_),
        \+ \+ has_dbxref(obo:'GO_0005623',_),
        \+ \+ in_subset(obo:'GO_0005623',_),
        \+ \+ has_related_synonym(obo:'GO_0005622', _),
        \+ \+ has_related_synonym(obo:'GO_0005622', _, _),
        \+ \+ (has_related_synonym_axiom(obo:'GO_0005622', _, A),
               has_dbxref(A, _)),
        \+ \+ has_exact_synonym(_,_).



    
:- end_tests(example).
    
