set nu  			 "shows current line number	
set relativenumber   "add line number
set incsearch        "start searching as soon as you type
syntax enable        "highligh syntax
"{Tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
"}
set guifont=JetBrains\ Mono,Delugia\ Nerd\ Font,FreeMono:h15
set inccommand=split "interactive search replace
set noswapfile "I don't use it anyway
"Plugins
		call plug#begin('~/.config/nvim/plugged/')
"Brackets
		"Colorful brackets
		Plug 'p00f/nvim-ts-rainbow'
		"Close brackets
		Plug 'cohama/lexima.vim'
"Browser
        Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"GIT	
		"Show git message
		Plug 'rhysd/git-messenger.vim'
		"Git log visualization
		Plug 'junegunn/gv.vim'
		"Undo tree
		Plug 'mbbill/undotree'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'sindrets/diffview.nvim',{'branch':'main'}
		"Marks
		Plug 'kshenoy/vim-signature'
"Themes
		" Show hex colors
		Plug 'chrisbra/Colorizer'
        Plug 'olimorris/onedarkpro.nvim', {'branch':'main'}
        Plug 'savq/melange'
        "Intellij Theme
        Plug 'briones-gabriel/darcula-solid.nvim',{'branch':'main'}
        Plug 'rktjmp/lush.nvim',{'branch':'main'}
        " nginx
        Plug 'chr4/nginx.vim'
        "Icons
        Plug 'kyazdani42/nvim-web-devicons'
        "Hightlight visual selection
        Plug 'kdav5758/HighStr.nvim', {'branch':'main'}
"Notes	
		"Vimwiki
		Plug 'vimwiki/vimwiki', {'branch':'dev'}
		"Markdown preview
		Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
        Plug 'npxbr/glow.nvim', {'do': ':GlowInstall','branch':'main'}
		Plug 'junegunn/goyo.vim'
        Plug 'folke/twilight.nvim',{'branch':'main'}
        Plug 'AndrewRadev/splitjoin.vim'
"File tree
        "Status line
        Plug 'nvim-lualine/lualine.nvim'
		"Files
        Plug 'kyazdani42/nvim-tree.lua'
        Plug 'lukas-reineke/indent-blankline.nvim'
"Utils
		"Vim surround
		Plug 'tpope/vim-surround'
        Plug 'justinmk/vim-sneak'
        Plug 'kevinhwang91/nvim-bqf', {'branch':'main'}
		"Exchange
		Plug 'tommcdo/vim-exchange'
        "Exchange method params
        Plug 'mizlan/iswap.nvim'
        Plug 'liuchengxu/vim-which-key'
		"Calendar
		Plug 'itchyny/calendar.vim'
        "Open from the last place
		Plug 'ethanholz/nvim-lastplace', {'branch': 'main'}
		"Ctrl+f for search
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'
		"Add smooth scrolling
		Plug 'psliwka/vim-smoothie'
        Plug 'voldikss/vim-floaterm'
        "Resizer
        Plug 'simeji/winresizer'
"Gramma
        Plug 'rhysd/vim-grammarous'
"Coding
        "Debugging
        Plug 'mfussenegger/nvim-dap'
		"Comments
		Plug 'tpope/vim-commentary'
		"Emmet
		Plug 'mattn/emmet-vim'
        "Treesiter
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'haringsrob/nvim_context_vt'
		"Elixir
		Plug 'elixir-editors/vim-elixir'
		"Cocnvim
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		call plug#end()
"Git
let g:git_messenger_no_default_mappings=v:true
nmap <Leader>gm :GitMessenger<CR>

"Color schema
		"set default color theme
		if (has("termguicolors"))
				set termguicolors
		endif
		set background=dark		
        "colorscheme darcula-solid
        colorscheme melange
        "colorscheme kanagawa
        "colorscheme onedark
        hi Normal guibg=NONE ctermbg=NONE
        hi LineNr guibg=NONE ctermbg=NONE
        hi SignColumn guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
		"fix theme when inside tmux
		set t_Co=256
		"Add transparency
		hi Normal guibg=NONE ctermbg=NONE

"Splits
		"when horizontal split then window appears in right
		set splitbelow splitright
		"enable arrows in insert mod
        inoremap <esc>a <up>
        inoremap <esc>b <down>
        inoremap <esc>c <right>
        inoremap <esc>d <left>

"Utils
		"\o will create new line without switching to insert mode
		nnoremap <leader>o o<esc>
		nnoremap <leader>O O<esc>
        "Firstly press shift+v then 
        "highlight using arrows then press shift+j or shift+l it
        "will move lines up or down
		vnoremap J :m '>+1<CR>gv=gv
		vnoremap K :m '<-2<CR>gv=gv
		"jj - normal mode
		inoremap jj <esc>

		"  Copy to clipboard
		vnoremap  <leader>y  "+y
		nnoremap  <leader>Y  "+yg_
		nnoremap  <leader>y  "+y
		nnoremap  <leader>yy  "+yy
		
		"  Paste from clipboard
		nnoremap <leader>p "+p
		nnoremap <leader>P "+P
		vnoremap <leader>p "+p
		vnoremap <leader>P "+P
	    
        nmap <leader>cd :cd %:p:h<CR>

		"Source config
		nnoremap  <leader>s  :source ~/.config/nvim/init.vim<CR>
	
		" Ctrl+s saves changes
		nmap <C-s> :w<CR>

        "Virtual lines rather than logical lines
         nnoremap j gj
         nnoremap k gk
"Rainbow
		"enable brackets for all files
		let g:rainbow_active=1
		"rainbow colors
		let g:rainbow_ctermfgs = ['darkblue', 'darkgreen', 'darkyellow', 'magenta']
		
"Directories
		"Remove banner
		let g:netrw_banner = 0
		"Size in left
		let g:netrw_winsize = 15
		"shift+arrow move cursor from dir to file
		nmap <s-down>  <c-w>j
		nmap <s-up>    <c-w>k
		nmap <s-left>  <c-w>h
		nmap <s-right> <c-w>l

"Git bindings
		"Open Gdiff vertically
		set diffopt+=vertical
		
"fzf
		map <C-f> <Esc><Esc>:Files!<CR>
		inoremap <C-f> <Esc><Esc>:BLines!<CR>
		map <C-p> <Esc><Esc>:Ag!<CR>
		map <C-g> <Esc><Esc>:BCommits!<CR>
		map <C-b> <Esc><Esc>:Windows<CR>

		
"Vim sneak
		"Add vimium like notations for search
		let g:sneak#label = 1
		"f works as single character s command
		map f <Plug>Sneak_f
		"F works as single character s command
		map F <Plug>Sneak_F
		"t works as single character S command
		map t <Plug>Sneak_t
		"T works as single character S command
		map T <Plug>Sneak_T

"Vim surround
        nmap yG  <Plug>YSurround
		"Add **\r** on b
		let b:surround_{char2nr('*')} = "**\r**"
"Undotree
		if has("persistent_undo")
		    set undodir="/tmp/.undodir"
			set undofile
		endif
		nnoremap <leader>u :UndotreeToggle<cr>	
"GV
		nnoremap <leader>gv :GV!<cr>

"Tmux
		"Fix cursor in tmux
		let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

"Highlight
        vnoremap <leader>h  :<c-u>HSHighlight 5<CR>
"Swap method args
        nnoremap <leader><leader>s :ISwap<cr>
"Source external configs
		"Cocnvim
		source ~/.config/nvim/coc.vim
		"Emmet
		source ~/.config/nvim/emmet.vim
		"Calendar
		source ~/.config/nvim/calendar.vim
		"Goyo
		source ~/.config/nvim/goyo.vim
		"Wiki
		source ~/.config/nvim/wiki.vim

"Treesiter
lua require'nvim-treesitter.configs'.setup { highlight = {enable = true}}


"File viewer
let g:nvim_tree_quit_on_open = 1
luafile ~/.config/nvim/nvim_tree.lua
nnoremap <leader>f :NvimTreeToggle<cr>

"Firenvim
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'takeover': 'never'
        \ },
    \ }
\ }


"Debug
luafile ~/.config/nvim/debug.lua
nnoremap <leader>dtb :lua require"dap".toggle_breakpoint()<cr>
nnoremap <leader>dc :lua require"dap".continue()<cr>
nnoremap <leader>dro :lua require"dap".repl.open()<cr>

"Source lua files
    luafile ~/.config/nvim/lualine.lua
    "Last Place
    luafile ~/.config/nvim/lastplace.lua
    "Term
    source ~/.config/nvim/term.vim
    "Twilight
    luafile ~/.config/nvim/twilight.lua
