-- Add filetypes supported by this plugin.
local cfts = vim.g['conjure#filetypes']
table.insert(cfts, 'typescript')
table.insert(cfts, 'javascript')
vim.g['conjure#filetypes'] = cfts

-- Tell Conjure that this plugin will service these filetypes.
vim.g['conjure#filetype#typescript'] = 'conjure.client.deno.stdio' 
vim.g['conjure#filetype#javascript'] = 'conjure.client.deno.stdio' 

-- Add autocmds for this Conjure client.
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"typescript", "javascript"},
  command = "lua require('conjure.mapping')['on-filetype']()",
  group = "conjure_init_filetypes"
})

-- No diagnostics in log buffers.
vim.api.nvim_create_augroup("conjure_log_buf",{})
vim.api.nvim_create_autocmd({"BufNewFile"}, {
  pattern = "conjure-log-*",
  command = "lua vim.diagnostic.disable(0)",
  group = "conjure_log_buf"
})

