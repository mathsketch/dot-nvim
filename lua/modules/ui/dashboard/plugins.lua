local module = {}

module.package = {
  'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons' },
  config = function()
    local dashboard = require('alpha.themes.dashboard')
    dashboard.section.buttons.val = {
      dashboard.button("i", "  New file", "<cmd>ene <CR>"),
      dashboard.button("SPC f f", "  Find file"),
      dashboard.button("SPC f r", "  Recently opened files"),
      dashboard.button("SPC f p", "  Open configurations"),
      dashboard.button("SPC h h", "  Open documentation"),
      dashboard.button("SPC q q", "  Exit Neovim"),
      -- dashboard.button("SPC s l", "  Open last session"),
      -- dashboard.button("SPC f m", "  Jump to bookmarks"),
    }
    ---@diagnostic disable-next-line: assign-type-mismatch
    dashboard.section.footer.val = function()
      local load_counter = 0
      local unload_counter = 0
      for _, pack in pairs(packer_plugins) do
        if pack.loaded then
          load_counter = load_counter + 1
        else
          unload_counter = unload_counter + 1
        end
      end

      local startup_file = "/tmp/nvim_startuptime"
      local startup_time_pattern = "([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+"

      -- read startup time file
      local startup_time_file = io.open(startup_file) and io.open(startup_file):read("*a") or nil

      -- get startup time and converts to number (in case `message` is function)
      local startup_time = startup_time_file and tonumber(startup_time_file:match(startup_time_pattern)) or nil

      -- 较长时间换算成秒
      local text = ''
      if startup_time and startup_time >= 1000 then
        text = string.format('Loaded %d packages in %.1fs', load_counter, startup_time / 1000)
      elseif startup_time then
        text = string.format('Loaded %d packages in %.1fms', load_counter, startup_time)
      else
        text = string.format('Loaded %d packages, unloaded %d packages', load_counter, unload_counter)
      end

      return text
    end
    vim.api.nvim_create_autocmd({ 'VimLeave' }, {
      pattern = {'*'},
      callback = function()
        local startup_file = "/tmp/nvim_startuptime"
        io.open(startup_file, "w"):close()
      end,
      once = true,
    })

    dashboard.config.layout = {
      { type = "padding", val = 5 },
      dashboard.section.header,
      { type = "padding", val = 5 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }
    dashboard.config.opts.setup = function()
      vim.keymap.set('', 'q', '<CMD>q<CR>', { buffer = true })
    end
    require('alpha').setup(dashboard.config)
  end,
}

return module
