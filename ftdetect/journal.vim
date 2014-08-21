" Figure out where the plugin is installed
let g:journal_install_dir = resolve(expand("<sfile>:h") . "/..")

" Determine if we need to use the default path
if !exists("g:journal_path")
    let g:journal_path = expand("$HOME/journals")
endif

" Check if the path is a new repository
if !isdirectory(g:journal_path)
    call mkdir(g:journal_path, "p")
    echom system(g:journal_install_dir . "/init_repository " . g:journal_path)
endif

" Compose the regular expression used in the autocmds
let g:journal_regexp = g:journal_path . "/*.md"

" Add the hooks
execute('autocmd BufNewFile,BufRead ' . g:journal_regexp . ' call journal#Start()')
execute('autocmd BufEnter ' . g:journal_regexp . ' call journal#Enter()')

