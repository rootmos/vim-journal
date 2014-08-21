if !exists("g:journal_path")
    let g:journal_path = expand("$HOME/journals")
endif

let g:journal_regexp = g:journal_path . "/*.md"
let g:journal_install_dir = resolve(expand("<sfile>:h") . "/..")

execute('autocmd BufNewFile,BufRead ' . g:journal_regexp . ' call journal#Start()')
execute('autocmd BufEnter ' . g:journal_regexp . ' call journal#Enter()')

