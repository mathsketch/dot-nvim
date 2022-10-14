local module = {}

local config = function()
  local icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }
  for kind, icon in pairs(icons) do
    vim.lsp.protocol.CompletionItemKind[kind] = icon
  end

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    float = {
      show_header = false,
      border = 'rounded',
    },
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  local diagnostics_icons = {
    -- DiagnosticSignError = '',
    -- DiagnosticSignWarn = '',
    -- DiagnosticSignInfo = '',
    -- DiagnosticSignHint = '',
    DiagnosticSignError = '',
    DiagnosticSignWarn = '',
    DiagnosticSignInfo = '',
    DiagnosticSignHint = '',
  }
  for name, icon in pairs(diagnostics_icons) do
    vim.fn.sign_define(name, { text = icon, texthl = name })
  end

  local lsp = require('lspconfig')
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    require('basic.keymaps').load_buffer_keymaps("lsp", bufnr)
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
      end
    })
  end

  -- lspinfo ui config
  require('lspconfig.ui.windows').default_options.border = vim.g.floating_style == 'has_border' and 'rounded' or 'none'
  vim.api.nvim_set_hl(0, 'LspInfoBorder', { link = 'FloatBorder' })

  lsp.pyright.setup {
    on_attach = on_attach,
  }
  lsp.bashls.setup {
    on_attach = on_attach,
  }
  lsp.rust_analyzer.setup {
    on_attach = on_attach,
  }
  lsp.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

module.package = {
  {
    "ray-x/lsp_signature.nvim",
    after = 'nvim-lspconfig',
    config = function()
      require("lsp_signature").setup {
        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
        floating_window_off_x = 1, -- adjust float windows x position.
        floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
        close_timeout = 4000, -- close floating window after ms when laster parameter is entered
        hint_enable = true, -- virtual hint enable
        hint_prefix = " ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
        hint_scheme = "String",
        hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
        handler_opts = {
          border = "rounded" -- double, rounded, single, shadow, none
        },
        padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc
        transparency = 100, -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 100, -- if you using shadow as border use this set the opacity
        shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
        timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
        toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
        move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
      }
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    after = 'nvim-lspconfig',
    config = function()
      require("inc_rename").setup({
        input_buffer_type = "dressing",
        hl_group = "Substitute",
        preview_empty_name = false,
        show_message = true,
      })
    end,
    cmd = 'IncRename',
  },
  {
    'neovim/nvim-lspconfig',
    config = config,
    event = 'BufReadPost',
  },
}

return module
