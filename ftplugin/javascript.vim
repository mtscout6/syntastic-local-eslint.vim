if (!exists('g:syntastic_eslint_path'))
  let s:lcd = fnameescape(getcwd())
  silent! exec "lcd" expand('%:p:h')
  let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
  exec "lcd" s:lcd
  let g:syntastic_eslint_path = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endif
let b:syntastic_javascript_eslint_exec = g:syntastic_eslint_path
