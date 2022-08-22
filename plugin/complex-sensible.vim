
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Instead of <Esc> key for leaving insert mode
"inoremap jk <ESC>

" Allow the use of '.' to repeat last command for all lines in visual selections
vnoremap . :norm.<CR>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Correct typical mistakes (capital letters)
nmap :W :w
nmap :Q :q
nmap q: :q
nmap :WQ :wq
nmap :wQ :wq
nmap :Wq :wq
nmap :Qa :qa
nmap :QA :qa
nmap :qA :qa

"" Tab indentation in other modes and shift-tab for unidenting
" for command mode
nmap <S-Tab> <
" for insert mode
imap <S-Tab> <Esc><<i
" for visual mode
vmap <S-Tab> <gv
vmap <Tab> >gv

" Toogle mouse
nnoremap <leader>tm :call ToggleMouse()<CR>

" Troggle wrapping
" - For moving within wrapped lines use g[cursor] in normal mode
map <leader>tw :set nowrap! <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change term if vim is inside screen or some ctrl key combinations (ctrl+arrows)
" will not work BUT them some other do not work (i.e. home - real beginning of line) 
"if match($TERM, "screen")!=-1 
    "set term=xterm 
"endif

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu. Try it using:
" - :b <Tab>
" - :e <Tab>
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
" - Needed for Bclose plugin to work well
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Show line number
set nonumber
"set number
"set relativenumber

" Activate mouse
"set mouse=a
set mouse=

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set vb


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    try
        colorscheme koehler
        "colorscheme default
    catch
    endtry
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    " Activate mouse
    set mouse=a
    "set mouse=
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Monaco:h15
    set shell=/bin/bash
elseif has("win16") || has("win32")
    set gfn=Bitstream\ Vera\ Sans\ Mono:h12
elseif has("linux")
    set guifont=Monospace\ 11
    set shell=/bin/bash
else
    set guifont=Monospace\ 11
    set shell=/bin/bash
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/undodir
    set undofile
    set undolevels = 1000 "maximum number of changes that can be undone
    set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
"set lbr
"set tw=500

set autoindent "Auto indent
" indent depending on the filetype
"set smartindent
set nosmartindent
filetype indent on

set wrap "Wrap lines

try
    " Mark at 80 characters
    set colorcolumn=81
catch
endtry

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shift+arrows in insert mode make selections
set selectmode=key
set keymodel=startsel

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Home go to first letter in the line and not the literal beginning of line
map <Home> ^
imap <Home> <Esc>^i
map 0 ^

" Treat long lines as break lines (useful when moving around in them)
map <Down> gj
map <Up> gk

"" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <M-Down> <C-W>j
map <M-Up> <C-W>k
map <M-Left> <C-W>h
map <M-Right> <C-W>l

" Buffer shortcuts
nmap <C-Left> :bprevious!<cr>
nmap <C-Right> :bnext!<cr>
nmap <C-p> :bprevious!<cr>
nmap <C-n> :bnext!<cr>
" Close the current buffer (also mapped to <leader>bd in the same 'bclose'
" plugin)
map <leader>bc :Bclose<cr>

" Quickly open a buffer for scripbble
"map <leader>q :e ~/buffer<cr>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"set viminfo='10,\"100,:20,%,n~/.viminfo
set viminfo='10,\"100,:20,n~/.viminfo


""""""""""""""""""""""""""""""
" => Share clipboard with Operating System
""""""""""""""""""""""""""""""
"set clipboard=unnamed " Clipboard linked to the mouse
"set clipboard=unnamedplus " Clipboard linked to the keyboard (ctrl+p/v)
"set clipboard=unnamed,unnamedplus " Both clipboards


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"" In case the Powerline or Airline plugin is installed:
set nocompatible   " Disable vi-compatibility
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
"let g:Powerline_stl_path_style ='relative'




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.pyx :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To automaticlly download dictionaries:
"   :set spelllang=en_us,es,fr,ca
"   :setlocal spell
" To force donwload of English (and avoid some errors in OSX):
" cd .vim/spell/
" wget http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl
" wget http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Pressing ,ll will switch throught the list of languages
let g:myLangList=["en_gb", "es_es", "ca", "fr"]
map <leader>ll :call ChangeSpellLang()<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"set spelllang=en_us,en_gb,es_es,fr,ca
set spelllang=en_gb

hi clear SpellBad
hi SpellBad cterm=underline,bold

" Enable spellchecking for markdown, txt and tex files automatically
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=text
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell
autocmd FileType tex setlocal spell



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""
" => :Explore
""""""""""""""""""""""""""""""
" Open file in current window
let g:netrw_browse_split=0

" Hide files
let g:netrw_hide=1

" Files to be hidden (comma separated)
let g:netrw_list_hide='^\..*'

" Long list mode (details)
let g:netrw_longlist=1

" Sort by name, time or size
let g:netrw_sort_by="name"

" Sorted in a normal or reverse
let g:netrw_sort_direction="normal"
""""""""""""""""""


" Search things usual way using /something
" Hit cs, replace first match, and hit <Esc>
" Hit n.n.n.n.n. reviewing and replacing all matches
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>


" c-p completion colors
highlight Pmenu ctermbg=lightyellow ctermfg=black gui=bold
highlight PmenuSel ctermbg=black ctermfg=white gui=bold


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword True None False self

"au FileType python map <buffer> F :set foldmethod=indent<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
" - Delete the buffer; keep windows; create a scratch buffer if no buffers left
" - Needed: buffer should become hidden when it is abandoned
set hidden
" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

" Change spell language
function! ChangeSpellLang()
    let b:myLang=index(g:myLangList, &spelllang)
    if &spell
        let b:myLang=b:myLang+1
        if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
    endif
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                  
" => Vim Complex-sensible                                                        
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                  
" Auto-fold docstrings                                                           
autocmd FileType python setlocal foldenable foldmethod=syntax                    
set foldtext=getline(v:foldstart+1)  

