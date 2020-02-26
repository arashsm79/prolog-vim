"Description: Syntax checking plugin for w0rp/ale
"Language:    SWI-Prolog
"Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
"Last Change: 2020 February 25

call ale#Set('swiprolog_lspserver_executable', 'swipl')
call ale#Set('swiprolog_lspserver_config', {})

function! lspserver#GetProjectRoot(buffer) abort
    let l:pack_file = ale#path#FindNearestFile(a:buffer, 'pack.pl')

    if !empty(l:pack_file)
        return fnamemodify(l:pack_file, ':h')
    endif

    let l:git_path = ale#path#FindNearestDirectory(a:buffer, '.git')

    return !empty(l:git_path) ? fnamemodify(l:git_path, ':h:h') : ''
endfunction

call ale#linter#Define('swiprolog', {
         \   'name': 'lspserver',
         \   'lsp': 'stdio',
         \   'command': '%e -g "use_module(library(lsp_server))." -g "lsp_server:main" -t "halt" -- stdio',
         \   'project_root': function('lspserver#GetProjectRoot'),
         \   'executable': {b -> ale#Var(b, 'swiprolog_lspserver_executable')},
         \   'lsp_config': {b -> ale#Var(b, 'swiprolog_lspserver_config')},
         \})
