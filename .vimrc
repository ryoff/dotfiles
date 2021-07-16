" 一旦ファイルタイプ関連を無効化する
filetype off
filetype plugin indent off

set backspace=indent,eol,start

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
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
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
set wildmenu
"php文法チェック
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
" pasteモードの切替トグル
" * vim-bracketed-paste がtmuxの最新versionで動かないので暫定的に使用
set pastetoggle=<C-p>
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
" Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
" mdをmarkdownに認識させる
au BufRead,BufNewFile *.md set filetype=markdown
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

" split modeの切替
" https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
" 分割
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" window間移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" windowごと移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" ------------------------------------
"  dein.vmの設定
" ------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
"" ファイルをtree表示してくれる
call dein#add('scrooloose/nerdtree')
"" Ruby向けにendを自動挿入してくれる
call dein#add('tpope/vim-endwise')
"" 下のbarにカラー付きで情報を出してくれる
call dein#add('itchyny/lightline.vim')
"" window sizeを簡単に変える (C-eがデフォルト)
call dein#add('jimsei/winresizer')
"" %で括弧だけじゃなく、if end なども行き来できるようになる
call dein#add('vim-scripts/ruby-matchit')
"" ペーストするさいに、自動でset pasteする
call dein#add('ConradIrwin/vim-bracketed-paste')
"" コメントON/OFFを手軽に実行 (Ctrl+-(コントロールキー+ハイフン)を2回押す)
call dein#add('tomtom/tcomment_vim')
"" Rails向けのコマンドを提供する
call dein#add('tpope/vim-rails')
"" align
call dein#add('h1mesuke/vim-alignta')
"" color scheme
syntax on
call dein#add('tomasr/molokai')
"" syntax + 自動compile
call dein#add('kchmck/vim-coffee-script')
"" align
call dein#add('junegunn/vim-easy-align')
"" slim
call dein#add('slim-template/vim-slim')
"" 置換検索を便利に
"" crs "SnakeCase" > "snake_case"
"" crm "mixed_case" > "MixedCase"
"" crc "camel_case" > "camelCase"
"" cru "upper_case" > "UPPER_CASE"
call dein#add('tpope/vim-abolish')
"" markdown preview
"" :PrevimOpen
call dein#add('plasticboy/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')

"" markdownの折りたたみなし
let g:vim_markdown_folding_disabled=1

"" iTerm2で半透明にしているが、vimのcolorschemeを設定すると背景も変更されるため
highlight Normal ctermbg=none

" ------------------------------------
" nerdtree.vim
" ------------------------------------
" Ctrl+nで起動させる
map <C-n> :NERDTreeToggle<CR>
" 備忘録
" o   表示
" go  表示(移動なし)
" t   新しいタブで開く
" T   open in new tab silently middle-click
" i   分割して開く
" gi  分割して表示(移動無し)
" s   縦分割して表示
" gs  縦分割して表示(移動なし)

" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1

" ------------------------------------
" vim-easy-align.vim
" ------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Required:
call dein#end()

" Required:
syntax enable

" ------------------------------------
" localの設定
" ------------------------------------
if filereadable(expand($HOME.'/.vimrc_local'))
  source $HOME/.vimrc_local
endif

" ファイルタイプ関連を有効にする
filetype plugin indent on
