return {
  {
    "AstroNvim/astrocommunity",
    --{ import = "astrocommunity.completion.avante-nvim" },
    { import = "astrocommunity.completion.minuet-ai-nvim" },
    { import = "astrocommunity.editing-support.mcphub-nvim" },
    { import = "astrocommunity.editing-support.vector-code-nvim" },
    { import = "astrocommunity.editing-support.codecompanion-nvim" },
  },
  -- UTILS
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante" },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
  -- DEPRECATED in favor of vectr-code
  -- {
  --   "banjo/contextfiles.nvim",
  --   otps = {
  --     context_dir = ".cursor/rules",
  --     gist_ids = {},
  --     enable_local = true,
  --   },
  -- },
  -- INTERESTING but not mature
  -- {
  --   "dlants/magenta.nvim",
  --   lazy = false, -- you could also bind to <leader>mt
  --   build = "npm install --frozen-lockfile",
  --   opts = {},
  -- },
  --
  -- TO EVALUATE
  -- - ???/sarang
  -- - opencode
  -- - https://github.com/olimorris/codecompanion.nvim/discussions/1013 openrouter
  --
  --
  -- CODECOMPANION
  { -- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/editing-support/codecompanion-nvim/init.lua
    -- additional config for editing-support.codecompanion astrocommunity
    "olimorris/codecompanion.nvim",
    dependencies = { -- function(_, opts) ... end,
      "ravitemer/mcphub.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
      -- opts = {
      --   log_level = "DEBUG",
      -- },
      adapters = {
        -- https://codecompanion.olimorris.dev/getting-started.html
        -- https://codecompanion.olimorris.dev/configuration/adapters
        -- https://github.com/deepseek-ai/awesome-deepseek-integration/blob/main/docs/codecompanion.nvim/README.md#install-via-lazynvim
        -- openai_compatible https://github.com/olimorris/codecompanion.nvim/discussions/1760
        v5gpt = function()
          return require("codecompanion.adapters").extend("openai_compatible", { -- openai, openai_compatible
            env = {
              url = "AZURE_OPENAI_ENDPOINT",
              api_key = "AZURE_OPENAI_API_KEY",
              --url = "https://v5ai.pd.v5net.com/openai",
              --api_key = "cmd:gopass -o 'v5/api/v5gpt_api_key'",
            },
            schema = {
              model = {
                default = "gpt-4o",
              },
            },
          })
        end,
        v5gptMini = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "AZURE_OPENAI_ENDPOINT",
              api_key = "AZURE_OPENAI_API_KEY",
              -- url = "https://v5ai.pd.v5net.com/openai",
              -- api_key = "cmd:gopass -o 'v5/api/v5gpt_api_key'",
            },
            schema = {
              model = {
                default = "o3-mini",
              },
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "v5gpt" },
        agent = { adapter = "v5gpt" },
        inline = { adapter = "v5gptMini" },
      },
      -- require("codecompanion").setup {
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      --
      --   Configuring the Prompt Library
      --   https://codecompanion.olimorris.dev/configuration/prompt-library#assigning-prompts-to-a-keymap
      --   TODO
    },
  },
  --
  -- AVANTE
  -- {
  --   "yetone/avante.nvim",
  --   -- keys = {
  --   --   {
  --   --     "<leader>A+",
  --   --     function()
  --   --       local tree_ext = require "avante.extensions.nvim_tree"
  --   --       tree_ext.add_file()
  --   --     end,
  --   --     desc = "Select file in NvimTree",
  --   --     ft = "NvimTree",
  --   --   },
  --   --   {
  --   --     "<leader>A-",
  --   --     function()
  --   --       local tree_ext = require "avante.extensions.nvim_tree"
  --   --       tree_ext.remove_file()
  --   --     end,
  --   --     desc = "Deselect file in NvimTree",
  --   --     ft = "NvimTree",
  --   --   },
  --   -- },
  --   opts = {
  --     --
  --     -- selector = {
  --     --   exclude_auto_select = { "NvimTree" },
  --     -- },
  --     --
  --     provider = "v5gpt",
  --     providers = {
  --       v5gpt = {
  --         __inherited_from = "openai",
  --         api_key_name = "v5GPT_API_KEY",
  --         endpoint = "https://v5ai.pd.v5net.com/openai/",
  --         model = "gpt-4.1",
  --       },
  --       -- v5gptMini = {
  --       --   __inherited_from = "openai",
  --       --   api_key_name = "v5GPT_API_KEY",
  --       --   endpoint = "https://v5ai.pd.v5net.com/openai/",
  --       --   model = "o3-mini",
  --       -- },
  --       -- openai = {
  --       --   endpoint = "https://api.openai.com/v1",
  --       --   model = "o4-mini", -- your desired model (or use gpt-4o, etc.)
  --       --   extra_request_body = {
  --       --     timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --       --     temperature = 0.75,
  --       --     max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --       --     --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --       --   },
  --       -- },
  --       --
  --       -- claude = {
  --       --   endpoint = "https://api.anthropic.com",
  --       --   model = "claude-sonnet-4-20250514",
  --       --   timeout = 30000, -- Timeout in milliseconds
  --       --     extra_request_body = {
  --       --       temperature = 0.75,
  --       --       max_tokens = 20480,
  --       --     },
  --       -- },
  --     },
  --     behavior = {
  --       file_selector = "telescope",
  --       -- use_cwd_as_project_root = false,
  --       auto_suggestions = true,
  --       enable_claude_text_editor_tool_mode = true,
  --       -- auto_approve_tool_permissions = true,
  --       -- auto_approve_tool_permissions = {"bash", "replace_in_file"}, -- Auto-approve specific tools only
  --     },
  --     vim.api.nvim_create_autocmd("User", {
  --       pattern = "myTogglePrompt",
  --       callback = function(event)
  --         local prompt = (event.data and event.data.prompt) or ""
  --         require("avante.config").override { system_prompt = prompt }
  --       end,
  --     }),
  --   },
  --   --
  --   -- The custom_tools type supports both a list and a function that returns a list.
  --   -- Using a function here prevents requiring mcphub before it's loaded
  --   --
  --   -- system_prompt = function()
  --   --   -- already defined on mcphub astrocomunity lua
  --   --   local hub = require("mcphub").get_hub_instance()
  --   --   return hub:get_active_servers_prompt()
  --   -- end,
  --   -- DISABLE WHEN MCPHUB IS USED
  --   -- NOTE: https://ravitemer.github.io/mcphub.nvim/extensions/avante.html#tool-conflicts
  --   disabled_tools = {
  --     -- Built-in file operations
  --     "list_files",
  --     "search_files",
  --     "read_file",
  --     "create_file",
  --     "rename_file",
  --     "delete_file",
  --     "create_dir",
  --     "rename_dir",
  --     "delete_dir",
  --     -- Built-in terminal access
  --     "bash",
  --   },
  -- },

  -- CUSTOM KEY SHORTCUTS
  -- prompt switching (Avante)
  {
    vim.keymap.set("n", "<leader>Ap", function()
      local prompt = ""
      local prompt_dir = vim.fn.expand "~/.config/ai/prompts"
      local files = vim.fn.globpath(prompt_dir, "*", false, true)
      local filenames = vim.tbl_map(function(file) return vim.fn.fnamemodify(file, ":t") end, files)
      vim.ui.select(filenames, { prompt = "Select prompt file:" }, function(choice)
        if not choice then return end
        local path = prompt_dir .. "/" .. choice
        local lines = vim.fn.readfile(path)
        prompt = table.concat(lines, "\n")
      end)
      vim.api.nvim_exec_autocmds("User", { pattern = "myTogglePrompt", data = { prompt = prompt } })
    end, { desc = "avante: toggle my prompts" }),
  },
  -- model switching (CodeCompanion.feedkeys".run(1)
  -- q
}
