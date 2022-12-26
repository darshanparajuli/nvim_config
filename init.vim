let mapleader = "\<Space>"

set encoding=utf-8
set termguicolors
set hidden
set nowrap
set number
set backspace=indent,eol,start
set cursorline
set nocursorcolumn
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent
set ignorecase
set smartcase
set smarttab
set incsearch
set nohlsearch
set ignorecase
set showmatch
set history=1000
set undolevels=1000
set nobackup
set nowb
set noswapfile
set timeoutlen=1000 ttimeoutlen=0
set list
set updatetime=1000
set listchars+=tab:‣\ ,eol:¬,precedes:←,extends:→,nbsp:␣
set cinoptions+=g0,b1
set fillchars+=vert:│
set guicursor+=n-v-c:blinkon1
" set completeopt-=menu
set noshowmode
set ve+=onemore
set splitbelow
set splitright
set tags=.tags;
set timeoutlen=250
set pumheight=10
set signcolumn=number

call plug#begin('~/.local/share/nvim/plugged')

Plug 'breuckelen/vim-resize'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'liuchengxu/vim-which-key'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'yaml', 'html', 'vue'] }
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'slashmili/alchemist.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'timonv/vim-cargo'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'udalov/kotlin-vim'
Plug 'ziglang/zig.vim'
Plug 'itchyny/vim-gitbranch'

call plug#end()

filetype plugin indent on

" color theme {{{
set background=dark
colorscheme onedark
highlight VertSplit guibg=NONE guifg=#616161
highlight Normal guibg=NONE ctermbg=NONE
" highlight Normal guibg=#21242b
highlight NonText gui=bold cterm=bold
highlight ColorColumn ctermbg=236 guibg=#303030
highlight SignColumn guibg=NONE
" }}}

" lightline config {{{
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \     'left': [ [ 'mode', 'paste' ],[ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \ },
      \ 'component': {
      \     'readonly': '%{&readonly?"readonly":""}',
      \     'modified': '%{&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_function': {
      \     'gitbranch': 'gitbranch#name'
      \ },
      \ 'component_visible_condition': {
      \     'readonly': '(&readonly)',
      \     'modified': '(&modified||!&modifiable)'
      \ }
      \ }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '•', 'right': '•' }
" }}}

" super tab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabCompleteCase = "match"
let g:SuperTabCrMapping = 1

" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHighlightCursorline = 0
noremap <leader>N :NERDTreeToggle<cr>

" move line up or down {{{
function! s:swap_lines(n1, n2)
  let line1 = getline(a:n1)
  let line2 = getline(a:n2)
  call setline(a:n1, line2)
  call setline(a:n2, line1)
endfunction

function! s:swap_up()
  let n = line('.')
  if n == 1
    return
  endif

  call s:swap_lines(n, n - 1)
  exec n - 1
endfunction

function! s:swap_down()
  let n = line('.')
  if n == line('$')
    return
  endif

  call s:swap_lines(n, n + 1)
  exec n + 1
endfunction

" nnoremap <silent> <M-k> :call <SID>swap_up()<CR>
" nnoremap <silent> <M-j> :call <SID>swap_down()<CR>
" }}}

" convenient key mappings {{{
noremap ; :
noremap <C-n> :bnext<CR>
noremap <C-p> :bprev<CR>
noremap <leader>c :cclose<CR>
inoremap jk <Esc>

" run make
noremap <F5> :make<CR>

" resize
nnoremap <silent> <C-k> :CmdResizeUp<CR>
nnoremap <silent> <C-j> :CmdResizeDown<CR>
nnoremap <silent> <C-h> :CmdResizeLeft<CR>
nnoremap <silent> <C-l> :CmdResizeRight<CR>

" tag
nnoremap <silent> <leader>d <C-]>

" navigate windows
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
inoremap <C-w>h <C-\><C-N><C-w>h
inoremap <C-w>j <C-\><C-N><C-w>j
inoremap <C-w>k <C-\><C-N><C-w>k
inoremap <C-w>l <C-\><C-N><C-w>l

" navigate quick fix
nnoremap <silent> <leader>n :cnext<CR>
nnoremap <silent> <leader>p :cprevious<CR>

" navigate location list
nnoremap <silent> <leader>ln :lnext<CR>
nnoremap <silent> <leader>lp :lprevious<CR>

" exit terminal
tnoremap <C-Space><C-n> <C-\><C-n>

" exit insert, dd line, enter insert
inoremap <C-d> <esc>ddi

" map capital nav keys
nnoremap H ^
nnoremap L $
nnoremap J 10j
nnoremap K 10k

vnoremap H ^
vnoremap L g_
vnoremap J 10j
vnoremap K 10k

" copy to clipboard
vnoremap <C-c> "+y<CR>

" align blocks
vmap < <gv
vmap > >gv

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo "Location List is Empty."
    return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>
" }}}

" number toggle {{{
function! NumberToggle()
  if (&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc

" nnoremap <leader>n :call NumberToggle()<cr>

" Reselect last selection after paste.
xnoremap p pgvy
" }}}

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty."
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" vim-go settings {{{
let g:go_fmt_command = "goimports"
let g:go_doc_keywordprg_enabled = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "3s"
" }}}

" Ex mode not needed
nnoremap Q <nop>

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" switch between header and source {{{
function! RememberCursorPosition()
  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endfunction

function! SwitchHeaderSource()
  let name = expand('%:t:r')
  let ext = expand('%:e')
  if ext ==? "h"
    let switch_to = name . ".cpp"
  else
    let switch_to = name . ".h"
  endif
  try
    if ext ==? "h"
      exe "tag " . switch_to
    elseif ext ==? "cpp"
      exe "tag " . switch_to
    else
      return
    endif
    call RememberCursorPosition()
  catch
    " Do nothing
  endtry
endfunction

autocmd FileType c,cpp nnoremap <silent> <C-s> :call SwitchHeaderSource()<CR>
" }}}

" java {{{
autocmd BufRead,BufNewFile *.java set cinoptions+=j1
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150
" }}}

" fix inner braces weird highlight
autocmd BufRead,BufNewFile * syn match parens /[(){}]/

" NERDTree ignore files
let NERDTreeIgnore = ['\.o$']

" use rg {{{
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
endif
" }}}

" CtrlP {{{
" Auto cache clearing
function! ClearCtrlPCache()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call ClearCtrlPCache()
endif

" always open new instance
let g:ctrlp_switch_buffer = 0

" ignore files in git
let g:ctrlp_map = '<c-f>'
let g:ctrlp_root_markers = ['pom.xml', 'build.gradle']
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]((\.(git|hg|svn))|build|node_modules|target|.externalNativeBuild|_build|deps|zig-cache)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }
let g:ctrlp_user_command = ['cd %s && rg --files-with-matches ".*"', 'find %s -type f']
" }}}

" vim-rust {{{
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
" }}}

" rust-racer {{{
" au FileType rust nmap <silent> <C-]> <Plug>(rust-def)
" au FileType rust nmap <silent> <C-w><C-]> <Plug>(rust-def-vertical)
" au FileType rust nmap <silent> <C-w>} <Plug>(rust-def-split)
" au FileType rust nmap <silent> <C-k> <Plug>(rust-doc)
" }}}

" autoresize split panes when host resizes
autocmd VimResized * wincmd =

" clang-format {{{
let g:clang_format#auto_format = 0
let g:clang_format#filetype_style_options = {'cpp' : {"Standard" : "C++11"}}
" }}}

" map to <Leader>f in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
" }}}

" haskell {{{
let g:haskell_indent_disable = 1

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 0
let g:haskell_classic_highlighting = 1

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" }}}

" easy align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Gutentags {{{
let g:gutentags_ctags_tagfile = ".tags"
let g:gutentags_enabled = 0
" }}}

" vim-mix-autoformat {{{
" let g:mix_format_on_save = 1
" let g:mix_format_silent_errors = 1
" }}}

" alchemist {{{
let g:alchemist_mappings_disable = 1
au FileType elixir nmap <silent> <C-k> :ExDoc<CR>

function! MixFormat()
  if @% != ""
    execute "!mix format " . expand("%:p")
    :edit
  endif
endfunction

" command! MixFormat call MixFormat()
autocmd BufWritePost *.exs,*.ex silent :call MixFormat()
" }}}

" zig {{{
let g:zig_fmt_autosave = 1
" }}}

" crystal {{{
let g:crystal_auto_format = 1
" }}}

" which key {{{
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" }}}

" prettier {{{
autocmd FileType javascript,typescript,css,less,scss,json,markdown,vue,yaml,html nnoremap <buffer><leader>f :Prettier<CR>
" }}}

" ale {{{
" let g:ale_linters = {'rust': ['analyzer'], 'crystal': ['crystal']}
" let g:ale_rust_cargo_use_check = 0
" let g:ale_linters_explicit = 1
" let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 0
" }}}

" coc {{{
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Map <C-j> and <C-k> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" }}}
