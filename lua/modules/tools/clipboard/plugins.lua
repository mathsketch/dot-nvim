local module = {}

module.package = {
  "AckslD/nvim-neoclip.lua",
  opt = true,
  config = function()
    require('neoclip').setup {
      enable_persistent_history = false,
      keys = {
        telescope = {
          i = {
            select = '<space>',
            paste = '<CR>',
            paste_behind = '<C-p>',
            replay = '<C-q>', -- replay a macro
            delete = '<C-d>', -- delete an entry
            custom = {},
          },
        },
      },
    }
  end,
  event = "BufRead"
}

return module
