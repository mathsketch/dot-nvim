local module = {}

module.package = {
  'lmburns/lf.nvim',
  requires = {'akinsho/toggleterm.nvim', module = 'toggleterm'},
  config = function()
    require("toggleterm").setup {
      float_opts = {
        winblend = 0,
      },
    }
    require("lf").setup {
      winblend = 0,
      border = 'rounded',
    }
  end,
  module = 'lf',
}

return module

