local module = {}

module.package = {
  'nvim-orgmode/orgmode',
  config = function()
    -- init custom treesitter grammar for org filetype
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup{}
  end,
  require'cmp'.setup {
    sources = {
      { name = 'orgmode' }
    }
  },
  ft = 'org',
}

return module
