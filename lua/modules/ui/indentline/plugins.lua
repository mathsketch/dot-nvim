local module = {}

-- module.package = {
--     'windwp/windline.nvim',
--     config = function()
--         require('wlsample.bubble')
--     end
-- }

module.package = {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    -- vim.opt.list = true
    -- vim.opt.listchars:append "eol:↴"
    require("indent_blankline").setup {
      use_treesitter = true,
      show_current_context = true,
      -- show_current_context_start = true,
      -- show_end_of_line = true,
      --   char = "│",
      show_first_indent_level = false,
      filetype_exclude = { "help", "alpha", "packer", "man" },
      buftype_exclude = { "terminal" },
    }

    vim.g.indent_blankline_context_highlight_list = { 'GruvboxFg4' }
  end,
  event = 'BufReadPost',
}

return module
