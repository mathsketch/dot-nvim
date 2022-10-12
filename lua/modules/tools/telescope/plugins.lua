local module = {}

module.package = {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        opt = true },
      { 'nvim-telescope/telescope-file-browser.nvim', opt = true },
      { 'jvgrootveld/telescope-zoxide', opt = true },
      { 'nvim-telescope/telescope-packer.nvim', opt = true },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local builtin = require('telescope.builtin')
      local trouble = require("trouble.providers.telescope")
      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = "close",
              ["<C-k>"] = "move_selection_previous",
              ["<C-j>"] = "move_selection_next",
              ["<C-v>"] = "file_vsplit",
              ["<C-s>"] = "file_split",
              -- ["<C-t>"] = trouble.open_with_trouble,
            },
          },
          path_display = {
            truncate = 3,
          },
          prompt_prefix = "   ",
          layout_strategy = 'flex',
          layout_config = {
            width = 0.8,
            prompt_position = "bottom",
            horizontal = {
              preview_cutoff = 90,
              preview_width = 0.6,
            },
            vertical = {
              preview_cutoff = 30,
              preview_height = 0.45,
            },
          },
        },
        pickers = {
        },
        extensions = {
          zoxide = {
            list_command = "zoxide query -ls",
            mappings = {
              default = {
                keepinsert = true,
                action = function(selection)
                  builtin.find_files({ cwd = selection.path })
                end,
              }
            },
          }
        },
      }

      vim.cmd [[packadd telescope-fzf-native.nvim]]
      vim.cmd [[packadd telescope-file-browser.nvim]]
      vim.cmd [[packadd telescope-zoxide]]
      vim.cmd [[packadd telescope-packer.nvim]]
      -- vim.cmd [[packadd nvim-mapper]]

      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')
      telescope.load_extension('zoxide')
      telescope.load_extension('neoclip')
      telescope.load_extension('packer')
      -- telescope.load_extension('mapper')
    end,
    -- cmd = "Telescope",
    module = "telescope",
  }
}

return module
