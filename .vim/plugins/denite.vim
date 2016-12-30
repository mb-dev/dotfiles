"call dein#add('Shougo/denite.nvim', {'on_cmd': 'Denite'})
"nnoremap <silent> <C-p> :<C-u>Denite file_rec -mode=insert<CR>
"call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"  \ [ '.git/', '.ropeproject/', '__pycache__/',
"  \   'venv/', '*.min.*', 'node_modules/'])

"call denite#custom#var('file_rec', 'command',
"  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
