--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "antonk52/markdowny.nvim",
    ft = { "markdown", "mdx" }, -- optional: only load for these filetypes
    config = function()
      require("markdowny").setup {
        filetypes = { "markdown", "mdx" },
      }
    end,
  },
  {
    -- Add this for Mermaid support in iTerm2
    "selimacerbas/mermaid-playground.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>mp", "<cmd>MermaidPlaygroundToggle<cr>", desc = "Toggle Mermaid Preview" },
    },
  },
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1001, -- Ensures it loads before image.nvim
  --   opts = {
  --     rocks = { "magick" },
  --   },
  -- },
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- Ghostty uses the kitty protocol
      integrations = {
        markdown = {
          enabled = true,
          filetypes = { "markdown", "mdx" },
        },
      },
      max_width = 100,
      max_height = 20,
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "saghen/blink.cmp",
    },
    opts = {
      preview = {
        -- Tell markview to attach to mdx files
        filetypes = { "markdown", "quarto", "rmd", "typst", "mdx" },
      },
    },
    config = function(_, opts)
      -- 1. Register .mdx extension as the 'mdx' filetype
      vim.filetype.add {
        extension = {
          mdx = "mdx",
        },
      }

      -- 2. Tell Treesitter to use the markdown parser for 'mdx' files
      vim.treesitter.language.register("markdown", "mdx")

      -- 3. Run the standard setup
      require("markview").setup(opts)
    end,
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      { "3rd/image.nvim", opts = {} }, -- you'd probably want to configure image.nvim manually instead of doing this
    },
    keys = {
      { "<leader>mv", "<cmd>lua require('diagram').show_diagram_hover()<cr>", desc = "View Mermaid Diagram" },
    },
    opts = { -- you can just pass {}, defaults below
      events = {
        render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
        clear_buffer = { "BufLeave" },
      },
      renderer_options = {
        mermaid = {
          --command = "$HOME/homebrew/bin/mmdc",
          background = nil, -- nil | "transparent" | "white" | "#hex"
          theme = "dark", -- nil | "default" | "dark" | "forest" | "neutral"
          scale = 2, -- nil | 1 (default) | 2  | 3 | ...
          width = nil, -- nil | 800 | 400 | ...
          height = nil, -- nil | 600 | 300 | ...
          cli_args = nil, -- nil | { "--no-sandbox" } | { "-p", "/path/to/puppeteer" } | ...
        },
        plantuml = {
          charset = nil,
          cli_args = nil, -- nil | { "-Djava.awt.headless=true" } | ...
        },
        d2 = {
          theme_id = nil,
          dark_theme_id = nil,
          scale = nil,
          layout = nil,
          sketch = nil,
          cli_args = nil, -- nil | { "--pad", "0" } | ...
        },
        gnuplot = {
          size = nil, -- nil | "800,600" | ...
          font = nil, -- nil | "Arial,12" | ...
          theme = nil, -- nil | "light" | "dark" | custom theme string
          cli_args = nil, -- nil | { "-p" } | { "-c", "config.plt" } | ...
        },
      },
    },
  },
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   opts = {
  --     file_types = { "markdown", "mdx", "codecompanion", "Avante", "copilot-chat", "opencode-output" },
  --     heading = { border = true, render_modes = true },
  --     whitespace = "false",
  --   },
  -- },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  --   -- Add "mdx" to the ft list and keys ft list so the plugin loads for these files
  --   keys = { { "<leader>mp", ft = { "markdown", "mdx" }, "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
  --   ft = { "markdown", "mdx" },
  --   config = function()
  --     -- Optional: general configurations
  --     vim.g.mkdp_auto_start = 0 -- set to 1 to auto-open preview on markdown files
  --     vim.g.mkdp_auto_close = 1 -- set to 1 to auto-close preview when switching buffers
  --
  --     -- Step 1: Configure Neovim to recognize .mdx files as markdown
  --     -- Placing this inside the config function ensures it runs when the plugin loads
  --     vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  --       pattern = "*.mdx",
  --       callback = function() vim.bo.filetype = "markdown" end,
  --     })
  --   end,
  -- },
}
