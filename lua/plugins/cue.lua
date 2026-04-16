-- CUE language support (Neovim 0.12+)
-- Binary installation handled by mason-tool-installer in plugins/mason.lua.

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      -- Register .cue filetype
      vim.filetype.add({ extension = { cue = "cue" } })

      -- Only log genuine warnings/errors; "trace" causes
      -- CUE server stderr debug output to appear as ERROR in lsp.log.
      vim.lsp.log.set_level("warn")

      -- Configure and enable CUE language server (Neovim 0.12 native API)
      vim.lsp.config("cue", {
        cmd = { "cuelsp" },
        filetypes = { "cue" },
        root_markers = { "cue.mod", ".git" },
      })
      vim.lsp.enable("cue")

      -- Format on save for CUE files
      opts.autocmds = opts.autocmds or {}
      opts.autocmds.cue_format_on_save = {
        {
          event = "BufWritePre",
          pattern = "*.cue",
          desc = "Format CUE files before saving",
          callback = function(args)
            vim.lsp.buf.format({ bufnr = args.buf, async = false })
          end,
        },
      }
    end,
  },

  -- Treesitter parser for CUE syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "cue" })
    end,
  },
}
