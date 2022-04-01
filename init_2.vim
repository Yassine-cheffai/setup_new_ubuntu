set rtp+=~/.vim/bundle/Vundle.vim
set nocompatible
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'ayu-theme/ayu-vim' " or other package manager
Plugin 'pangloss/vim-javascript'    " JavaScript support
Plugin 'leafgarland/typescript-vim' " TypeScript syntax
Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plugin 'scrooloose/nerdtree'
Plugin 'psf/black'
Plugin 'scrooloose/nerdcommenter'
"better highlighting
Plugin 'sheerun/vim-polyglot'
" fzf need latest vim version in oreder for the pop up window to work
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
"Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'styled-components/vim-styled-components'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'ryanoasis/vim-devicons'
Plugin 'liuchengxu/vista.vim'
Plugin 'ellisonleao/glow.nvim'
Plugin 'Pocco81/AutoSave.nvim'
Plugin 'nvim-lualine/lualine.nvim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'nvim-lua/plenary.nvim'
Plugin 'lewis6991/gitsigns.nvim'
Plugin 'EdenEast/nightfox.nvim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call vundle#end()            " required

" remove red intendation cause by vimpolyglot
let g:python_highlight_space_errors = 0
lua << END
require('lualine').setup()
END

"GENERAL SETTINGS
filetype plugin indent on    " required
filetype plugin on
set number
" theme
syntax on
set termguicolors     " enable true colors support
"colorscheme nightfox
"colorscheme palenight
"colorscheme nord
colorscheme OceanicNext
"colorscheme onedark
"let g:oceanic_next_terminal_bold = 0
"let g:oceanic_next_terminal_italic = 0
"let ayucolor="mirage" " for mirage version of theme
"colorscheme ayu
"esc workarround to exit quickly
set timeoutlen=1000 ttimeoutlen=0
" install vim-gtk in order this to work, mainly because of clipboard package
":echo has('clipboard') returns 0 mean that is not supported and won't work
set clipboard=unnamedplus
" add file name  and path to status
set laststatus=2
nnoremap <SPACE> <Nop>
let mapleader=" "
:nnoremap <Leader>d @d
"for font icons
set encoding=UTF-8
set cursorline  

"NERDTREE SETTINGS
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
:nnoremap <Leader>e :NERDTreeToggle <Enter>

" FZF SETTINGS
" use ctrl p to lanch FZF using gitignore, use Files to show all files
nmap <C-P> :GFiles<CR>
:nnoremap <Leader>s :Ag <Enter>
:nnoremap <Leader>f :Files <Enter>
:nnoremap <Leader>w :Windows <Enter>
"set up FZF Ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)
set updatetime=100
let g:fzf_preview_window = []

"VISTA TAGS SETTINGS
:nnoremap <Leader>t :Vista!! <Enter>
let g:vista_sidebar_width = 50

"AUTOSAVE SETTINGS
"lua << EOF
"local autosave = require("autosave")

"autosave.setup(
    "{
        "enabled = true,
        "execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        "events = {"InsertLeave", "TextChanged"},
        "conditions = {
            "exists = true,
            "filename_is_not = {},
            "filetype_is_not = {},
            "modifiable = true
        "},
        "write_all_buffers = false,
        "on_off_commands = true,
        "clean_command_line_interval = 0,
        "debounce_delay = 135
    "}
")
"EOF



"lua << EOF
"require'nvim-treesitter.configs'.setup {
  "-- One of "all", "maintained" (parsers with maintainers), or a list of languages
  "ensure_installed = "maintained",

  "-- Install languages synchronously (only applied to `ensure_installed`)
  "sync_install = false,


  "highlight = {
    "-- `false` will disable the whole extension
    "enable = false,

    "-- list of language that will be disabled

    "-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    "-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    "-- Using this option may slow down your editor, and you may see some duplicate highlights.
    "-- Instead of true it can also be a list of languages
    "additional_vim_regex_highlighting = false,
  "},
"}
"EOF

"COC SETTINGS
" Open definition in a split window
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"nnoremap <silent> K :call <SID>show_documentation()<CR>
:nnoremap <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"if has("nvim-0.5.0") || has("patch-8.1.1564")
  """ Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  "set signcolumn=yes
"endif

" a workarround for above
set signcolumn=yes
"activate mouse support to scroll coc documentation
set mouse=a
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

lua << EOF
require('gitsigns').setup()
EOF



"remove telda ~
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
