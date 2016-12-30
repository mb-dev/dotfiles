call dein#add('fatih/vim-go', {'on_ft': 'go'})

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t :w<CR> <bar> <Plug>(go-test)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
