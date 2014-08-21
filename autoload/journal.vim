function journal#Start()
    set filetype=markdown
    autocmd BufWritePost <buffer> call journal#SaveHook()
endfunction

function journal#Enter()
    let g:journal_current = @%
endfunction

function journal#SaveHook()
    call system( g:journal_install_dir . "/save " . expand("%:p"))
    call system( g:journal_install_dir . "/generate_html " . expand("%:p"))
endfunction
