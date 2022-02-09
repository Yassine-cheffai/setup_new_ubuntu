set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'joshdick/onedark.vim'
Plugin 'ayu-theme/ayu-vim' " or other package manager
Plugin 'pangloss/vim-javascript'    " JavaScript support
Plugin 'leafgarland/typescript-vim' " TypeScript syntax
Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plugin 'scrooloose/nerdtree'
Plugin 'psf/black'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sheerun/vim-polyglot'
"Plugin 'scrooloose/syntastic'
"Plugin 'davidhalter/jedi-vim'
" fzf need latest vim version in oreder for the pop up window to work
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Plugin 'rust-lang/rust.vim'
Plugin 'dense-analysis/ale'
Plugin 'styled-components/vim-styled-components'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'ryanoasis/vim-devicons'
"Plugin 'majutsushi/tagbar'
Plugin 'liuchengxu/vista.vim'
Plugin 'ellisonleao/glow.nvim'
Plugin 'Pocco81/AutoSave.nvim'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
" theme
syntax on
set termguicolors     " enable true colors support
"let ayucolor="mirage" " for mirage version of theme
"set background=dark
"colorscheme palenight
"colorscheme ayu
colorscheme onedark

"esc workarround to exit quickly
set timeoutlen=1000 ttimeoutlen=0
"nerdtree settings
"ctrl + t will not work in a go file because it became go back from a go to definition
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>  not working any more because i changed it
"to search
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
"
" install vim-gtk in order this to work, mainly because of clipboard package
":echo has('clipboard') returns 0 mean that is not supported and won't work
set clipboard=unnamedplus

" add file name  and path to status
set laststatus=2

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['flake8']

" autosave
"autocmd CursorHold,CursorHoldI * update



nnoremap <SPACE> <Nop>
let mapleader=" "

" setting jedi for python https://github.com/davidhalter/jedi-vim
"let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 0
" use ctrl p to lanch FZF using gitignore, use Files to show all files
nmap <C-P> :GFiles<CR>
"nmap <C-F> :Ag<CR>
:nnoremap <Leader>s :Ag <Enter>
:nnoremap <Leader>f :Files <Enter>
:nnoremap <Leader>w :Windows <Enter>
"set up FZF Ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)
set updatetime=100
let g:fzf_preview_window = []

"nmap <C-P> :Telescope find_files<CR>
":nnoremap <Leader>s :Telescope grep_string<Enter>

" go setting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_sameids = 0


" rust setting
" change thsi wih ale formatting
"let g:rustfmt_autosave = 1

"npm install --save typescript
" pip install jedi-language-server
" pip install pyright
"let g:ale_linters = {'rust': ['analyzer'], 'typescriptreact': ['deno', 'eslint', 'standard', 'tslint', 'tsserver', 'typecheck', 'xo'], 'python': ['flake8', 'jedils', 'pyright']}
let g:ale_linters = {'rust': ['analyzer'], 'typescriptreact': ['deno', 'eslint', 'standard', 'tslint', 'tsserver', 'typecheck', 'xo'], 'python': [ 'jedils', 'pyright']}
"let g:ale_linters_explicit = 1
"let g:ale_python_auto_pipenv = 1
let g:ale_virtualenv_dir_names = ['env', 'venv']
nmap <F12> :ALEGoToDefinition -vsplit<CR>
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'python': ['black'],
\ 'rust': ['rustfmt'],
\ 'javascript': ['eslint', 'prettier'],
\ 'typescript': ['tslint'],
\ 'typescriptreact': ['prettier', 'eslint']
\}

"let g:ale_completion_enabled = 1
:nnoremap <Leader>h :ALEHover <Enter>
:nnoremap <Leader>d @d

"for font icons
set encoding=UTF-8


"vista tags settings
:nnoremap <Leader>t :Vista!! <Enter>
"nmap <F7> :Vista!!<CR>
let g:vista_sidebar_width = 50
let g:ale_virtualtext_cursor = 1
"let g:ale_set_balloons = 1
set cursorline  
let g:ale_lint_on_text_changed ='always' 



let g:ale_sign_error = '->'
let g:ale_sign_style_error = '->'

:nnoremap <Leader>e :NERDTreeToggle <Enter>



lua << EOF
local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF
