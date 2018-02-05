"  PLUGINS ""

"""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/SQLUtilities'

Plug 'xolox/vim-misc'

" set with gaSYMBOL, then V select and =
Plug   'junegunn/vim-easy-align'
  xmap ga <Plug>(EasyAlign) " EasyAlign in visual mode (e.g. vipga)
  nmap ga <Plug>(EasyAlign) " EasyAlign for a motion/text object (e.g. gaip)
  vmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

Plug 'easymotion/vim-easymotion'
    nmap s <Plug>(easymotion-bd-f)

Plug 'tpope/vim-repeat'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " On-demand loading
map <C-n> :NERDTreeToggle<CR>

Plug 'ctrlpvim/ctrlp.vim' " fuzzzzy search, settings not doan
  let g:ctrlp_map = '<C-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra' " a=curFileDir/parente c=curFileDir, 'r' - ancestor, 'w' - start from cwd, '' disable
  let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
  set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*~,~/memo
  let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|svn)$',
            \ 'file': '\v\.(exe|so|dll|sw.)$',
            \ }
  let g:ctrlp_user_command = 'find %s -type f'
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline' 
  let g:airline_powerline_fonts = 1 
  let g:airline#extensions#tabline#enabled = 1

Plug 'vim-airline/vim-airline-themes' " näistä löyty huikee jellybeans
Plug 'nanotech/jellybeans.vim' " vimiin vielä jelly

Plug 'vim-scripts/visualrepeat'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'PotatoesMaster/i3-vim-syntax'

Plug 'vim-syntastic/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_js_checkers = ['eslint']


Plug 'chrisbra/recover.vim'

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git', 'svn' ] 

Plug 'mileszs/ack.vim'

call plug#end()
"" END PLUGINS


" LEADER stuffiz
let g:mapleader = "\<Space>"
let mapleader = "\<Space>"

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

vnoremap <Leader>as :%s/^/
vnoremap <Leader>ae :%s/$/


nmap     <Leader>W :w !sudo tee % > /dev/null
map      <Leader>tn :tabnew<cr>

map      <Leader>to :tabonly<cr> " only this tab
map      <Leader>tc :tabclose<cr>
map      <Leader>tm :tabmove
map      <Leader>t :tabnext
nnoremap <Leader>e :vsp $MYVIMRC<cr>
map      <Leader>w :tabnext
nmap     <Leader>te :tabedit <c-r>=expand("%:p:h")<cr>
noremap  <Leader>I ggvG=
noremap  <Leader>w :set wrap!<cr>
" beautify json
map      <Leader>jb :%! python -m json.tool<cr>

imap jj <Esc>
nnoremap Y y$ " yank to the end of line

map <Leader>il :set invlist!<cr>

" map j gj
" map k gk

vnoremap <F1> :'<,'>sort r /\ze\%V/

vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>


" END LEADER

set t_Co=256
set encoding=utf-8
set ttimeoutlen=100
set laststatus=2
set mouse=a
set nu rnu
set history=5000
set nosmartcase
set lazyredraw
set so=4
set wildmenu
set wildignore=*.o,*~,*.pyc

set ruler

set cmdheight=1
set hid
set backspace=indent,eol,start

set whichwrap+=<,>,h,l
set magic
" audio off
set noerrorbells novisualbell
set tm=150
set bg=dark
set encoding=utf8
set ffs=unix,dos,mac

set nowrap

" backups and swaps
set backup writebackup backupdir=$HOME/.vim/backupfiles/
set swapfile
set directory^=$HOME/.vim/tmp/

" tab shit, not great
set shiftwidth=2 tabstop=2 expandtab smarttab

set nolinebreak " can lead into automatic breaking of big files
set tw=0

set viminfo^=%

" colors
colorscheme jellybeans
let g:airline_theme = 'jellybeans'

set breakindent " indents wrapped lines

"fo=fo, default
"set formatoptions+=a
"set formatoptions+=b
set fo-=o
set noshowmatch

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

