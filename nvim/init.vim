
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin  'rking/ag.vim'

let g:deoplete#enable_at_startup = 1
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
" tagbar の設定
let g:tagbar_width = 30        " 初期設定はwidth=40なのでちょっと幅とりすぎ。
let g:tagbar_autoshowtag = 1   ":TagbarShowTag を叩かなくても有効にする
Plugin 'Shougo/vimproc.vim'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'
Plugin 'mhartington/oceanic-next'
Plugin 'w0rp/ale'
Plugin 'cohama/lexima.vim'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
let g:lexima_enable_newline_rules = 1


" Plugin 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


 Plugin 'easymotion/vim-easymotion'
 let g:EasyMotion_leader_key = 'r'
 nnoremap <silent><C-e> :NERDTree<CR>
 nnoremap <silent><C-r> :NERDTreeCWD<CR>

 
Plugin 'fatih/vim-go'
let g:go_fmt_command = "goimports"
Plugin 'mdempsky/gocode', {'rtp': 'nvim/'}
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-erlang/vim-erlang-runtime'

Plugin 'elixir-editors/vim-elixir'
" Plugin 'elixir-lang/vim-elixir'
Plugin 'thinca/vim-ref'
Plugin 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Required:
set runtimepath+=/Users/ruofan.ye/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/ruofan.ye/.config/dein')
  call dein#begin('/Users/ruofan.ye/.config/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/ruofan.ye/.config/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  call dein#add('zchee/deoplete-go', {'build': 'make'})
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#pointer = 1
  let g:deoplete#sources#go#cgo = 1
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  let g:deoplete#sources#go#auto_goos = 1
  
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" for go developing
set autowrite
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
"set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
"set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
inoremap jj <Esc>
" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
set tabstop=2
set shiftwidth=2
" terminal color
set termguicolors
colorscheme OceanicNext

"set list " show white spaces
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
let g:ackprg = 'ag --vimgrep'
let g:go_version_warning = 0
"let g:ag_working_path_mode="r"
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ
let g:ackprg = 'ag --vimgrep'
autocmd QuickFixCmdPost *grep* cwindow

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
set encoding=utf-8

vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>
" Clipboard 
set clipboard=unnamed
