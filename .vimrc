" 一旦ファイルタイプ関連を無効化する
filetype off
filetype plugin indent off

" encoding関係
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=utf-8,ucs-boms,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,mac,dos " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

" vi互換無効
set nocompatible
"新しい行のインデントを現在行と同じにする
set autoindent
"開いているファイルのディレクトリに移動する
set autochdir
"クリップボードをWindowsと連携
set clipboard=unnamed
"タブの代わりに空白文字を挿入する
set expandtab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=2
"インクリメンタルサーチを行う
set incsearch
"カーソルを行頭、行末で止まらないようにする
" set whichwrap=b,s,h,l,<,>,[,]
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する(noignorecase)
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する(nosmartcase)
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 検索文字をハイライト
set hlsearch
" 括弧の対応をハイライト
set showmatch
" 入力中のコマンドを表示
set showcmd
" 行送り
set scrolloff=5
" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set softtabstop=0
" ステータスライン関連
set laststatus=2
" 折りたたみをマーカーで
set fdm=marker
" Tabを可視化する
set list
set listchars=tab:>.,trail:_
" カーソルライン
set cursorline
"encoding
set encoding=utf-8
set fileencodings=utf-8
scriptencoding utf-8
"php文法チェック
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
" Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
" Gemfileをruby syntaxに
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" 引用符, 括弧の設定
""inoremap { {}<Left>
""inoremap [ []<Left>
""inoremap ( ()<Left>
""inoremap " ""<Left>
""inoremap ' ''<Left>
""inoremap <> <><Left>

" php文法オプション
" 関数で折りたたみ可能
let php_folding=1
" SQLをハイライト
let php_sql_query=1
" htmlをハイライト
let php_htmlInStrings=1

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" 下のbarにカラー付きで情報を出してくれる
NeoBundle 'itchyny/lightline.vim'
" window sizeを簡単に変える (C-eがデフォルト)
NeoBundle 'jimsei/winresizer'
" vimからgitが使える
NeoBundle 'tpope/vim-fugitive'
" %で括弧だけじゃなく、if end なども行き来できるようになる
NeoBundle 'ruby-matchit'
" 特定の文字列を+で切り替える事ができる。
NeoBundle 'AndrewRadev/switch.vim'
" ペーストするさいに、自動でset pasteする
NeoBundle 'ConradIrwin/vim-bracketed-paste'
" コメントON/OFFを手軽に実行 (Ctrl+-(コントロールキー+ハイフン)を2回押す)
NeoBundle 'tomtom/tcomment_vim'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" align
NeoBundle 'h1mesuke/vim-alignta'
" インデントに色を付けて見やすくする
" NeoBundle 'nathanaelkane/vim-indent-guides'           " ターミナルを半透明にしていると、残念なことになる
" color scheme
NeoBundle 'w0ng/vim-hybrid'
" color scheme
NeoBundle 'jpo/vim-railscasts-theme'
" color scheme
NeoBundle 'tomasr/molokai'
" color scheme
NeoBundle 'sjl/badwolf'
" the sliver searcher をvimから使える
NeoBundle 'rking/ag.vim'
" syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" align
NeoBundle 'junegunn/vim-easy-align'
" slim
NeoBundle 'slim-template/vim-slim'
" 置換検索を便利に
" crs "SnakeCase" > "snake_case"
" crm "mixed_case" > "MixedCase"
" crc "camel_case" > "camelCase"
" cru "upper_case" > "UPPER_CASE"
NeoBundle 'tpope/vim-abolish'

call neobundle#end()

" ------------------------------------
" lightline.vim
" ------------------------------------
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:p') ? expand('%:p') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

" ------------------------------------
" switch.vim
" ------------------------------------
nnoremap ! :Switch<CR>

" ------------------------------------
" colorscheme
" ------------------------------------
syntax on
" colorscheme hybrid
" colorscheme railscasts
" colorscheme elflord
colorscheme molokai
" colorscheme badwolf

" iTerm2で半透明にしているが、vimのcolorschemeを設定すると背景も変更されるため
highlight Normal ctermbg=none

" ------------------------------------
" vim-easy-align.vim
" ------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" ------------------------------------
" localの設定
" ------------------------------------
if filereadable(expand($HOME.'/.vimrc_local'))
  source $HOME/.vimrc_local
endif

" ファイルタイプ関連を有効にする
filetype plugin indent on
