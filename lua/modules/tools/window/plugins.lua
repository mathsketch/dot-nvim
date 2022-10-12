local module = {}

module.package = {
  {
    'sindrets/winshift.nvim',
    config = function()
      require("winshift").setup {
        keymaps = {
          disable_defaults = false,
          win_move_mode = {
            ["h"] = "left",
            ["j"] = "down",
            ["k"] = "up",
            ["l"] = "right",
            ["H"] = "far_left",
            ["J"] = "far_down",
            ["K"] = "far_up",
            ["L"] = "far_right",
            ["<left>"] = "left",
            ["<down>"] = "down",
            ["<up>"] = "up",
            ["<right>"] = "right",
            ["<S-left>"] = "far_left",
            ["<S-down>"] = "far_down",
            ["<S-up>"] = "far_up",
            ["<S-right>"] = "far_right",
          },
        },
      }
    end,
    cmd = 'WinShift',
  },
  {
    "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end,
    disable = true,
  },
  {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
    event = 'WinNew',
    cmd = { 'FocusToggle', 'FocusSplitNicely', 'FocusSplitCycle', 'FocusSplitCycle' },
  },
}

return module
