if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'


" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  call dein#load_toml(s:toml_dir. '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif 


" My configuration
set number
set tabstop=2
set shiftwidth=2
set cursorline
set clipboard+=unnamed
set title

highlight Pmenu ctermbg=7 ctermfg=0
highlight PmenuSel ctermbg=0 ctermfg=230

" Easy NerdTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Easy QuickRun
nnoremap <silent><C-d> :QuickRun<CR>

" Quick Run Close Buffer
nnoremap <silent><C-q> :<C-u>bw! \[quickrun\ output\]<CR>
