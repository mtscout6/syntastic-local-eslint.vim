" return full path with the trailing slash
"  or an empty string if we're not in an npm project
fun! s:GetNodeModulesAbsPath ()
  let lcd_saved = fnameescape(getcwd())
  silent! exec "lcd" expand('%:p:h')
  let path = finddir('node_modules', '.;')
  exec "lcd" lcd_saved

  " fnamemodify will return full path with trailing slash;
  " if no node_modules found, we're safe
  return path is '' ? '' : fnamemodify(path, ':p')
endfun

" return full path of local eslint executable
"  or an empty string if no executable found
fun! s:GetEslintExec (node_modules)
  let eslint_guess = a:node_modules is '' ? '' : a:node_modules . '.bin/eslint'
  return exepath(eslint_guess)
endfun

" if eslint_exec found successfully, set it for the current buffer
fun! s:LetEslintExec (eslint_exec)
  if a:eslint_exec isnot ''
    let b:syntastic_javascript_eslint_exec = a:eslint_exec
  endif
endfun

fun! s:main ()
  let node_modules = s:GetNodeModulesAbsPath()
  let eslint_exec = s:GetEslintExec(node_modules)
  call s:LetEslintExec(eslint_exec)
endfun

call s:main()
