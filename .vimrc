nmap <silent>  ;v  :next $MYVIMRC<CR>

augroup VimReload
        autocmd!
            autocmd BufWritePost  $MYVIMRC  source $MYVIMRC
augroup END


if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif
" causes swap files to be rotated every 10 keystrokes (instead of the default 200). That means 10 keystrokes is as much as I'm ever going to have lost after any -recover
set updatecount=10

syntax on
filetype plugin indent on


highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.xml,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"""" SPACE/TAB DISAMBIGUATION
" size of a hard tabstop
set tabstop=4
" size of an indent
set shiftwidth=4
color desert
set expandtab
set tabstop=4

" Disambiguate tabs from spaces (requires :set list to be seen)
exec "set listchars=tab:>~,nbsp:_,trail:\uB7,nbsp:~"

" To enter command mode, overwrite ":" to ";"
noremap ; :


""" SEARCH SETTINGS """

" highlight search
set hlsearch
" highlight search color
hi Search ctermbg=LightBlue
hi Search ctermfg=black

" Press ESC twice to clear highlighting
nnoremap <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

set smartcase
set ignorecase

""""""""""""""""""""""

" highlight the line containing the cursor
set cursorline

" Make highlighted cursor line green with white text
hi CursorLine   cterm=NONE ctermbg=72 ctermfg=white guibg=darkred guifg=white
" for the cursorline to be visible, enter set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=72 ctermfg=white guibg=darkred guifg=white


set statusline=%F%m%r%h%w\ [fmt=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [unicode=%b\ %B]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ 
set laststatus=2
set ruler

set showmode               " Show current mode in command-line
set showcmd                " Show already typed keys when more are expected.
set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.


function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction


