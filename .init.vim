"============= plugins =============

call plug#begin()

"Colorschemes
Plug 'folke/tokyonight.nvim'
"Colorschemes end

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

Plug 'nvim-telescope/telescope-fzf-native.nvim'

"Telescope end

"fzf

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"fzf end

"devicons

Plug 'nvim-tree/nvim-web-devicons'

"devicons end

call plug#end()

"============= plugins end =============

set clipboard+=unnamedplus
inoremap jk <Esc>
inoremap <Esc> <nop>
set number
let mapleader = ","
colorscheme tokyonight

" Find files using Telescope command-line sugar.
"
nnoremap <leader>ff <cmd>Telescope find_files <cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Remember folds
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

"============= autoload =============
 
 let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
 if empty(glob(data_dir . '/autoload/plug.vim'))
   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 endif
 
 " Install vim-plug if not found
 if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 endif
 
 " Run PlugInstall if there are missing plugins
 autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
   \| PlugInstall --sync | source $MYVIMRC
 \| endif
 
 "============= autoload end =============
