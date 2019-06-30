""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"              o8o                                         "
"              `"'                                         "
" oooo    ooo oooo  ooo. .oo.  .oo.   oooo d8b  .ooooo.    "
"  `88.  .8'  `888  `888P"Y88bP"Y88b  `888""8P d88' `"Y8   "
"   `88..8'    888   888   888   888   888     888         "
"    `888'     888   888   888   888   888     888   .o8   "
"     `8'     o888o o888o o888o o888o d888b    `Y8bod8P'   "
"                                                          "
"                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""" GLOBAL """
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif




""" Plugins: (using vim-plug) """
if ! filereadable(expand('~/.vim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.vim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
endif

call plug#begin('~/.vim/plugged')

  Plug 'Yggdroot/indentLine'
  Plug 'davidhalter/jedi-vim', {'for': 'python'}
  "Plug 'ervandew/supertab'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
  Plug 'terryma/vim-multiple-cursors'
  Plug 'morhetz/gruvbox'


call plug#end()
"Vim's native .vim overrides are stored in ~/.vim/after/ftplugin


""" Keymaps: """
" :map and :noremap are recursive and non-recursive versions of the various mapping commands. What that means is that if you do:

":map j gg
":map Q j
":noremap W j

"j will be mapped to gg. Q will also be mapped to gg, because j will be expanded for the recursive mapping. W will be mapped to j (and not to gg) because j will not be expanded for the non-recursive mapping.

let mapleader = ','

" sorting
vnoremap <Leader>s :sort<CR>

" copy-pasting like it's no one's biz
vnoremap <C-c> "+y
"imap <C-v> <ESC>"+pa
nnoremap c "_c

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Making j and k behave friendlier
map j gj
map k gk

" do indents with tabs cool yea ahuh
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv
inoremap <S-Tab> <C-d>

" saving and quitting
map q :q
map Q :wq

"highlights
map <leader>/ :noh<CR>



""" Visual configs: """

syntax on
set encoding=utf-8
set bg=dark
set number " produces hybrid numbers (absolute on cursor\
                                " and relative around it thanks to the\
                                " function below
" auto function to toggle between hybrid and absolute depending on mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" load indentation rules and plugins according to the detected filetype.
" you need to have file type detection enabled. Enter the command 
" :filetype to determine whether detection is enabled on your system. 
" On some Linux distributions, file type detection is disabled, in which 
" case you should add:

"if has("autocmd")
"  filetype plugin indent on
"endif

" 265 colors (URxvt)
set t_Co=256

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"colorscheme molokai
"let g:molokai_original = 1 "original monokai scheme
"let g:rehash256 = 1 "more accurate 256 colors for monokai

" Splits are usually to the left and up, fix that
set splitbelow splitright


" Set your listchars
set nolist
set lcs=extends:>,precedes:<,trail:·
set lcs-=eol
set et

let g:indentLine_char = '┊'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_enabled = 0
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_faster = 1 



""" Functional configs: """

" disable the annoying file~ backups
set nobackup

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi.
" They are highly recommended though.
set showcmd      " Show (partial) last command in status line. Important for things like registers
set showmatch    " Show matching brackets. test [here]
set smartcase    " Do smart case matching
set incsearch    " Incremental search
set hlsearch     " Highlight search matches
set mouse=a      " Enable mouse usage (all modes)
"set cursorline  " Enable current line highlighting, only good for block cursors
set wildmenu     " Enable visual <tab> autocompletion
set lazyredraw   " Only redraw screen when you have to. Performance boost baby

" Sudo write hack with tee > shortcut w!!
cmap w!! w !sudo tee > /dev/null %


