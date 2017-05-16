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

fun! s:FindJavascriptLinter (node_modules)
  if a:node_modules is ''
    return
  elseif executable(a:node_modules . '.bin/eslint')
    let b:syntastic_javascript_eslint_exec = exepath(a:node_modules . '.bin/eslint')
  elseif executable(a:node_modules . '.bin/standard')
    let g:syntastic_javascript_checkers = ['standard']
    let b:syntastic_javascript_standard_exec = exepath(a:node_modules . '.bin/standard')
  elseif executable(a:node_modules . '.bin/semistandard')
    let g:syntastic_javascript_checkers = ['standard']
    let b:syntastic_javascript_standard_exec = exepath(a:node_modules . '.bin/semistandard')
  endif
endfun

fun! s:main ()
  let node_modules = s:GetNodeModulesAbsPath()
  call s:FindJavascriptLinter(node_modules)
endfun

call s:main()
