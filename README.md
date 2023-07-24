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

- The plugin will automatically be wired into Conjure.

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

## Alternative

https://github.com/Vigemus/iron.nvim
```lua
local iron = require("iron.core")

iron.setup {
  config = {
    scratch_repl = true,
    repl_definition = {
      typescript = {
        command = { "deno" },
        format = require("iron.fts.common").bracketed_paste
      },
    },
    repl_open_cmd = require("iron.view").split.vertical.botright(50)
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    visual_send = "<space>is",
    send_file = "<space>if",
    send_line = "<space>il",
    cr = "<space>i<cr>",
    interrupt = "<space>i<space>",
    exit = "<space>iq",
    clear = "<space>ic",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}
```
