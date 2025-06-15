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
  { "MeanderingProgrammer/render-markdown.nvim", opts = {
    file_types = { "markdown", "Avante" },
  } },
  {
    "yetone/avante.nvim",
    opts = {
      -- add any opts here
      -- for example
      provider = "f5gpt",
      providers = {
        f5gpt = {
          __inherited_from = "openai",
          api_key_name = "F5GPT_API_KEY",
          endpoint = "https://f5ai.pd.f5net.com/openai/",
          model = "o4-mini",
          -- openai = {
          --   endpoint = "https://api.openai.com/v1",
          --   model = "o4-mini", -- your desired model (or use gpt-4o, etc.)
          --   extra_request_body = {
          --     timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          --     temperature = 0.75,
          --     max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
          --     --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          --   },
          -- },
        },
        behavior = {
          auto_suggestions = true,
          enable_claude_text_editor_tool_mode = true,
        },
      },
    },
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
}
