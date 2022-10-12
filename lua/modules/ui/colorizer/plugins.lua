local module = {}

module.package = {
  'NvChad/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      user_default_options = {
        mode = "background", -- foreground, background, virtualtext
        names = false,
        virtualtext = "■",
      }
    }
  end,
  event = 'BufReadPost',
}

return module
