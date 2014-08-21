function JournalModeEnter()
    set filetype=markdown
    echom "Entering journal mode."
endfunction

autocmd BufNewFile,BufRead /home/gbehm/journal/*.md JournalModeEnter


