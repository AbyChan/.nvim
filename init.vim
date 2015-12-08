if !has('nvim')
   set ttymouse=xterm2
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" WEB 
Plug 'mattn/emmet-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'cakebaker/scss-syntax.vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'kchmck/vim-coffee-script'
Plug 'isRuslan/vim-es6'
plug 'jiangmiao/simple-javascript-indenter'

" tool
plug 'majutsushi/tagbar'
plug 'jiangmiao/auto-pairs'
plug 'xolox/vim-easytags'
plug 'tpope/vim-commentary'

" misc
plug 'xolox/vim-misc'
plug 'plasticboy/vim-markdown'
plug 'easymotion/vim-easymotion'
plug 'mhinz/vim-startify'
plug 'bling/vim-airline'
plug 'edkolev/promptline.vim'
plug 'scrooloose/syntastic'
plug 'terryma/vim-expand-region'
plug 'tpope/vim-surround'
plug 'datawraith/auto_mkdir'
plug 'edsono/vim-matchit' "extended % matching for HTML
plug 'kien/ctrlp.vim'
plug 'nelstrom/vimprint'

" color
plug 'altercation/vim-colors-solarized'
plug 'chriskempson/vim-tomorrow-theme'
plug 'w0ng/vim-hybrid'

" indent guides ----------------------------------------------------------

" add plugins to &runtimepath
call plug#end()

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

let g:easymotion_do_mapping = 0 " disable default mappings
nmap s <plug>(easymotion-s)

set background=dark
set t_co=256
colorscheme hybrid

let mapleader=","

" nav windows 
map <c-j> <c-w>j<c-w>_
map <c-k> <c-w>k<c-w>_
set wmh=0

nmap <f8> :tagbartoggle<cr>

set regexpengine=1
syntax enable
syntax on
set laststatus=2
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set scrolloff=3
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set completeopt=menu,menuone,longest
set cursorline
set ttyfast
set ruler
set laststatus=2
set undofile
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set ai "auto indent"
set si "smart indent"
set tabstop=2 
set softtabstop=2 
set shiftwidth=2 

"move
nnoremap j gj
nnoremap k gk
nnoremap ; :

" use tab instead of % for moving between brackets
nnoremap <tab> %
vnoremap <tab> %

vnoremap // y/<c-r>"<cr>

" keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap n nzzzv

" same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" abbreviations --------------------------------------------
ab teh the
ab hte the
ab taht that
ab waht what


" -----quick escape
imap jj <esc>

nnoremap <c-t>     :tabnew<cr>
inoremap <c-t>     <esc>:tabnew<cr>


let g:startify_custom_header =
          \ map(split(system('fortune | cowsay | sed "s/[[:blank:]]*$//"'), '\n'), '"   ". v:val') + ['']


"vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<c-n>'
let g:multi_cursor_prev_key='<c-p>'
let g:multi_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<esc>'

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }


"syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" easytags
set tags=./tags;
set tags=./tags;
let g:easytags_always_enabled = 1
let g:easytags_file = './tags'
let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 1
let g:easytags_updatetime_min = 5000

let g:syntastic_javascript_checkers = ['jshint']

let g:snips_trigger_key = '<c-\>'

let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" remember last position in last session
if has("autocmd")
  au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

:tnoremap <esc> <c-\><c-n>
:tnoremap <a-h> <c-\><c-n><c-w>h
:tnoremap <a-j> <c-\><c-n><c-w>j
:tnoremap <a-k> <c-\><c-n><c-w>k
:tnoremap <a-l> <c-\><c-n><c-w>l
:nnoremap <a-h> <c-w>h
:nnoremap <a-j> <c-w>j
:nnoremap <a-k> <c-w>k
:nnoremap <a-l> <c-w>l

:nnoremap <c-h> <c-w>h
:nnoremap <c-l> <c-w>l


autocmd FileType javascript noremap <buffer> <f2> :terndef<cr>
autocmd FileType javascript noremap <buffer> <F3> :TernRename<CR>
autocmd FileType javascript noremap <buffer> <F4> :TernDefPreview<CR>

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType scss noremap <buffer> <c-f> :call CSSBeautify()<cr>
