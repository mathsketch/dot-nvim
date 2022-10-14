local module = {}

module.package = {
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufRead' },
      { 'RRethy/nvim-treesitter-textsubjects', event = 'BufRead' },
      { 'p00f/nvim-ts-rainbow', event = 'BufRead' },
    },
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "rust", "python", "bash" },
        auto_install = true,
        highlight = {
          enable = true,
          -- disable = { "c", "rust" },
          additional_vim_regex_highlighting = true,
        },
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = 5000, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "grc",
            node_decremental = "<BS>",
          },
        },
        indent = {
          enable = true,
        },
        textsubjects = {
          enable = true,
          prev_selection = ',',
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ia"] = "@parameter.inner",
              ["aa"] = "@parameter.outer",
            },
            include_surrounding_whitespace = true,
          },
        },
      }
      vim.o.foldmethod = 'expr'
      vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
    end,
    event = 'BufRead',
  },
}

return module
