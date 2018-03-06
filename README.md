# syntastic-local-eslint.vim

Prefer local repo install of eslint over global install with syntastic

Installation Instructions
-------------------------

Using [vim plugged](https://github.com/junegunn/vim-plug) you just need to add:

```
Plug 'mtscout6/syntastic-local-eslint.vim'
```

Configuration
-------------

If you want to use a different executable, e.g. `eslint_d`, then set the
`g:syntastic_local_eslint_exec` variable.

e.g. ` let g:syntastic_javascript_eslint_exec = 'eslint_d'` in your `vimrc`.

Inspired By
-----------

Inspired by http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/
