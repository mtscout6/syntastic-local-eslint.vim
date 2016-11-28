if !exists("g:localEslintDetected")
    let s:lcd = fnameescape(getcwd())
    silent! exec "lcd" expand('%:p:h')
    let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
    exec "lcd" s:lcd
    let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
    let g:localEslintDetected=1
endif
