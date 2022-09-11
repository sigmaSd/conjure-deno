# Conjure - Deno

![image](https://user-images.githubusercontent.com/22427111/189539787-20e735fe-8509-4b80-970a-43f772cc2849.png)

Use deno repl with conjure

# Installation

- Add the plugin 

```lua
use 'Olical/conjure' -- conjure
use 'sigmaSd/conjure-deno' -- deno support
```

- Wire the plugin: Add these lines somewhere in your nvim config for example in `init.lua`

```lua
local conjure_filetypes = { "clojure", "fennel", "janet", "hy", "julia", "racket", "scheme", "lua", "lisp",
    "rust" }
for _, v in pairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
    conjure_filetypes[#conjure_filetypes + 1] = v
end

vim.g["conjure#filetypes"] = conjure_filetypes

local deno                                = "deno.deno"
vim.g["conjure#filetype#typescript"]      = deno
vim.g["conjure#filetype#typescriptreact"] = deno
vim.g["conjure#filetype#javascript"]      = deno
vim.g["conjure#filetype#javascriptreact"] = deno
```

# Usage

Opening a supported filetype should start deno repl, if you're unsure about the bindings just run `:ConjureSchool` to learn more

# Development

To hack on this plugin first run `make deps` then after each change to the fnl files run `make compile`
