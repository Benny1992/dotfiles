scriptencoding utf-8
set encoding=utf-8

" Using fish as shell breaks Vundle -> set shell
set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'https://github.com/avakhov/vim-yaml.git'
Plugin 'tpope/vim-surround'
Plugin 'gabrielelana/vim-markdown'
Plugin 'janko-m/vim-test'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'prophittcorey/vim-flay'
Plugin 'mkitt/tabline.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'ngmy/vim-rubocop'

call vundle#end()

syntax on                         " show syntax highlighting
filetype off
filetype indent on

set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set sw=2
set sts=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set cursorcolumn
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamedplus             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set encoding=utf-8                " The encoding displayed.
set fileencoding=utf-8            " The encoding written to file.
set synmaxcol=800                 " don't highlight lines longer than 800
set noshowmode

noremap <ScrollWheelUp>      <nop>
noremap <S-ScrollWheelUp>    <nop>
noremap <C-ScrollWheelUp>    <nop>
noremap <ScrollWheelDown>    <nop>
noremap <S-ScrollWheelDown>  <nop>
noremap <C-ScrollWheelDown>  <nop>
noremap <ScrollWheelLeft>    <nop>
noremap <S-ScrollWheelLeft>  <nop>
noremap <C-ScrollWheelLeft>  <nop>
noremap <ScrollWheelRight>   <nop>
noremap <S-ScrollWheelRight> <nop>
noremap <C-ScrollWheelRight> <nop>

" put useful info in status bar
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

syntax enable

" let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256 " 256 color mode
set background=dark

" colorscheme smyck
colorscheme base16-railscasts

syn match Todo "@todo" "@TODO" TODO todo contained

" set up some custom colors
" highlight clear SignColumn
highlight ColorColumn  ctermbg=1
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermfg=2 cterm=bold ctermbg=235
highlight CursorLine   ctermbg=235
highlight CursorColumn ctermbg=235
" highlight StatusLine ctermfg=235 ctermbg=2
" highlight SpecialKey ctermbg=green ctermfg=white
" highlight Search ctermfg=green
" highlight Visual ctermfg=black
" highlight ErrorMsg ctermbg=red ctermfg=white
" highlight Todo ctermfg=2 ctermbg=235 cterm=bold

" set leader key to comma
let mapleader = ","

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_show_hidden = 1

" die hash rockets, die!
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

" map markdown preview
map <leader>m :!open -a Marked %<cr><cr>

noremap <leader>dup :Flay<CR>

" map git commands
map <leader>log :!clear && git log -p %<cr>
map <leader>dif :!clear && git diff %<cr>

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" execute current file
map <leader>e :call ExecuteFile(expand("%"))<cr>

" execute file if we know how
function! ExecuteFile(filename)
  :w
  :silent !clear
  if match(a:filename, '\.rb$') != -1
    exec ":!ruby " . a:filename
  elseif match(a:filename, '\.js$') != -1
    exec ":!node " . a:filename
  elseif match(a:filename, '\.sh$') != -1
    exec ":!bash " . a:filename
  else
    exec ":!echo \"Don't know how to execute: \"" . a:filename
  end
endfunction

" jump to last position in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
imap <S-Up> <nop>
imap <S-Down> <nop>
vmap <S-Up> <nop>
vmap <S-Down> <nop>
nmap <S-Up> <nop>
nmap <S-Down> <nop>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:syntastic_ruby_checkers = ['rubocop', 'reek']
let g:syntastic_javascript_checkers = ['jshint']

let g:flay_on_open=0
let g:flay_on_save=1
let g:flay_minimum_mass=10
let g:flay_piet_text="✗"

hi SpellBad ctermfg=0 ctermbg=2
hi SpellCap ctermfg=0 ctermbg=2

set linespace=0

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green ctermbg=0
highlight GitGutterChange ctermfg=yellow ctermbg=0
highlight GitGutterDelete ctermfg=red ctermbg=0
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=0

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
