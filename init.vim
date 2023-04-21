call plug#begin('/home/ahas/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'preservim/tagbar'
	Plug 'ryanoasis/vim-devicons'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'kyoz/purify', { 'rtp': 'vim' }
	"Plug 'blueyed/vim-diminactive'
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
	Plug 'pangloss/vim-javascript'
	Plug 'scrooloose/nerdcommenter'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'skywind3000/asynctasks.vim'
	Plug 'skywind3000/asyncrun.vim'
	Plug 'mg979/vim-visual-multi', { 'branch': 'master' }

	if !exists('g:vscode')
		Plug 'puremourning/vimspector', {'do': './install_gadget.py --all'}
	endif
call plug#end()

" Encoding
set encoding=UTF-8
set fileencoding=UTF-8
set tenc=UTF-8

" Editor
set noswapfile
set number
set ruler
set tabstop=2
set shiftwidth=2
set nobackup
set visualbell
set wrap
set nomodeline
set noshowmode
set noruler
set noshowcmd
set background=dark

syntax on
filetype indent on
colorscheme purify

noremap! <C-BS> <C-w> 
noremap! <C-h> <C-w>

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-F> :Rg<CR>

" prettier
nmap <M-F> :Prettier<CR>

" NERDTree
nmap <silent><F3> :NERDTreeToggle<CR>
vmap <silent><C-_> <Plug>NERDCommenterToggle
nmap <silent><C-_> <Plug>NERDCommenterToggle

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_powerline_fonts = 1 
let g:airline_section_c = '%t' 
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tab_type=1
let g:airline_theme='purify'

" coc
let g:coc_global_extensions = [
			\ '@yaegassy/coc-volar',
			\ '@yaegassy/coc-nginx',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-cmake',
			\ 'coc-clangd',
			\ 'coc-omnisharp',
			\ 'coc-python',
			\ 'coc-phpls',
			\ 'coc-java',
			\ 'coc-go',
			\ 'coc-flutter',
			\ 'coc-tsserver',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-json'
			\ ]
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
set statusline^=%{coc#status()}%{get(b:,'coc_currentfunction','')}
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <space>a :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>e :<C-u>CocList extensions<CR>
nnoremap <silent> <space>c :<C-u>CocList commands<CR>
nnoremap <silent> <space>o :<C-u>CocList outline<CR>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<CR>
nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

nmap <Leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" vimspector
nmap <silent><F4> :VimspectorReset<CR>
nmap <F5> <Plug>VimspectorContinue
nmap <S-F5> <Plug>VimspectorStop
nmap <C-S-F5> <Plug>VimspectorRestart
nmap <F6> <Plug>VimspectorPause
nmap <F9>	<Plug>VimspectorToggleBreakpoint
nmap <S-F9> <Plug>VimspectorAddFunctionBreakpoint
nmap <F10> <Plug>VimspectorStepOver
nmap <F11> <Plug>VimspectorStepInto
nmap <S-F11> <Plug>VimspectorStepOut

" asynctasks
let g:asyncrun_open = 6
nnoremap <Leader>t :AsyncTask 
