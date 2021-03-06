" vimrc
" Maintainer:   Pat Henning  <pat at gmail dot com>
" URL:          http://my.website.com
" Last Edit:    Fri Sep 26 08:40:17 EDT 2014
" Credits:      Amir Salihefendic - http://amix.dk - amix@amix.dk
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set history=700

filetype plugin on
filetype indent on

set number

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" Highlight search text as you type
set incsearch

set textwidth=80

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Helpful for navigating filesystem with :e <tab>, :e <shift-tab>
set wildmenu
set wildmode=list:longest,full

" Among other things I don't understand, allows switching buffers without
" saving first.
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

syntax enable

" Find at: http://www.vim.org/scripts/script.php?script_id=2465 
colorscheme wombat256mod

"hi LineNr ctermfg=gray

"hi clear Comment
"hi Comment cterm=italic gui=italic ctermfg=darkgray

"hi clear String
"hi String cterm=italic gui=italic

hi clear SpellBad
hi SpellBad ctermbg=white ctermfg=black

" Having trouble getting this working
"hi clear Search
"hi Search cterm=NONE ctermbg=yellow ctermfg=black

" Highlight column 80. Seems to need setting _after_ colorscheme
set colorcolumn=72,80

"hi clear ColorColumn
hi ColorColumn ctermfg=241 ctermbg=232 guifg=#857b6f guibg=#080808

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces for tabs
set expandtab

" Not sure what this does, but it says it's smart...
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto-indent
set ai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Height of command bar
" set cmdheight=2

" Always show status line
set laststatus=2

set statusline=%n\ %F%r%h%m%=%c\ %l/%L

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" Toggle line numbers. Useful for copy/paste
map <leader>n :set number!<CR>

" Toggle spellcheck
map <leader>s :setlocal spell!<CR>

" Insert timestamp
map <leader>t :r !date<CR>

" Toggle syntax highlighting. Troubling side-effect of botching
" some syntax stuff when turning syntax back on.
" Haven't figured out solution.
function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        so %
        syntax on 
    endif
endfunction
" ^ ^ ^
map <leader>c :call ToggleSyntax()<CR>

" I really like this!
" <Space>b to list buffers
" <Enter> to close or <Number><Enter> to go to that buffer.
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Previous/Next buffer
map <leader>, :bp<CR>
map <leader>. :bn<CR>

" Delete buffer/Close file and remove split.
map <leader>r :bd<CR>

" Delete buffer/Close file and keep split.
" Doesn't work with only one buffer left. Also deletes splits.
map <leader>d :bp\|bd #<CR>

" Open file in new buffer. Try it with <Tab> to navigate filesystem.
map <leader>o :e<Space>

" Write/Save file
map <leader>w :w<CR>

" Run current file as python script
map <leader>r :!python %<CR>

" Create horizontal/vertical split
map <leader>- :split<CR>
map <leader>\ :vsplit<CR>

" Go left/right/up/down a window
map <leader>h <c-w>h
map <leader>l <c-w>l
map <leader>k <c-w>k
map <leader>j <c-w>j

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Magic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files.
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
