local module = {}

module.package = {
  'ggandor/lightspeed.nvim',
  config = function()
    require('lightspeed').setup {
      ignore_case = true,
    }
  end,
  event = 'BufReadPost',
}

return module
