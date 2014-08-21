function journal#Initialize()
    " Determine if we need to use the default path
    if !exists("g:journal_path")
        let g:journal_path = expand("$HOME/journals")
    endif
    
    " Check if the path is a new repository
    if !isdirectory(g:journal_path)
        call mkdir(g:journal_path, "p")
        call system(g:journal_install_dir . "/init_repository " . g:journal_path)
    endif

    " Setup the default journal
    let g:journal_current = resolve (g:journal_path . "/main.md")

endfunction

function journal#SwitchToJournal()
    " Switch to the buffer if it is open, othewise open it
    if bufexists(g:journal_current)
        execute("buffer " . bufnr(g:journal_current))
    else
        execute("edit " . g:journal_current)
    endif
endfunction

function journal#Start()
    " The journals use markdown, so we set the filetype to the relevant
    " plugin's filetype
    set filetype=markdown

    " Add the save hook for committing the journals
    autocmd BufWritePost <buffer> call journal#SaveHook()
endfunction

function journal#Enter()
    " Save the current buffer for quick navigation
    let g:journal_current = @%
endfunction

function journal#SaveHook()
    " Call the save script to commit the journal
    call system( g:journal_install_dir . "/save " . expand("%:p"))

    " Convert the journal to html
    call system( g:journal_install_dir . "/generate_html " . expand("%:p"))
endfunction
