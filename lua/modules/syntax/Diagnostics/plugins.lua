local module = {}

module.package = {
  "folke/trouble.nvim",
  after = 'nvim-lspconfig',
  config = function()
    require("trouble").setup {
      padding = false,
      mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      indent_lines = true, -- add an indent guide below the fold icons
      auto_open = false, -- automatically open the list when you have diagnostics
      auto_close = false, -- automatically close the list when you have no diagnostics
      auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false, -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
      signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
      },
      use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
    }
  end,
  cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
}

return module
