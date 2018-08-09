set background=dark
syntax on
filetype indent plugin on
set tabstop=8 expandtab shiftwidth=4 softtabstop=4 modeline
  
set autoindent

set number

if has('syntax') && has('eval')
  packadd matchit
endif

autocmd FileType python map <buffer> <C-\> :call Flake8()<CR>

