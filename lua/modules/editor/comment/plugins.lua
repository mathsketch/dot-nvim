local module = {}

module.package = {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
  event = 'BufReadPost',
}

return module
