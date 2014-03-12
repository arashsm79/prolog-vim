" Vim syntax file
" Language:    SwiProlog
" Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2013 February 12

" include standard prolog syntax file
runtime syntax/prolog.vim

" add missing ISO
syn keyword prologKeyword abs atan ceiling cos end_of_file error lenght
syn keyword prologKeyword exp floor log mod rem sign sin sqrt truncate
syn keyword prologKeyword float_fractional_part float_integer_part

" SwiProlog specific
syn keyword swiprologKeyword   label library selectchk maplist term_to_atom

syn keyword swiprologDirective use_module ensure_loaded reexport module

syn match   swiprologOperator "|\|#\\\?/\\\|#\\\?==>\|#\\\?<==>\|#=\?<#\?\|#\\\?=#\?\|##\|#>=\?#\?\|#\\\?\\/\?"

" syn match   swiprologClauseHead  "^\(\l\w*\|'.*'\)\s*\((.*)\)\?\s*\(:-\|\.\)"

syn keyword swiprologTodo  contained TODO FIXME XXX
syn match   swiprologComment  "%.*" contains=swiprologTodo
syn region  swiprologComment   start="/\*" end="\*/" contains=swiprologTodo

hi def link swiprologComment  Comment
hi def link swiprologTodo     Todo
hi def link swiprologKeyword  Special
hi def link swiprologDirective Type
hi def link swiprologOperator SpecialChar
hi def link prologClauseHead Function

let b:current_syntax = "swiprolog"

" vim: ts=28
