" Inicialização do vim-plug
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'

"Themes
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'


"================"
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install'}
Plug 'neoclide/coc-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'voldikss/vim-floaterm'



call plug#end()
" ===== Configurações gerais =====
syntax on
filetype plugin indent on
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" ===== Tema =====
colorscheme jellybeans
let g:rehash256 = 1
" ===== NERDTree =====

let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1

" ===== Airline =====
let g:airline_powerline_fonts = 1



" Tabs size
set tabstop=4              " Define o número de espaços para uma tabulação
set shiftwidth=4              " Define o número de espaços para cada nível de indentação automática
set expandtab               " Converte tabulações em espaços
set smartindent               " Habilita a indentação inteligente automática


"Keys Binds
nmap <Space>e :NERDTreeToggle<CR>
nmap <C-s> :write<CR>
nnoremap <C-q> :q!<CR>
nnoremap <silent> <Space>h  :sp<CR>:FloatermToggle<CR>
tnoremap <silent> <F1> <C-\><C-n>:FloatermKill<CR>

" ===== CoC (usando apenas snippets) =====
let g:coc_global_extensions = ['coc-snippets']
let g:coc_enable_locationlist = 0

" Mapeamentos de navegação e confirmação de snippets
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Atalho para lista de snippets
nmap <leader>ss :CocList snippets<CR>


" -----------------------------------------------------------------------------
" Configuração do Auto Pairs
" -----------------------------------------------------------------------------
let g:AutoPairsFlyMode = 0          " Desativa o modo "fly" (pareamento imediato ao digitar)
let g:AutoPairsShortcutBackInsert = '<M-b>' " Define o atalho para inserir o par anterior

"rainbow parentheses Configuração
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses



"Java Key Binds
function! CompileAndRunJava()
  " Pegando o nome do arquivo atual
  let l:filename = expand('%:t')
  let l:filename_noext = expand('%:t:r')

  " Criando a pasta out, caso não exista
  call mkdir('out', 'p')

  " Compilando o arquivo Java
  execute '!javac -d out ' . expand('%') 

  " Executando o arquivo compilado (assumindo que o main está no mesmo pacote ou sem pacote)
  execute '!java -cp out ' . l:filename_noext
endfunction

" Mapeando para um atalho no modo normal
nnoremap <silent> <F5> :call CompileAndRunJava()<CR>
