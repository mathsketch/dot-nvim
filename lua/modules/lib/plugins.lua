local module = {}

module.package = {
  { 'nvim-lua/plenary.nvim', module = 'plenary', },
  { 'kkharji/sqlite.lua', module = 'sqlite', },
  {
    'stevearc/dressing.nvim',
    event = 'UIEnter',
    config = function()
      require('dressing').setup({
        input = {
          winhighlight = "NormalFloat:GruvboxFg0,FloatTitle:GruvboxFg2",
          winblend = 0,
          override = function(opts)
            opts.col = -1
            opts.row = 0
            return opts
          end,
        },
        select = {
          telescope = require('telescope.themes').get_dropdown {
            layout_config = {
              prompt_position = 'top',
              width = 0.5,
              height = 0.7,
            }
          },
          get_config = function(opts)
            if opts.kind == 'codeaction' then
              return {
                telescope = require('telescope.themes').get_cursor({}),
              }
            end
          end,
        },
      })
    end,
  },
}

return module
