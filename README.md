# obo_metdata

Convenience prolog predicates for working with ontologies and triples that use either the OBO IAO or OboInOwl (oio) metadata vocabulary.

E.g

```
definition(C,D),
has_related_synonym(C,S)
```

With axiom annotation:

```
has_related_synonym_axiom(C,S,A),
rdf(A,P,B)
```

