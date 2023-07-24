" Add filetypes supported by this plugin.
let g:conjure#filetypes += ['typescript']
let g:conjure#filetypes += ['javascript']
"
" Tell Conjure that this plugin will service these filetypes.
let g:conjure#filetype#typescript = "conjure.client.deno.stdio"
let g:conjure#filetype#javascript = "conjure.client.deno.stdio"

" Add autocmds for this Conjure client.
augroup conjure_init_filetypes
  au FileType typescript  lua require('conjure.mapping')['on-filetype']()
  au FileType javascript  lua require('conjure.mapping')['on-filetype']()
augroup END

" Disable diagnostics on the log buffer
"   - Moved here from fnl/deno/deno.fnl and translated to Vimscript.
augroup conjure_log_buf
  au!
  au BufNewFile 'conjure-log-*' lua vim.diagnostic.disable(0)
augroup END
