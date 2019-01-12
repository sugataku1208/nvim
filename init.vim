set number "行番号の表示
set title  "編集中のファイル名の編集
set showmatch "括弧入力時に対応する括弧示す
set matchpairs& matchpairs+=<:> " 対応括弧に<と>のペアを追加
set showmatch " 対応括弧をハイライト表示する
set ruler "カーソル位置を表示
syntax on "コードに色を付ける
set fenc=utf-8 "文字コードをutf-8にする
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set smartindent "オートインデント
set shiftwidth=2 "自動的に入力されたインデントの空白を2つ分に設定
set ambiwidth=double " □や○文字が崩れる問題を解決
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
set backspace=indent,eol,start "バックスペースの有効
set wildmenu " コマンドモードの補完
inoremap <silent> jj <Esc>


" for deoplete.vim
" 一つ目の候補を選択状態にする
set completeopt+=noinsert

"Language specificadion
if has("multi_lang")
language C
endif

" 全角スペースのハイライト
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/sugawaratakuya/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_cache_dir =$XDG_CACHE_HOME . '/dein'
let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
" Required:
if dein#load_state('/Users/sugawaratakuya/.cache/dein')
  call dein#begin('/Users/sugawaratakuya/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/sugawaratakuya/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('vim-syntastic/syntastic') " 構文チェック。linterは適宜追加。
  call dein#add('tpope/vim-fugitive.git') " vim内でgitを扱えるようにする
  call dein#add('w0rp/ale')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
