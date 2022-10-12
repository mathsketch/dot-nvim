---@diagnostic disable: need-check-nil
local module = {}

module.package = {
  -- {
  --     'ms-jpq/coq_nvim',
  --     branch = 'coq',
  --     requires = {
  --         { 'ms-jpq/coq.artifacts', branch = 'artifacts', },
  --         { 'ms-jpq/coq.thirdparty', branch = '3p', },
  --     },
  --     config = function()
  --     end,
  --     disable = true,
  -- },
  {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-lspconfig' },
      { 'hrsh7th/cmp-path', after = 'nvim-lspconfig' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-lspconfig' },
    },
    config = function()
      local luasnip = require("luasnip")
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      cmp.setup {
        completion = {
          keyword_length = 3,
        },
        view = {
          entries = {
            name = 'custom',
            selection_order = 'near_cursor',
          },
        },
        window = {
          completion = {
            border = vim.g.floating_style == 'has_border' and 'rounded' or 'none',
            scrolloff = 3,
            winhighlight = '',
          },
          documentation = {
            border = vim.g.floating_style == 'has_border' and 'rounded' or 'none',
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = vim_item.kind
            -- add special file icon and dir icon
            if vim.tbl_contains({ 'path' }, entry.source.name) then
              local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
              if icon and hl_group then
                vim_item.kind = icon
                vim_item.kind_hl_group = hl_group
              else
                vim_item.kind = string.format('%s', vim.lsp.protocol.CompletionItemKind[vim_item.kind])
              end
            else
              vim_item.kind = string.format('%s', vim.lsp.protocol.CompletionItemKind[vim_item.kind])
            end
            vim_item.menu = string.format(' %s %s', kind, ({
              buffer = "[Buffer]",
              cmdline = "[Cmd]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
            })[entry.source.name] or '')
            return vim_item
          end,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources {
          { name = 'nvim_lua' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
      }

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

    end,
    event = 'BufRead',
  },
}

return module
