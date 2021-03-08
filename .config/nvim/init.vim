" no compatible at the very start
set nocompatible
set nomodeline

" if posix is needed uncomment this
if &shell =~# 'fish$'
    set shell=/bin/sh
endif

" Automatic installation  of plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !mkdir -p ~/.local/share/nvim/plugged
    silent !mkdir -p ~/.local/share/nvim/site/autoload
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

" base
Plug 'tpope/vim-eunuch'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'svermeulen/vim-yoink'

" navigation
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'

" editing
Plug 'machakann/vim-sandwich'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'matze/vim-move'
Plug 'mboughaba/vim-lessmess'

" language support
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-afterimage'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

" cosmetics
Plug 'ap/vim-css-color'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'dikiaap/minimalist'
"Plug 'chriskempson/base16-vim'

call plug#end()

" turn on syntax detection
filetype plugin indent on
syntax on

" generate help for plugins
silent! helptags ALL

" disable swap files
set noswapfile

" disable backup files
set nobackup
set nowritebackup

" automatically change cwd to the one of the current open file
set autochdir

set complete-=t     " disable searching tags
set termguicolors   " enable 24 bit colors
set hidden          " buffers don't need to be saved to switch
set nowrap          " don't wrap lines
set shiftround      " use multiple of sw when indenting with '<' and '>'
set showmatch       " set show matching parenthesis
set number          " line numbers
set smartcase       " ignore case if all lowercase, case-sensitive otherwise
set undolevels=1000 " use many muchos levels of undo
set novisualbell    " don't flash
set noerrorbells    " don't beep
set diffopt+=vertical " vertical layouts in diffs
set colorcolumn=80  " renders a column at 80 characters

" buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
nmap <C-1>1 <Plug>BufTabLine.Go(1)
nmap <C-2>2 <Plug>BufTabLine.Go(2)
nmap <C-3>3 <Plug>BufTabLine.Go(3)
nmap <C-4>4 <Plug>BufTabLine.Go(4)
nmap <C-5>5 <Plug>BufTabLine.Go(5)
nmap <C-6>6 <Plug>BufTabLine.Go(6)
nmap <C-7>7 <Plug>BufTabLine.Go(7)
nmap <C-8>8 <Plug>BufTabLine.Go(8)
nmap <C-9>9 <Plug>BufTabLine.Go(9)

" working with buffers
let g:BufKillOverrideCtrlCaret = 1
nnoremap <C-u> :bp<CR>
nnoremap <C-i> :bn<CR>
nnoremap <C-c> :BD<CR>
nnoremap <C-q> :bd<CR>

" change the mapleader from \ to spacebar
let g:mapleader = "\<SPACE>"

" should be done before Nerdtree start, at least its in the docs
autocmd StdinReadPre * let s:std_in=1

" nerdtree setting stuff
nmap <silent> <leader>f :NERDTreeToggle<CR>
nmap <silent> <leader>ff :NERDTreeFind<CR>
nmap <silent> <leader>F :NERDTree<CR>
let NERDTreeHijackNetrw = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2

" open on startup
autocmd VimEnter * if !argc()
      \ |   exe 'Startify'
      \ |   NERDTree
      \ |   wincmd w
      \ | endif

" quit if no files left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
      \ | q
      \ | endif

" quickly edit the vimrc file
nmap <silent> <leader>c :e $MYVIMRC<CR>

" quickly reload the vimrc file
nmap <silent> <leader>r :source $MYVIMRC<CR>

" turn off highlighting after compeleting a search
nmap <silent> <leader>/ :nohlsearch<CR>

" map escape to a more comfortable position
imap jj <Esc>

" open Startify window
nmap <silent> <leader>z :Startify<cr>

" tab settings
set preserveindent " Preserve indent structure when changing indent level
set copyindent     " Copy the indent level of previous lines
set tabstop     =2 " The width of a \t is to 2.
set shiftwidth  =2 " Indents will have a width of 2
set softtabstop =2 " Sets the number of columns for a \t
set mouse=a        " I think it activates mouse mode for all something
set expandtab

" folding
let g:xml_syntax_folding = 0
set foldmethod=manual
set foldlevelstart=99

" splitjoin settings
let g:splitjoin_trailing_comma = 1

" Global colorization
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:enable_bold_font = 1
let g:enable_italic_font = 1

" set theme
colorscheme minimalist

" disable default EasyMotion mappings
let g:EasyMotion_do_mapping = 0

" Jump to anywhere you want with minimal keystrokes
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" replaces hybrid number+relativenumber mode
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" by default only - is a word separator
set iskeyword-=_

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" open current file on browser
nnoremap <leader>o :exe ':silent !firefox-beta %'<CR>

" disable polyglot to allow more specific language plugins
" let g:polyglot_disabled = ['jsx','javascript','javascript.jsx', 'styled-components']

" Yank text to clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" lightline

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'readonly', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \           [ 'cocstatus', 'percent' ],
      \           [ 'fileformat', 'filetype'] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" disable annoying man page shortcut
nnoremap <S-k> <Nop>

" vim-startify
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_dir = 0

" vim-yoink
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" quick-scope
" trigger a highlight in the appropriate direction when pressing these keys
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" only use cursor line when in the current window and not when being in insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" correctly format highlight jsonc configuration language
autocmd FileType json syntax match Comment +\/\/.\+$+

" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

"
" Language Server configuration
"

" default is 4000 ms = 4 s leads to noticeable delays and poor user experience
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
