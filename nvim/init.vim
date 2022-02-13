packadd minpac

if exists('g:loaded_minpac')
    function! PackInit() abort
        call minpac#init()
        call minpac#add('k-takata/minpac', {'type': 'opt'})
        call minpac#add('rrethy/vim-hexokinase', { 'do': 'make hexokinase' })
    endfunction

    let g:Hexokinase_highlighters = [ 'virtual' ]

    command! PackUpdate call PackInit() | call minpac#update()
    command! PackClean  call PackInit() | call minpac#clean()
    command! PackStatus packadd minpac | call minpac#status()
endif

set clipboard=unnamedplus
set number
set termguicolors
