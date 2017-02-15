" backup local cwd
" and change it to the directory of the current file
let s:lcd = fnameescape(getcwd())
silent! exec "lcd" expand('%:p:h')

" detect shell and choose the command to find the eslint executable
if &shell =~# 'fish'
  let s:which_cmd = 'begin; set -lx PATH (npm bin --silent) $PATH; and which eslint; end'
else
  let s:which_cmd = 'PATH=$(npm bin --silent):$PATH && which eslint'
endif

" get the path of the eslint executable
" and set it as a checker for the current buffer
let s:eslint_path = system(s:which_cmd)
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
