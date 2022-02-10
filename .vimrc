set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required


"""""""""""""""""""""""""
" Vim-plug initialization
"""""""""""""""""""""""""
" Create the autocmd group used by all my autocmds (cleared when sourcing vimrc)
augroup vimrc
  autocmd!
augroup END


"""""""""""""""""""
" auto-install Plug
"""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


""""""""""""""""""""""""
" basic editor behaviour
""""""""""""""""""""""""
set expandtab " tabs -> spaces
set tabstop=2
set shiftwidth=2
set wrap
set linebreak
set formatoptions+=j


"""""""""
" Plugins
"""""""""
call plug#begin('~/.vim/plugged')

" fzf for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vim opens symlinks
Plug 'moll/vim-bbye' " optional dependency
Plug 'aymericbeaumet/vim-symlink'

" show folders like ide
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax highlighting file tree
Plug 'Xuyuanp/nerdtree-git-plugin' " Git for NerdTree

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" easy comments
Plug 'scrooloose/nerdcommenter'

" terraform autocomplete
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

" go
Plug 'fatih/vim-go'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" use hjkl to switch between open vims in tmux
Plug 'christoomey/vim-tmux-navigator'

" make helpful bar pop up
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colors
Plug 'morhetz/gruvbox'

call plug#end()



""""""""""""""""""""""
" auto-install plugins
""""""""""""""""""""""
autocmd vimrc VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q | runtime vimrc
      \| endif


""""""""""""""""""
" Syntastic Config
""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""
" coc 
"""""
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""""""""""""""""""""""
" Terraform Completion
""""""""""""""""""""""
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

"""""""""""""""""""""""
" deoplete for autofill
"""""""""""""""""""""""
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:deoplete#enable_at_startup = 1

let g:deoplete#omni_patterns = {}

call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})

call deoplete#initialize()


"""""""""""""""
" nerdcommenter
"""""""""""""""
let g:NERDDefaultAlign = 'left'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


"""""""""""
" NERDTree
"""""""""""
autocmd VimEnter * NERDTree

" make it look prettier on mac
let g:NERDTreeNodeDelimiter = "\u00a0"

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Show hidden dirs
let NERDTreeShowHidden=1


"""""""""
" airline
"""""""""
" let g:airline#extensions#default#layout = [
"     \ [ 'a', 'b', 'c' ],
"     \ [ 'x', 'z', 'error', 'warning' ]
"     \ ]


""""""""
" Misc
""""""""
" line numbers
set number
set relativenumber
set cursorline

" allow mouse clicks in terminal
set mouse=a

" colors
syntax on
colorscheme gruvbox


"""""""""""""""""""""""
" fix copy/paste issues
"""""""""""""""""""""""
" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

