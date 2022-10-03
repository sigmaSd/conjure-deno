# Conjure - Deno

![image](https://user-images.githubusercontent.com/22427111/189539787-20e735fe-8509-4b80-970a-43f772cc2849.png)

Use deno repl with conjure

# Installation

- Add the plugin

```lua
use { 'Olical/conjure' }
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

# Usage

- Open a supported filetype
- Use `<leader>cs` to start the repl
- You can now use the repl, if you're unsure about the bindings just run
  `:ConjureSchool` to learn more

# Limitation

Statements should end with `;` , if you use `deno fmt` this is done
automatically.

This limitation is on purpose to allow sending multi-lines input to the repl in
the constraints of stdio ipc

# Development

To hack on this plugin first run `make deps` then after each change to the fnl
files run `make compile`
