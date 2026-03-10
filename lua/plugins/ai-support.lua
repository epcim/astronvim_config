return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.recipes.ai" }, -- https://docs.astronvim.com/recipes/ai/

  -- DEPRECATED OR TO EVAL
  -- { import = "astrocommunity.completion.avante-nvim" },
  -- { import = "astrocommunity.completion.minuet-ai-nvim" },
  -- disable when out of quota
  { import = "astrocommunity.completion.copilot-cmp" },
  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.copilot-vim" },
  -- { import = "astrocommunity.completion.copilot-vim-cmp" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },
  --{ import = "astrocommunity.editing-support.mcphub-nvim" },
  --{ import = "astrocommunity.editing-support.vector-code-nvim" },
  --{ import = "astrocommunity.editing-support.codecompanion-nvim" },
  --
  -- UTILS
  -- { "ravitemer/mcphub.nvim", opts = {
  -- { port = 37373, config = "~/.config/mcphub/servers.json" },
  -- } },
  --
  {
    "sphamba/smear-cursor.nvim", -- https://github.com/sphamba/smear-cursor.nvim
    opts = {},
  },
  -- {
  --   "Piotr1215/pairup.nvim",
  --   cmd = { "Pairup" },
  --   keys = {
  --     { "<leader>cc", "<cmd>Pairup start<cr>", desc = "Start Claude" },
  --     { "<leader>ct", "<cmd>Pairup toggle<cr>", desc = "Toggle terminal" },
  --     { "<leader>cq", "<cmd>Pairup markers user<cr>", desc = "Show uu: questions" },
  --     { "<leader>cC", "<cmd>Pairup markers claude<cr>", desc = "Show cc: markers" },
  --     { "<leader>cx", "<cmd>Pairup stop<cr>", desc = "Stop Claude" },
  --   },
  --   config = function()
  --     require("pairup").setup()
  --     -- Default works out of the box. Override only if needed:
  --     -- require("pairup").setup({
  --     --   provider = "claude",
  --     --   provider = "opencode",
  --     --   providers = {
  --     --     claude = { cmd = "claude --permission-mode plan" },
  --     --   },
  --     -- })
  --   end,
  -- },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        keymap = {
          accept = false, -- handled by completion engine
        },
      },
    },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              -- set the ai_accept function
              ai_accept = function()
                if require("copilot.suggestion").is_visible() then
                  require("copilot.suggestion").accept()
                  return true
                end
              end,
            },
          },
        },
      },
    },
  },
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = {
      "nvim-mini/mini.icons",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings or {}
          local fdir = vim.fn.expand "%:h"
          maps.n["<Leader>E"] = {
            function() require("fyler").toggle { dir = fdir, kind = "float" } end,
            desc = "Open Fyler",
          }
        end,
      },
    },
    branch = "stable", -- Use stable branch for production
    lazy = false, -- Necessary for `default_explorer` to work properly
    opts = {},
  },
  -- {
  --     "A7Lavinraj/fyler.nvim",
  --     dependencies = {
  --       "nvim-mini/mini.icons",
  --       {
  --         "AstroNvim/astrocore",
  --         opts = function(_, opts)
  --           local maps = opts.mappings or {}
  --           --local fdir = require("oil").get_current_dir()
  --           maps.n["<Leader>E"] = {
  --             function(self) require("fyler").toggle { dir = self.bufnr, kind = "float" } end,
  --             desc = "Open with fyler",
  --           }
  --         end,
  --       },
  --     },
  --   },

  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = {
  --     linters = {
  --       yamllint = {
  --         cmd = "yamllint",
  --         args = { "-c", vim.fn.expand "~/.config/yamllint/config", "-f", "parsable", "-" },
  --         stdin = true,
  --       },
  --       -- Customizing the markdownlint linter, store .markdownlint.yaml in each project
  --       --       -- markdownlint = {
  --       --       -- args = { "--disable"  "MD009", "--disable", "MD013", "--" },
  --       --       -- args = { "--config", vim.fn.expand "$HOME/.markdownlint.yaml", "--" },
  --       --       -- },
  --       --       ["markdownlint-cli2"] = {
  --       --         -- Pass extra arguments to disable rule MD009 (trailing spaces)
  --       --         args = { "--config", vim.fn.expand "$HOME/.markdownlint-cli2.yaml", "--" },
  --       --       },
  --     },
  --   },
  -- },
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters = {
  --       ["markdownlint-cli2"] = {
  --         args = { "--config", vim.fn.expand "$HOME/.markdownlint-cli2.yaml", "--fix", "$FILENAME" },
  --       },
  --     },
  --   },
  -- },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      -- filetypes = {
      --
      --   codecompanion = {
      --     prompt_for_file_name = false,
      --     template = "[Image]($FILE_PATH)",
      --     use_absolute_path = true,
      --   },
      -- },
    },
  },
  --
  -- LLM
  --{ import = "astrocommunity.ai.kurama622-llm-nvim" },
  --
  -- OPENCODE
  { import = "astrocommunity.ai.opencode-nvim" },
  -- {
  --   "NickvanDyke/opencode.nvim",
  --   dependencies = {
  --     -- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal — otherwise optional
  --     { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  --     -- { "ravitemer/mcphub.nvim" },
  --   },
  --   ---@type opencode.Opts
  --   opts = {
  --     -- Your configuration, if any — see lua/opencode/config.lua
  --   },
  --   keys = {
  --     -- Recommended keymaps
  --     { "<leader>oA", function() require("opencode").ask() end, desc = "Ask opencode" },
  --     {
  --       "<leader>oa",
  --       function() require("opencode").ask "@cursor: " end,
  --       desc = "Ask opencode about this",
  --       mode = "n",
  --     },
  --     {
  --       "<leader>oa",
  --       function() require("opencode").ask "@selection: " end,
  --       desc = "Ask opencode about selection",
  --       mode = "v",
  --     },
  --     { "<leader>ot", function() require("opencode").toggle() end, desc = "Toggle embedded opencode" },
  --     { "<leader>on", function() require("opencode").command "session_new" end, desc = "New session" },
  --     { "<leader>oy", function() require("opencode").command "messages_copy" end, desc = "Copy last message" },
  --     {
  --       "<S-C-u>",
  --       function() require("opencode").command "messages_half_page_up" end,
  --       desc = "Scroll messages up",
  --     },
  --     {
  --       "<S-C-d>",
  --       function() require("opencode").command "messages_half_page_down" end,
  --       desc = "Scroll messages down",
  --     },
  --     {
  --       "<leader>op",
  --       function() require("opencode").select_prompt() end,
  --       desc = "Select prompt",
  --       mode = { "n", "v" },
  --     },
  --     -- Example: keymap for custom prompt
  --     {
  --       "<leader>oe",
  --       function() require("opencode").prompt "Explain @cursor and its context" end,
  --       desc = "Explain code near cursor",
  --     },
  --   },
  -- },
  --
  -- CODECOMPANION
  -- { -- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/editing-support/codecompanion-nvim/init.lua
  --   -- additional config for editing-support.codecompanion astrocommunity
  --   "olimorris/codecompanion.nvim",
  --   dependencies = { -- function(_, opts) ... end,
  --     { "nvim-lua/plenary.nvim", branch = "master" },
  --     "ravitemer/mcphub.nvim",
  --     "hrsh7th/nvim-cmp",
  --     "nvim-telescope/telescope.nvim",
  --     {
  --       "stevearc/dressing.nvim",
  --       opts = {},
  --     },
  --     {
  --       "saghen/blink.cmp",
  --       ---@module 'blink.cmp'
  --       ---@type blink.cmp.Config
  --       opts = {
  --         sources = {
  --           default = { "codecompanion" },
  --           providers = {
  --             codecompanion = {
  --               name = "CodeCompanion",
  --               module = "codecompanion.providers.completion.blink",
  --               enabled = true,
  --             },
  --           },
  --         },
  --       },
  --       opts_extend = {
  --         "sources.default",
  --       },
  --     },
  --   },
  --   opts = {
  --     -- Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
  --     --
  --     -- language = "English",
  --     -- log_level = "DEBUG", -- TRACE|DEBUG|ERROR|INFO
  --     adapters = {
  --       -- https://codecompanion.olimorris.dev/getting-started.html
  --       -- https://codecompanion.olimorris.dev/configuration/adapters
  --       -- https://github.com/deepseek-ai/awesome-deepseek-integration/blob/main/docs/codecompanion.nvim/README.md#install-via-lazynvim
  --       -- openai_compatible https://github.com/olimorris/codecompanion.nvim/discussions/1760
  --       v5gpt = function()
  --         return require("codecompanion.adapters").extend("openai_compatible", { -- openai, openai_compatible
  --           env = {
  --             url = "AZURE_OPENAI_ENDPOINT",
  --             api_key = "AZURE_OPENAI_API_KEY",
  --             --url = "https://v5ai.pd.v5net.com/openai",
  --             --api_key = "cmd:gopass -o 'v5/api/v5gpt_api_key'",
  --           },
  --           schema = {
  --             model = {
  --               --default = "gpt-4o",
  --               default = "gpt-4.1",
  --             },
  --           },
  --         })
  --       end,
  --       v5gptMini = function()
  --         return require("codecompanion.adapters").extend("openai_compatible", {
  --           env = {
  --             url = "AZURE_OPENAI_ENDPOINT",
  --             api_key = "AZURE_OPENAI_API_KEY",
  --             -- url = "https://v5ai.pd.v5net.com/openai",
  --             -- api_key = "cmd:gopass -o 'v5/api/v5gpt_api_key'",
  --           },
  --           schema = {
  --             model = {
  --               default = "o3-mini",
  --             },
  --           },
  --         })
  --       end,
  --     },
  --     strategies = {
  --       chat = { adapter = "v5gpt" },
  --       agent = { adapter = "v5gpt" },
  --       inline = { adapter = "v5gptMini" },
  --     },
  --     -- require("codecompanion").setup {
  --     extensions = {
  --       mcphub = {
  --         callback = "mcphub.extensions.codecompanion",
  --         opts = {
  --           make_vars = true,
  --           make_slash_commands = true,
  --           show_result_in_chat = true,
  --         },
  --       },
  --     },
  --     --
  --     --   Configuring the Prompt Library
  --     --   https://codecompanion.olimorris.dev/configuration/prompt-library#assigning-prompts-to-a-keymap
  --     prompt_library = {
  --       ["TravelAgent"] = {
  --         strategy = "chat",
  --         description = "Build an holiday plan and itinerary for me",
  --         opts = {
  --           index = 11,
  --           is_slash_cmd = false,
  --           auto_submit = false,
  --           short_name = "travel",
  --         },
  --         context = {
  --           {
  --             type = "file",
  --             path = {
  --               "itinerary.md",
  --               "places.md",
  --               "**/*.md",
  --             },
  --           },
  --         },
  --         prompts = {
  --           {
  --             role = "user",
  --             content = [[I'm planing an vacation, help me rewrite an itinerary.
  --                         I'm sharing existing `itinerary.md` that you will update with itinerary of the trip. Day by day.
  --                         I'm sharing existing `places.md` where I ask you to record documentation of all places I shall visit, especially some basic description, and  links to google maps.
  --                         Follow the orders above in context of `info.md`. ]],
  --           },
  --         },
  --       },
  --       ["Docusaurus"] = {
  --         strategy = "chat",
  --         description = "Write documentation for me",
  --         opts = {
  --           index = 11,
  --           is_slash_cmd = false,
  --           auto_submit = false,
  --           short_name = "docs",
  --         },
  --         context = {
  --           {
  --             type = "file",
  --             path = {
  --               "**/*.md",
  --               "**/*.go",
  --               "**/*.lua",
  --             },
  --           },
  --         },
  --         prompts = {
  --           {
  --             role = "user",
  --             content = [[I'm rewriting the documentation, help me rewrite README.md?
  --                         I'm sharing all `*.md`, `*.lua`,  `*.go` files. ]],
  --           },
  --         },
  --       },
  --     },
  --
  --     -- FIXME, this is not working, overrides propts with empty table
  --     --   function()
  --     --   local function load_prompts_from_dir(dir)
  --     --     local t = {}
  --     --     dir = vim.fn.expand(dir)
  --     --     local files = vim.fn.globpath(dir, "*.lua", false, true)
  --     --     if not files then return t end
  --     --     for _, name in ipairs(files) do
  --     --       --if name:sub(-4) == ".lua" then -- since LuaJIT 5.2? goto continue end
  --     --       local path = dir .. "/" .. name
  --     --       if vim.fn.filereadable(path) == 1 then
  --     --         local ok, res = pcall(dofile, path)
  --     --         if ok and type(res) == "table" then t[name] = res end
  --     --       end
  --     --       --end
  --     --       --::continue::
  --     --     end
  --     --     return t
  --     --   end
  --     --   local prompts = load_prompts_from_dir "~/.config/ai-support/prompts"
  --     --   if vim.tbl_isempty(prompts) then
  --     --     return nil
  --     --   else
  --     --     return require("codecompanion.config").extend("prompt_library", prompts)
  --     --   end
  --     -- end,
  --   },
  -- },
  --
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
  --
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
  -- - blink-cmp for copilot - https://github.com/giuxtaposition/blink-cmp-copilot?tab=readme-ov-file#source-definition
  --

  -- CUSTOM KEY SHORTCUTS
  -- prompt switching (Avante)
  -- {
  --   vim.keymap.set("n", "<leader>Ap", function()
  --     local prompt = ""
  --     local prompt_dir = vim.fn.expand "~/.config/ai/prompts"
  --     local files = vim.fn.globpath(prompt_dir, "*", false, true)
  --     local filenames = vim.tbl_map(function(file) return vim.fn.fnamemodify(file, ":t") end, files)
  --     vim.ui.select(filenames, { prompt = "Select prompt file:" }, function(choice)
  --       if not choice then return end
  --       local path = prompt_dir .. "/" .. choice
  --       local lines = vim.fn.readfile(path)
  --       prompt = table.concat(lines, "\n")
  --     end)
  --     vim.api.nvim_exec_autocmds("User", { pattern = "myTogglePrompt", data = { prompt = prompt } })
  --   end, { desc = "avante: toggle my prompts" }),
  -- },
  -- model switching (CodeCompanion.feedkeys".run(1)
  -- q
}
