if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " toml を更新したら実行する
  " :call dein#update()
  " :call dein#clear_state()
  " :call dein#recache_runtimepath()
  let s:toml = '~/.config/nvim/dein.toml'
  let s:lazy_toml = '~/.config/nvim/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
 call dein#install()
endif

filetype plugin indent on
syntax enable

let g:python3_host_prog = expand('/usr/local/bin/python3')

set number                " 行番号を表示
set autoindent            " 改行時に自動でインデントする
set tabstop=2             " タブを何文字の空白に変換するか
set shiftwidth=2          " 自動インデント時に入力する空白の数
set expandtab             " タブ入力を空白に変換
set splitright            " 画面を縦分割する際に右に開く
set clipboard=unnamed     " yank した文字列をクリップボードにコピー
set hls                   " 検索した文字をハイライトする
set whichwrap=h,l,<,>,[,] " 左右のカーソル移動で行間移動可能にする
set noswapfile            " スワップファイルを作成しない

" ctags
set tags=.tags;~

function! s:exec_ctags() abort
  let tag_name = '.tags'
  let tags_path = findfile(tag_name, '.;')
  if tags_path ==# ''
    return
  endif

  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:exec_ctags()
augroup END

" 文字コード
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" 画面分割
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
