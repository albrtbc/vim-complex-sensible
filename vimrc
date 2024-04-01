"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/rbgrouleff/bclose.vim'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/mg979/vim-visual-multi'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/Lokaltog/vim-easymotion'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/mhinz/vim-startify'
Plug 'https://github.com/darthmall/vim-vue'
Plug 'https://github.com/albrtbc/vim-complex-sensible'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/xolox/vim-misc'
Plug 'https://github.com/xolox/vim-session'
Plug 'https://github.com/sunaku/vim-shortcut'
"Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/github/copilot.vim'

" Add plugins to &runtimepath
call plug#end()
runtime plugin/shortcut.vim

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
Shortcut Open NerdTree menu
      \ noremap <silent> <Leader>nf :Shortcuts<CR>
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
Shortcut Select a word in visual mode and find repetition
      \ noremap <silent> <c-n> :Shortcuts<CR>
let g:VM_theme = 'lightpurple1'
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
let g:EasyMotion_keys='asdghklqwertyuiopzxcvbnmfj'
"" With this option set, v will match both v and V, but V will match V only
let g:EasyMotion_smartcase = 1

Shortcut Enable easymotion to search a char and position there
      \ noremap <silent> f :Shortcuts<CR>
map f <Plug>(easymotion-s)
map F <Plug>(easymotion-s2)
map t <Plug>(easymotion-bd-t)
map T <Plug>(easymotion-bd-t2)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrlp.Vim plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Shortcut Open search file in current directory
      \ noremap <silent> <C-t> :Shortcuts<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
map  <Leader>o :CtrlPLine<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimSession plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Shortcut Save Session
      \ noremap <silent> <leader>gs :Shortcuts<CR>
Shortcut Open Session
      \ noremap <silent> <leader>go :Shortcuts<CR>
Shortcut Delete Session
      \ noremap <silent> <leader>gd :Shortcuts<CR>
nnoremap <leader>gs :SaveSession<cr>
nnoremap <leader>go :OpenSession<cr>
nnoremap <leader>gd :DeleteSession<cr>
:let g:session_autosave = 'no'
:let g:session_default_overwrite = 1

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

" Jumping in historic positions list
" Type +1 to jump newer -1/1 to jump older
" Also you can use g; and g, to move bakcward and forward in your edit
" locations.
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

Shortcut Jumps backward
      \ noremap <silent> <C-o> :Shortcuts<CR>
Shortcut Jumps forward
      \ noremap <silent> <C-i> :Shortcuts<CR>
Shortcut Open list to jump backward or forward
      \ noremap <silent> <leader>- :Shortcuts<CR>
nmap <leader>- :call GotoJump()<CR>

" Shortcuts helper definitions
Shortcut show shortcut menu and run chosen shortcut
      \ noremap <silent> <Leader><Leader> :Shortcuts<CR>

" When in visual mode (v), replace the paste command (p) with a command that     
" deletes the selected text into the black hole register ("_d) before pasting (P).
" This prevents the selected text from overwriting the contents of the unnamed register.
vnoremap p "_dP  

" Copy to clipboard                                                              
set clipboard=unnamedplus
