"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/rbgrouleff/bclose.vim.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/rust-lang/rust.vim.git'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/Lokaltog/vim-easymotion'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/mhinz/vim-startify.git'
Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/darthmall/vim-vue'
Plug 'https://github.com/bertobc/vim-complex-sensible.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/xolox/vim-misc'
Plug 'https://github.com/xolox/vim-session'

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
" => gitgutter plugin
 """"""""""""""""""""""""""""""
 let g:gitgutter_enabled = 0
 map <Leader>gg :GitGutterToggle<cr>


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
map <leader>at :ALEToggle<CR>
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
map <leader>at :ALEToggle<CR>
let g:ale_set_signs = 0
let g:ale_set_highlights = 1"


""""""""""""""""""""""""""""""
" => vim-multiple-cursors plugin
""""""""""""""""""""""""""""""
" Use :MultipleCursorsFind pattern
"
" Select a word in visual mode, press C-n to find repetition and press c to
" change or other vim
let g:multi_cursor_next_key='<C-n>' " Next
let g:multi_cursor_prev_key='<C-p>' " Previous
let g:multi_cursor_skip_key='<C-x>' " Discard current
let g:multi_cursor_quit_key='<Esc>'
" In Insert mode will not quit
" and delete all existing cursors. This is useful if you want to press Escape
" and go back to Normal mode, and still be able to operate on all the cursors.
let g:multi_cursor_exit_from_insert_mode = 0


""""""""""""""""""""""""""""""
" => fzf plugin
""""""""""""""""""""""""""""""
nmap <Leader>zz :Buffers<CR>
nmap <Leader>zf :Files<CR>
" Commands
"Files [PATH]	Files (similar to :FZF)
"GFiles [OPTS]	Git files (git ls-files)
"GFiles?	Git files (git status)
"Buffers	Open buffers
"Colors	Color schemes
"Ag [PATTERN]	ag search result (ALT-A to select all, ALT-D to deselect all)
"Tags [QUERY]	Tags in the project (ctags -R)
"BTags [QUERY]	Tags in the current buffer
"Marks	Marks
"Locate PATTERN	locate command output
"History	v:oldfiles and open buffers
"History:	Command history
"History/	Search history

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


""""""""""""""""""""""""""""""
" => Latex-Box plugin
""""""""""""""""""""""""""""""
" * Requires latexmk (apt-get install latexmk)
"let g:LatexBox_quickfix = 0 " The quickfix is not opened automatically
let g:LatexBox_quickfix = 1 " The quickfix window is opened automatically and it becomes active
let g:LatexBox_show_warnings = 0 " If set to 1, warnings in compilation will be listed as errors.
"let g:LatexBox_ref_pattern  = '\C\\v\?\(eq\|page\|[cC]\)\?ref\*\?\_\s*{' " Default
let g:LatexBox_ref_pattern  = '\C\\v\?\(eq\|page\|[cC]\)\?\(ref\|sect\|tab\|fig\)\*\?\_\s*{' " Include also \sect, \tab and \fig
" Compilation:
"<LocalLeader>ll Compile with latexmk.
"<LocalLeader>lc Clean temporary output from LaTeX
"<LocalLeader>lv View output file.
"<LocalLeader>lt Open a table of contents.
" Autocompletion:
"\cite{<CTRL-X><CTRL-O>
"\ref{sec:<CTRL-X><CTRL-O>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]
"<Leader>ww : Select first available.
"<Leader>ws : List and select available wikis.
"<C-Space> : Toggle todo list element

let g:vimwiki_conceallevel = 0


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

