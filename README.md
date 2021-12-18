# Prolog Vim
> Prolog file detection and syntax highlighting for Vim/NeoVim.

Make sure to add a comment at the beginning of `.pl` files so that the plugin can differentiate between perl and swiprolog files.
The comment has to start with a `%` followed by a whitespace.
```prolog
% this is a comment
predicate(X,Y) :- prediacte1(X), predicate2(Y).
...
```
