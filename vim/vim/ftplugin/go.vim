" =============================================================================
" Vim configuration for Go files
" =============================================================================

" =============================================================================
" Code Style {{{1
" =============================================================================

    " Syntax folding
    set foldmethod=syntax

    " Fold one level only
    set foldnestmax=1

" ========================================================================= }}}
" Plugin settings {{{1
" =============================================================================

    " Run goimports before fmt-ing
    let g:go_fmt_command = "goimports"

    " Disable auto type info
    let g:go_auto_type_info = 0

" ========================================================================= }}}
" Mappings {{{1
" =============================================================================

    " Run commands
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage)
    au FileType go nmap <Leader>l <Plug>(go-metalinter)

    " By default the mapping gd is enabled which opens the target
    " identifier in current buffer. You can also open the
    " definition/declaration in a new vertical, horizontal or tab for
    " the word under your cursor:
    au FileType go nmap <Leader>ds <Plug>(go-def-split)
    au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dt <Plug>(go-def-tab)

    " Open the relevant Godoc for the word under the cursor
    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

    " Show a list of interfaces which is implemented by the type under
    " your cursor
    au FileType go nmap <Leader>s <Plug>(go-implements)

    " Show type info for the word under your cursor
    au FileType go nmap <Leader>i <Plug>(go-info)

    " Rename the identifier under the cursor to a new name
    au FileType go nmap <Leader>e <Plug>(go-rename)

" ========================================================================= }}}
" =============================================================================
" vim: foldmethod=marker foldmarker={{{,}}} ts=4 sts=4 sw=4 expandtab:
