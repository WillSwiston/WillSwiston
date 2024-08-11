" Startup
autocmd VimEnter,WinEnter * let &scrolloff = winheight(0) / 4

" Mappings
nnoremap t :NERDTreeToggle<CR>
nnoremap j k
nnoremap k j
nnoremap J {
nnoremap K }
nnoremap ; :
nnoremap H ^
nnoremap L $
nnoremap sw <c-w>
nnoremap <c-w>j <c-w>k
nnoremap <c-w>k <c-w>j
nnoremap swj <c-w>k
nnoremap swk <c-w>j
noremap + :call AdjustFontSize(1)<CR>
noremap _ :call AdjustFontSize(-1)<CR>

inoremap zxc <esc>

vnoremap j k
vnoremap k j
vnoremap J {
vnoremap K }
vnoremap H ^
vnoremap L $
vnoremap < <gv
vnoremap > >gv

tnoremap <C-w>h <C-\><C-n>:wincmd h<CR>
tnoremap <C-w>j <C-\><C-n>:wincmd k<CR>
tnoremap <C-w>k <C-\><C-n>:wincmd j<CR>
tnoremap <C-w>l <C-\><C-n>:wincmd l<CR>

tnoremap <C-w><Up> <C-\><C-n>:resize +2<CR>
tnoremap <C-w><Down> <C-\><C-n>:resize -2<CR>
tnoremap <C-w><Left> <C-\><C-n>:vertical resize -2<CR>
tnoremap <C-w><Right> <C-\><C-n>:vertical resize +2<CR>
tnoremap <Esc> <C-\><C-n>

" Defaults
set guicursor=i:block
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set clipboard=unnamedplus

" Font Changes
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

" Plugins
call plug#begin()
  Plug 'tpope/vim-commentary'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
  Plug 'itchyny/lightline.vim'
  Plug 'preservim/nerdtree'
  Plug 'olivercederborg/poimandres.nvim'
call plug#end()

" Plugin Settings
let g:NERDTreeMapOpenInTab=''

" Appearence
colorscheme poimandres

function! ResizeTo50Percent()
    let height = winheight(0) * 0.5
    execute 'resize ' . height
endfunction

command! F normal! :Telescope find_files<CR>
map x <C-w>s<C-w>k:let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>Acd $VIM_DIR<CR><C-\><C-n>:call ResizeTo50Percent()<CR>A

