local keymaps = {
  {
    '<LEADER>f',
    name = '+File',
    { 'f', '<CMD>Telescope find_files<CR>', name = 'find file' },
    { 'r', '<CMD>Telescope oldfiles<CR>', name = 'find recent file' },
    { 'p', '<CMD>Telescope find_files cwd=~/.config/nvim<CR>', name = 'find config file' },
    { 'z', '<CMD>Telescope zoxide list<CR>', name = "find recent directory's file" },
  },
  {
    '<LEADER>h',
    name = '+Help',
    { 't', '<CMD>Telescope help_tags<CR>', name = 'search help tags' },
    { 'm', '<CMD>Telescope man_pages<CR>', name = 'search man pages' },
    { 'o', '<CMD>Telescope vim_options<CR>', name = 'search vim options' },
    { 'l', '<CMD>Telescope highlights<CR>', name = 'search highlights' },
    { 's', '<CMD>Telescope colorscheme<CR>', name = 'search colorscheme' },
    { 'k', '<CMD>Telescope keymaps<CR>', name = 'search keymaps' },
  },
  {
    '<LEADER>s',
    name = '+Search',
    { 's', '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find({layout_strategy = "vertical"})<CR>',
      name = 'search current buffer content' },
    { 'S', '<CMD>lua require("telescope.builtin").grep_string({layout_strategy = "vertical"})<CR>',
      name = 'searches for the string under your cursor in your current working directory' },
    { 't', '<CMD>Telescope treesitter<CR>', name = 'search function names, variables, from treesitter' },
  },
  {
    '<LEADER>b',
    name = '+Buffer',
    { 'b', '<CMD>Telescope buffers<CR>', name = 'search buffers' },
  },
  {
    '<LEADER>o',
    name = '+Open',
    { 's', '<CMD>Telescope resume<CR>', name = 'open telescope' },
  },
  {
    '<LEADER>ls',
    name = '+Search',
    buffer = 'lsp',
    { 'd', '<CMD>Telescope lsp_definitions<CR>', name = 'search lsp definitions' },
    { 'r', '<CMD>Telescope lsp_references<CR>', name = 'search lsp references' },
    { 'i', '<CMD>Telescope lsp_implementations<CR>', name = 'search lsp implementations' },
    { 't', '<CMD>Telescope lsp_type_definitions<CR>', name = 'search lsp type definitions' },
    { 'q', '<CMD>lua require("telescope.builtin").diagnostics({layout_strategy = "vertical"})<CR>', name = 'search lsp type definitions' },
  },
  { '<LEADER>/', '<CMD>lua require("telescope.builtin").live_grep({layout_strategy = "vertical"})<CR>',
    name = 'search for a string in your current working directory' },
  { '<LEADER>:', '<CMD>Telescope commands<CR>', name = 'search available plugin/user commands' },
}

return keymaps
