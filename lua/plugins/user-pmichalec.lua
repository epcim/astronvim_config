local u = "p.michalec"
local me = string.match(u, "epcim") or string.match(u, "michalec")
--if not me then return {} end -- WARN: only execute on the expected user

return {
  -- CUSTOMMIZE COMUNITY PLUIGINS BEHAVIOR OR INSTALL REQUIRED PLUGs
  {
    "folke/noice.nvim",
    opts = {
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "mini", -- default view for messages
        view_error = "mini", -- view for errors
        view_warn = "mini", -- view for warnings
      },
    },
  },

  --
  {
    "stevearc/oil.nvim",
    opts = {
      -- default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _) return name == ".." or name == ".git" end,
      },
    },
  },

  -- ADDITIONAL PLUGINS
  { "will133/vim-dirdiff", cmd = "DirDiff" },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    enabled = true,
    build = function() require("gitlab.server").build(true) end, -- Builds the Go binary
    config = function() require("gitlab").setup() end,
  },
  -- CONFIGURED FROM COMMUNITY
  -- {
  --   "alker0/chezmoi.vim",
  --   lazy = false,
  --   init = function()
  --     -- This option is required.
  --     vim.g["chezmoi#use_tmp_buffer"] = true
  --   end,
  -- },

  -- DEBUGING
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  -- diagnostics = {
  --   virtual_text = true,
  --   underline = true,
  -- },

  -- OTHER FILE
  --polish = function()
  -- vimrc
  --load vimrc config in init.lua from ~/.config/nvim/lua/user/vimrc.vim
  -- vim.cmd.source(vim.fn.stdpath "config" .. "/" .. "lua/vimrc.vim"),
  --end,
  --
}
