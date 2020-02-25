"Description: Syntax checking plugin for w0rp/ale
"Language:    SWI-Prolog
"Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
"Last Change: 2020 February 25

call ale#Set('swiprolog_lspserver_executable', 'swipl')
call ale#Set('swiprolog_lspserver_config', {})

call ale#linter#Define('swiprolog', {
         \   'name': 'lspserver',
         \   'lsp': 'stdio',
         \   'command': 'swipl -g "use_module(library(lsp_server))." -g "lsp_server:main" -t "halt"',
         \   'executable': {b -> ale#Var(b, 'swiprolog_lspserver_executable')},
         \   'lsp_config': {b -> ale#Var(b, 'swiprolog_lspserver_config')},
         \})
