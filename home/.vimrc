""""""""""""""""
"Vim config file
""""""""""""""""




""" Boring stuff:

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
let g:skip_defaults_vim = 1


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible "If you want to suffer with vi's outdated interface, masochist.







""" Visual configs:

syntax on "Syntax colour highlighting (why would you ever disable this)
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Show numbers
set number " produces hybrid numbers (absolute on cursor\
				" and relative around it

" auto function to toggle between hybrid and absolute depending on mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Powerline settings
" initialize powerline
" set rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim/

" Always show statusline
" set laststatus=2


" 265 colors (URxvt)
set t_Co=256
" Set colorscheme
"colorscheme molokai
"let g:molokai_original = 1 "original monokai scheme
let g:rehash256 = 1 "more accurate 256 colors for monokai






""" Functional configs:

" load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi.
" They are highly recommended though.
set showcmd		" Show (partial) last command in status line. Important for things like registers
set showmatch		" Show matching brackets. test [here]
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch		" Highlight search matches
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
"set cursorline		" Enable current line highlighting, only good for block cursors
set wildmenu		" Enable visual <tab> autocompletion
set lazyredraw 		" Only redraw screen when you have to. Performance boost baby

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Sudo write hack with tee > shortcut w!!
cmap w!! w !sudo tee > dev/null %

