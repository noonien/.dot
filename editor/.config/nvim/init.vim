" =============================================================================
" noonien's awesome .vimrc
" This file is part of my dotfiles, which can be found at:
"    https://github.com/noonien/.dot
" =============================================================================

" general
" -------

set encoding=utf-8 nobomb " use UTF-8 encoding with no BOM

filetype on " enable filetype detection
filetype plugin on " load per-filetype plugin file
filetype indent on " load per-filetype indent file

set nomodeline " disable modeline

set noswapfile " disable swap files (used to write unsaved work to disk, for recovery)
set nobackup " when a first write to a file, if it existed previously, make a backup
set nowritebackup " don't write backups
set undofile " enable persistent undo
set undolevels=1000 " persist up to 1000 levels of undo
set hidden " don't discard closed buffers

set number " enable line numbering
set relativenumber " enable relative line numbering
set signcolumn=yes " always show sign column

set nowrap " disable text wrapping

set scrolloff=4 " start scrolling when we're 4 lines away from the top and bottom margins
set sidescrolloff=4 " start scrolling when we're 4 lines away from the left and right margins

set showmatch " show matching [{()}]
set colorcolumn=100 " highlight the 100th column

set ignorecase " ignore case when searching
set smartcase " if the search term is all lower case, search ignores case
set gdefault " enable the g subsitute flag by default, replacing all occurences on matching line

set lazyredraw " don't redraw when running macros

"set termguicolors " enable 24-bit RGB colors

let loaded_matchit = 1 " disable built-in matchit.vim, we don't use it
let g:loaded_netrw       = 1 " disable loading build-in netrw.vim
let g:loaded_netrwPlugin = 1 " disable loading build-in netrw.vim


" ===========
"   plugins
" ===========

let s:plugins_dir = stdpath('data') . '/plugins'
call plug#begin(s:plugins_dir)

Plug 'noahfrederick/vim-noctu'
"Plug 'jeffkreeftmeijer/vim-dim'
"Plug 'mnoble/meta.vim'
"Plug 'apazzolini/vim-wave'
"Plug 'alex-kononovich/terminal16.vim'

"Plug 'vim-airline/vim-airline' " status bar
Plug 'tpope/vim-fugitive' " git support
Plug 'mbbill/undotree' " show vim undo tree

Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense engine with language server support
let g:coc_global_extensions = [ 'coc-explorer', 'coc-json', 'coc-rls', 'coc-rust-analyzer', 'coc-python' ]

Plug 'easymotion/vim-easymotion' " easier jumps with <leader><leader>s
Plug 'kergoth/vim-hilinks' " help with tracking highlight groups

Plug 'editorconfig/editorconfig-vim' " load project coding style

"Plug 'thaerkh/vim-indentguides' " show indent lines

Plug 'rust-lang/rust.vim'
call plug#end()

" Auto install plugins if they're missing
if !isdirectory(glob(s:plugins_dir))
    PlugInstall
endif

set t_Co=16
"set notermguicolors
colorscheme noctu


"hi X cterm=bold,underline,undercurl,reverse,inverse,italic,standout,strikethrough,NONE 
"ctermbg=
"ctermfg=

" keys
" ----

let mapleader = "," " map leader

" make * and # not jump from the current match
nmap * *Nzz
nmap # #Nzz

" typos
:command! WQ wq
:command! Wq wq
:command! WA wa
:command! Wa wa
:command! W w
:command! Q q
:command! QA qa
:command! Qa qa

" disable Q (command shell mode)
nnoremap Q <nop>

:nmap <leader>/ :nohl<cr>

nnoremap <F2> :CocCommand explorer<cr>
nnoremap <F3> :UndotreeToggle<cr>


" coc
" ----

" organize imports for go files
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


nnoremap <M-i> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") ."> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
