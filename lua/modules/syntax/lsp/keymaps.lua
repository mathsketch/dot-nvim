local keymaps = {
  buffer = 'lsp',
  { 'gD', vim.lsp.buf.declaration, name = 'jump to declaration' },
  { 'gd', vim.lsp.buf.definition, name = 'jump to definition' },
  { 'gi', vim.lsp.buf.implementation, name = 'jump to implementation' },
  { 'gr', vim.lsp.buf.references, name = 'jump to references' },
  { "ga", vim.lsp.buf.code_action, name = "do code action" },
  { 'K', vim.lsp.buf.hover, name = 'display hover information' },
  { "<C-p>", vim.diagnostic.goto_prev, name = "jump to prev diagnostic" },
  { "<C-n>", vim.diagnostic.goto_next, name = "jump to next diagnostic" },
  { "<C-k>", vim.lsp.buf.signature_help, name = "show signature help" },
  { "[d", vim.diagnostic.goto_prev, name = "jump to prev diagnostic" },
  { "]d", vim.diagnostic.goto_next, name = "jump to next diagnostic" },
  {
    '<LEADER>l',
    name = '+LSP',
    {
      'w',
      name = 'workspace',
      { 'a', vim.lsp.buf.add_workspace_folder, name = 'add workspace folder' },
      { 'r', vim.lsp.buf.remove_workspace_folder, name = 'remove workspace folder' },
      { 'l', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, name = 'list workspace folders' },
    },
    { 'r', '<CMD>LspRestart<CR>', name = 'restart LSP'},
    { 'k', '<CMD>LspStop<CR>', name = 'stop LSP'},
    { 'o', '<CMD>LspStart<CR>', name = 'start LSP'},
    { 'i', '<CMD>LspInfo<CR>', name = 'LSP info'},
  },
  {
    '<LEADER>c',
    name = '+Code',
    { 'D', vim.lsp.buf.declaration, name = 'jump to declaration' },
    { 'd', vim.lsp.buf.definition, name = 'jump to definition' },
    { 'i', vim.lsp.buf.implementation, name = 'jump to implementation' },
    { 'r', vim.lsp.buf.references, name = 'jump to references' },
    { 'a', vim.lsp.buf.code_action, name = 'code action' },
    -- { 'rn', vim.lsp.buf.rename, name = 'LSP rename' },
    { 'r', function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, opts = { expr = true }, name = 'LSP rename' },
    { 'f', function()
      vim.lsp.buf.format { async = true }
    end, name = 'format buffer' },
    { 't', vim.lsp.buf.type_definition, name = 'jump to the definition of type' },
    -- { 'q', vim.diagnostic.setloclist, name = 'setloclist' }
  },
}
return keymaps
