local module = {}

module.package = {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require('which-key')

      -- disable v operator
      local presets = require("which-key.plugins.presets")
      presets.operators["v"] = nil

      wk.setup {
        window = {
          border = "rounded",
        },
      }

      local keymaps = require('basic.keymaps')
      wk.register(keymaps.keymap_groups)
    end,
  },
  {
    "lazytanuki/nvim-mapper",
    after = 'telescope.nvim',
    config = function()
      local mapper = require("nvim-mapper")
      mapper.setup {}
    end,
    disable = true,
  },
  {
    "mrjones2014/legendary.nvim",
    config = function()
      local keymaps = require('basic.keymaps')
      require('legendary').setup {
        include_builtin = false,
        include_legendary_cmds = true,
        select_prompt = nil,
        formatter = nil,
        most_recent_item_at_top = true,
        keymaps = keymaps.keymaps_legendary,
        commands = {},
        functions = {},
        autocmds = {},
        auto_register_which_key = true,
        scratchpad = {
          display_results = 'float', -- 'print' or 'float
          cache_file = string.format('%s/%s', vim.fn.stdpath('cache'), 'legendary_scratch.lua'),
        }
      }
    end,
    opt = true,
  }
}

return module
