"/------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: trungbat <https://codewithbat.com>
" URL: https://github.com/batTrung/dotfiles/blob/master/vimrc
"------------------------------------------------------------------------------

"=====================================================
"===================== PLUGINS =======================

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                   " Plugin Management
Plugin 'gruvbox-community/gruvbox' 		" Background Theme
Plugin 'scrooloose/nerdtree'       		" Explorer Files & Folders
Plugin 'vim-airline/vim-airline'		" Status tabline
Plugin 'mattn/emmet-vim'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plugin 'tpope/vim-commentary'
Plugin 'cohama/lexima.vim'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'AndrewRadev/splitjoin.vim'

call vundle#end()

"=====================================================
"===================== GENRENAL ======================

set nocompatible
filetype plugin indent on

syntax on
colorscheme gruvbox
set background=dark
set noerrorbells             			" No beeps
set hlsearch					" highlight all search results
set ignorecase					" Search case insensitive...
set smartcase					" ... but not it begins with upper case 
set number					" display line number
set relativenumber
set cursorline					" highlight current column
set nocursorcolumn           			" speed up syntax highlighting
set ttyfast             			" Improves redrawing for newer computers.
set lazyredraw          			" Don't redraw during complex operations (e.g. macros).
set autowrite           			" Automatically save before :next, :make etc.
set hidden              			" Allow switching edited buffers without saving.
set nostartofline       			" Keep the cursor in the current column with page cmds.
set showcmd             			" Show (partial) command in the status line.
set noshowmatch              			" Do not show matching brackets by flickering
set showmode            			" Show the current mode.

set laststatus=2        			" Always display a statusline.
set noruler             			" Since I'm using a statusline, disable ruler.
set statusline=%<%f                          	" Path to the file in the buffer.
set statusline+=\ %h%w%m%r%k                 	" Flags (e.g. [+], [RO]).
set statusline+=\ [%{(&fenc\ ==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")},%{&ff}] " Encoding and line endings.
set statusline+=\ %y                         	" File type.
set statusline+=\ [\%03.3b,0x\%02.2B,U+%04B] 	" Codes of the character under cursor.
set statusline+=\ [%l/%L\ (%p%%),%v]         	" Line and column numbers.

set encoding=utf-8              		" Set default encoding to UTF-8
set autoread                    		" Automatically reread changed files without asking
						" me anything
set autoindent					" Indent a new line according to the previous one.
set nosmartindent       			" Turn off smartindent.
set backspace=indent,eol,start  		" Makes backspace key more powerful.
set incsearch                   		" Shows the match while typing
set hlsearch                    		" Highlight found searches
set mouse=a                     		"Enable mouse mode
set wildmenu					" Better command-line completion

set noswapfile					" Don't use swapfile
set nobackup					" Don't create annoying backup files
set nowritebackup       			" Disable auto backup before overwriting a file.

set splitright					" Split vertical windows right to the current windows
set splitbelow					" Split horizontal windows below to the current windows

set shiftwidth=2
set softtabstop=2
set expandtab

set history=1000        			" Number of lines of command line history

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed 			" copy to the system clipboard

  if has("unnamedplus") 			" X11 support
    set clipboard+=unnamedplus
  endif
endif


"=====================================================
"===================== MAPPING =======================

let mapleader = ","

noremap <space> :
noremap <Leader>w :w<CR>			" <Space> + w to write file
noremap <leader>q :q<CR>			" <Space> + q to quit file
noremap <leader>a :qa<CR>			" <Space> + a to quit all file
noremap <leader>o :only<CR>			" <Space> + o to quit all file, keep only current file
noremap <leader>, GA<Enter>			" <Space> + , to add new blank line to end of file
noremap <leader>z <C-z>
map <C-c> "+y					" <Space> + w to copy selected text to clipboard
map <C-p> "+p					" <Space> + w to paste copied text from clipboard
map <C-l> "+Y					" <Space> + w to copy current line to clipboard

" Remove search highlight
function ClearHighlight()
let @/ = ""
endfunction
noremap <silent> <Leader>h :call ClearHighlight()<CR>	" <Space> + h to clear highlight

" Insert Mode
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-e> <C-o>de
inoremap <C-b> <C-o>D
inoremap <C-v> <ESC>yypa
inoremap <C-s> <ESC>:w<CR>a
inoremap <C-x> <C-o>x
inoremap <C-a> <ESC>ciw
inoremap <C-z> <ESC><C-z>

" Buffer command
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" ESC
inoremap jk <esc>
vnoremap jk <esc>

" Turn off arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"=====================================================
"===================== CUSTOM PLUGINS ================

" ==================== nerdtree ======================
noremap <leader>n :NERDTreeToggle<CR>

" ==================== vim-airline ===================

" ==================== vim-fugitive ==================

" ==================== vim-gitgutter =================

" ==================== emmet-vim =====================

" ==================== vim-surround ==================

" ==================== fzf.vim =======================
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-p>p :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>g :Commits<CR>
nnoremap <silent> <leader>hh :History<CR>
nnoremap <silent> <leader>h: :History:<CR>
nnoremap <silent> <leader>h/ :History/<CR>

