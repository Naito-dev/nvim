" Inicialização do vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Plugins
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'


Plug 'akinsho/bufferline.nvim', {'tag': '*'}

"NVIM TREE
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
"=========================

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'akinsho/toggleterm.nvim'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'moll/vim-bbye' 

"Themes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'tanvirtin/monokai.nvim'
Plug 'Matsuuu/pinkmare'
Plug 'datsfilipe/min-theme.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'projekt0n/github-nvim-theme'

call plug#end()

"==================================================================

" ===== Configurações gerais =====
if &term =~ "xterm"
  let &t_SI = "\e[6 q"  " Modo insert: linha vertical (I-beam)
  let &t_EI = "\e[2 q"  " Modo normal: bloco sólido
endif

set noswapfile
syntax on
filetype plugin indent on
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set hidden
set mouse=a
set number
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set relativenumber
set cursorline



" ===== Tema =====
  set termguicolors

"colorscheme github_dark_dimmed
colorscheme github_dark_colorblind
"colorscheme tokyonight-night
"colorscheme badwolf

"===========================================
"Tree-Sitter
" Carrega configuração Lua dentro do init.vim
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java", "lua", "python", "bash", "html", "css" }, -- linguagens desejadas
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
"tree-Sitter-Refactor
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java" },
  highlight = { enable = true },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = true },
  },
}
EOF
let g:rainbow_parens = 0
let g:rainbow_active = 0

"=====================================================================
"======NVIM TREE=========
lua << EOF
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "📄",
        symlink = "🔗",
        bookmark = "#",
        folder = {
          default = "📁",
          open = "📂",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})
EOF


highlight NvimTreeFolderIcon guifg=#ff79c6
highlight NvimTreeFolderIconOpen guifg=#ff79c6

"===============================================

" ===== Airline =====
let g:airline_powerline_fonts = 1
let g:airline_theme = 'github_dark_colorblind'

lua << EOF
require("bufferline").setup{}
EOF


"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'


let mapleader = " "

" Tabs size
set tabstop=4              " Define o número de espaços para uma tabulação
set shiftwidth=4              " Define o número de espaços para cada nível de indentação automática
set expandtab               " Converte tabulações em espaços
set smartindent               " Habilita a indentação inteligente automática


"Keys Binds

nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprevious<CR>
nnoremap <leader>q :Bdelete<CR>


nnoremap <silent> <leader>e :NvimTreeFocus<CR>
nnoremap <silent> <C-n> :NvimTreeClose<CR>
nnoremap <silent> <leader>f :NvimTreeFindFile<CR>

nmap <C-s> :w!<CR>
nnoremap <C-q> :q!<CR>

" Comando para abrir terminal pequeno no rodapé
command! TermBottom belowright split | resize 10 | terminal
nnoremap <silent> <leader>h :TermBottom<CR>
" No modo terminal, mapear <Esc> para sair para modo normal
tnoremap <Esc> <C-\><C-n>




" ===== CoC (usando apenas snippets) =====
let g:coc_global_extensions = ['coc-snippets']
let g:coc_enable_locationlist = 0

" Mapeamentos de navegação e confirmação de snippets
" Tab: próximo item na lista
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Shift-Tab: item anterior na lista
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Enter: confirma apenas se a lista estiver visível
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
"inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Atalho para lista de snippets
nmap <leader>ss :CocList snippets<CR>

" Atalhos para navegar entre abas
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>




" -----------------------------------------------------------------------------
" Configuração do Auto Pairs
" -----------------------------------------------------------------------------
let g:AutoPairsFlyMode = 0          " Desativa o modo "fly" (pareamento imediato ao digitar)
let g:AutoPairsShortcutBackInsert = '<M-b>' " Define o atalho para inserir o par anterior

"rainbow parentheses Configuração
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses



"JAVA COMPILER
function! CompileAndRunJava()
  write
  call system('mkdir -p out')
  let l:compile_cmd = 'javac -d out $(find src -name "*.java")'
  let l:compile_output = system(l:compile_cmd)
  if v:shell_error != 0
    echohl ErrorMsg
    echo "Erro na compilação:"
    echo l:compile_output
    echohl NONE
    return
  endif
  let l:class_name = expand('%:t:r')
  let l:package_line = matchstr(join(getline(1, 10), "\n"), '^\s*package\s\+\zs\S\+\ze\s*;')
  if !empty(l:package_line)
    let l:full_class = l:package_line . '.' . l:class_name
  else
    let l:full_class = l:class_name
  endif
  let l:term_bufnr = -1
  for w in range(1, winnr('$'))
    if getwinvar(w, '&buftype') ==# 'terminal'
      let l:term_bufnr = winbufnr(w)
      execute w . 'wincmd w'
      break
    endif
  endfor
  if l:term_bufnr == -1
    belowright split
    resize 10
    terminal
  else
    execute "buffer " . l:term_bufnr
  endif
  call jobsend(b:terminal_job_id, "java -cp out " . l:full_class . "\n")
  startinsert
endfunction

nnoremap <leader>r :call CompileAndRunJava()<CR>

