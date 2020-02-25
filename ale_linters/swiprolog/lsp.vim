"Description: Syntax checking plugin for w0rp/ale
"Language:    SWI-Prolog
"Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
"Last Change: 2020 February 25

call ale#Set('swiprolog_lsp_executable', 'swipl')
call ale#Set('swiprolog_lsp_config', {})

call ale#linter#Define('swiprolog', {
\   'name': 'lsp',
\   'lsp': 'stdio',
\   'executable': 'swipl',
\   'command': 'swipl -g "use_module(library(lsp_server))." -g "lsp_server:main" -t "halt"',
\   'lsp_config': {b -> ale#Var(b, 'swiprolog_lsp_config')},
\})
