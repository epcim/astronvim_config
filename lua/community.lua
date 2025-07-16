--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.chezmoi" },
  { import = "astrocommunity.git.blame-nvim" },
  --{ import = "astrocommunity.utility.noice-nvim" },

  -- COMPLETITION
  -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/completion
  --{ import = "astrocommunity.completion.copilot-lua-cmp" },
  --
  -- FIXME, this disabled few other.. why?
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.completion.blink-cmp-tmux" },

  -- COLORS
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- EVALUATING
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  --{ import = "astrocommunity.completion.avante-nvim" },
  --{ import = "astrocommunity.editing-support.mcphub-nvim" },
  --{ import = "astrocommunity.editing-support.codecompanion-nvim" },
  { import = "astrocommunity.editing-support.codecompanion-nvim" },
}
