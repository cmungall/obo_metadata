:- module(obo_metadata,
          [synonym_scope/3]).

:- use_module(library(obo_metadata/oio)).
:- use_module(library(obo_metadata/iao_metadata)).

literal_to_atom('^^'(L,_),A) :- atom_string(A,L).


synonym_scope(Subj,Syn,related) :-  has_related_synonym(Subj,Syn).
synonym_scope(Subj,Syn,narrow) :-   has_narrow_synonym(Subj,Syn).
synonym_scope(Subj,Syn,broad) :-    has_broad_synonym(Subj,Syn).
synonym_scope(Subj,Syn,exact) :-    has_exact_synonym(Subj,Syn).

atomic_synonym_scope(Subj,Syn,Scope) :-
        synonym_scope(Subj,SynLit,Scope),
        literal_to_atom(SynLit,Syn).

