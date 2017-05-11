" set encoding=utf8

set number
set ruler

"exit :term
:tnoremap <C-\> <C-\><C-n>
"Still use :E with plugins
:command E Explore
"*Practical Vim
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set termguicolors " enable true colors, only for >= v0.1.5

" change search (:grep) to ag
set grepprg=ag\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'		"colorscheme
Plug 'othree/yajs.vim'			"Javascript syntax
Plug 'fatih/vim-go'			"All things golang
Plug 'neomake/neomake'			"Linting
Plug 'tpope/vim-commentary'		"Comment code
Plug 'editorconfig/editorconfig-vim'	"Pick up .editorconfig
Plug 'sbdchd/neoformat'			"Beautifier
Plug 'mxw/vim-jsx'			"JSX syntax
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'othree/es.next.syntax.vim'	"ES7 syntax
Plug 'mattn/emmet-vim'			"exapnding abbrevations

" Add plugins to &runtimepath
call plug#end()

" Theme
syntax enable
colorscheme OceanicNext

 " Neomake
" let g:neomake_logfile = '/usr/local/var/log/neomake.log'
if executable('./node_modules/.bin/eslint')
  let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
  let g:neomake_javascript_enabled_makers = ['eslint']
endif

autocmd! BufWritePost * Neomake
let g:neomake_open_list=2

" deoplete
let g:deoplete#enable_at_startup = 1
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" vim-go
let g:go_fmt_command = "goimports"

" vim-jsx
let g:jsx_ext_required = 0 " https://github.com/avajs/ava/issues/631
