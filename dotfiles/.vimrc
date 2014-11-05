"新しい行のインデントを現在行と同じにする
set autoindent
"クリップボードをWindowsと連携
set clipboard=unnamed
"pasteモードとnopasteモードを切り替える
set pastetoggle=<F11>
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
set whichwrap=b,s,h,l,<,>,[,]
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
set statusline=%y%{GetStatusEx()}\ 0x%B(%b)%F%m%r%=<%c:%l>
" 折りたたみをマーカーで
set fdm=marker
" Tabを可視化する
set list
set listchars=tab:>.,trail:_

function! GetStatusEx()
    let str = ''
    let str = str . '' . &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
    let str = '[' . &fileencoding . ':' . str
    endif
    return str
endfunction

set nocompatible
syntax on
filetype on
filetype plugin on

"encoding
set encoding=utf-8
set fileencodings=utf-8

"php文法チェック
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" php文法オプション
" 関数で折りたたみ可能
let php_folding=1
" SQLをハイライト
let php_sql_query=1
" htmlをハイライト
let php_htmlInStrings=1

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif 

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'thinca/vim-quickrun'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

filetype indent on

