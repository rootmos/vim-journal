" Figure out where the plugin is installed
let g:journal_install_dir = resolve(expand("<sfile>:h") . "/..")

" Initialize the plugin
call journal#Initialize()

" Compose the regular expression used in the autocmds
let g:journal_regexp = g:journal_path . "/*.md"

" Add the hooks
execute('autocmd BufNewFile,BufRead ' . g:journal_regexp . ' call journal#Start()')
execute('autocmd BufEnter ' . g:journal_regexp . ' call journal#Enter()')

