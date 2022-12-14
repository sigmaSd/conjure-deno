# Conjure - Deno
![image](https://user-images.githubusercontent.com/22427111/209433347-f5638bca-a60f-4ef3-8c94-ea404b4a8eda.png)

Use deno repl with conjure

## Installation

- Add the plugin

```lua
-- requires tree sitter, to figure the evaluation scope
use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
}
use 'Olical/conjure'
use 'sigmaSd/conjure-deno'
```

- Wire the plugin: Add these lines somewhere in your nvim config for example in
  `init.lua`

```lua
local conjure_filetypes = { "clojure", "fennel", "janet", "hy", "julia", "racket", "scheme", "lua", "lisp",
    "rust" }
for _, v in pairs({ "typescript", "javascript" }) do
    conjure_filetypes[#conjure_filetypes + 1] = v
end

vim.g["conjure#filetypes"] = conjure_filetypes

vim.g["conjure#filetype#typescript"]      = "deno.deno"
vim.g["conjure#filetype#javascript"]      = "deno.deno"
```

- Make sure to have tree sitter enabled, and the correct parsers installed
```
:TSInstall javascript
:TSInstall typescript
```

## Usage

- Open a supported filetype
- Use `<leader>cs` to start the repl
- You can now use the repl, if you're unsure about the bindings just run
  `:ConjureSchool` to learn more

## Limitation

Statements should end with `;` , if you use `deno fmt` this is done
automatically (it works even better if you have format on save).

This limitation is on purpose to allow sending multi-lines input to the repl in
the constraints of stdio ipc

## Node

If you want to use this as a node repl (since its really similar), you need to change the deno command here https://github.com/sigmaSd/conjure-deno/blob/403372515621c15833a32abb420e95d0e041f917/fnl/deno/deno.fnl#L24 to `"node --eval require(\"repl\").start()"` and then compile the plugin.

## Development

To hack on this plugin first run `make deps` then after each change to the fnl
files run `make compile`
