" Vim ftplugin file
" Language:    SWI-Prolog
" Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2015 July 20

setlocal efm=%t%*[^:]:\ %f:%l:%c:\ %m
setlocal comments=s1:/*,mb:*,ex:*/,:% commentstring=%\ %s
" run interactively
nnoremap <buffer> <LocalLeader>r :! swipl -s %<CR><CR>
" compile
nnoremap <buffer> <LocalLeader>c :call SWIprolog_Compile()<CR>

function! SWIprolog_Compile()
   let b:old_mp = &mp
   setlocal mp=swipl\ --stand_alone=true\ -c\ %
   exe "make\|cw 5\|cc"
   exe "setlocal mp=" . escape(b:old_mp,' ')
endfunction
