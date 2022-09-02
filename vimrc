""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/rbgrouleff/bclose.vim'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/mg979/vim-visual-multi'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/Lokaltog/vim-easymotion'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/mhinz/vim-startify'
Plug 'https://github.com/darthmall/vim-vue'
Plug 'https://github.com/bertobc/vim-complex-sensible'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/xolox/vim-misc'
Plug 'https://github.com/xolox/vim-session'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'https://github.com/junegunn/fzf.vim'

" Add plugins to &runtimepath
call plug#end()

" To automaticlly download everything:
"   :PlugInstall
"   :setlocal spell
"   :set spelllang=en_us,es,fr,ca
" To force donwload of English (and avoid some errors in OSX):
" cd .vim/spell/
" wget http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl
" wget http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [BUG] Ignored from vim-complex-sensible, insist here
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS SETUP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
"let g:airline_section_z=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#whitespace#enabled = 0 " Do not check for trailing whitespaces
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
"let NERDTreeWinSize=30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Commenter plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=0
let g:NERDCustomDelimiters = {'python': {'left': '#'}}

""""""""""""""""""""""""""""""
" => Starify plugin
""""""""""""""""""""""""""""""
" Requires the following alias:
"alias vi='vim'


""""""""""""""""""""""""""""""
" => tagbar plugin
""""""""""""""""""""""""""""""
" It needs exuberant-ctags
map <leader>tt :TagbarToggle <CR>
let g:tagbar_compact = 1
let g:tagbar_sort = 0 " Sorted by order of appearence in the file

" Add IDL language support
let g:tagbar_type_idlang = {
    \ 'ctagstype' : 'IDL',
    \ 'kinds'     : [
        \ 'p:procedures',
        \ 'f:functions'
    \ ]
\ }
" NOTE: Create also ~/.ctags with the following content:
"--langdef=IDL
"--langmap=IDL:.pro
"--regex-IDL=/^pro[ \t]+([a-zA-Z0-9_:]+)/\1/p,procedure/i
"--regex-IDL=/^function[ \t]+([a-zA-Z0-9_:]+)/\1/f,function/i


""""""""""""""""""""""""""""""
" => ALE plugin
""""""""""""""""""""""""""""""
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
"" run linters only when I save files
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
" Moving between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_set_signs = 0
let g:ale_set_highlights = 1


""""""""""""""""""""""""""""""
" => vim-visual-multi plugin
""""""""""""""""""""""""""""""
" Use :MultipleCursorsFind pattern
"
" Select a word in visual mode, press C-n to find repetition
let g:VM_theme = 'sand'
let g:VM_highlight_matches = ''
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]   = '<C-j>'
let g:VM_maps["Add Cursor Up"]     = '<C-k>'
let g:VM_maps["Add Cursor At Pos"] = '\\\'
let g:VM_maps["Find Next"] = '<c-n>'
let g:VM_maps["Find Prev"] = '<c-p>'
let g:VM_maps["Skip Region"] = '<c-x>'
let g:VM_maps["Switch Mode"] = '<Tab>' " switch between cursor and extend/visual mode
let g:VM_case_setting = 'sensitive'
let g:VM_use_first_cursor_in_line = 0
let g:VM_skip_shorter_lines = 1
let g:VM_single_mode_auto_reset = 0

""""""""""""""""""""""""""""""
" => Easy motion plugin
""""""""""""""""""""""""""""""
" Require tpope/vim-repeat to enable dot repeat support
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
"
""let g:EasyMotion_keys='hklyuiopnmqwertzxcvbasdgjf'
let g:EasyMotion_keys='asdghklqwertyuiopzxcvbnmfj'
"" With this option set, v will match both v and V, but V will match V only
let g:EasyMotion_smartcase = 1

map f <Plug>(easymotion-s)
map F <Plug>(easymotion-s2)
map t <Plug>(easymotion-bd-t)
map T <Plug>(easymotion-bd-t2)

"" Search with easy motion
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
"" Without these mappings, `n` & `N` works fine. (These mappings just provide
"" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-bd-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-s2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-bd-jk)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-bd-w)
map  <Leader>e <Plug>(easymotion-bd-e)
nmap <Leader>e <Plug>(easymotion-bd-e)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrlp.Vim plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
map  <Leader>o :CtrlPLine<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimSession plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs :SaveSession<cr>
nnoremap <leader>go :OpenSession<cr>
nnoremap <leader>gd :DeleteSession<cr>
:let g:session_autosave = 'no'
:let g:session_default_overwrite = 1


""""""""""""""""""""""""""""""
" => fzf plugin
" => vim-visual-multi plugin
""""""""""""""""""""""""""""""
nmap <C-t> :Files<CR>


" Changing cursor shape per mode
" " 1 or 0 -> blinking block
" " 2 -> solid block
" " 3 -> blinking underscore
" " 4 -> solid underscore
" if exists('$TMUX')
"     " tmux will only forward escape sequences to the terminal if surrounded
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[1 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI .= "\<Esc>[5 q"
    let &t_EI .= "\<Esc>[1 q"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endif


" Changing to auto paste automatically
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

