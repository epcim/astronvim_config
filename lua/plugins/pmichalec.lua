local u = "p.michalec"
local me = string.match(u, "epcim") or string.match(u, "michalec")
--if not me then return {} end -- WARN: only execute on the expected user

return {

  -- Set colorscheme to use
  -- colorscheme = "tokyonight",
  --
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  -- diagnostics = {
  --   virtual_text = true,
  --   underline = true,
  -- },

  -- Prefered plugins
  { "will133/vim-dirdiff", cmd = "DirDiff" },
  {
    "alker0/chezmoi.vim",
    lazy = false,
    init = function()
      -- This option is required.
      vim.g["chezmoi#use_tmp_buffer"] = true
    end,
  },

  --polish = function()
  -- vimrc
  --load vimrc config in init.lua from ~/.config/nvim/lua/user/vimrc.vim
  -- vim.cmd.source(vim.fn.stdpath "config" .. "/" .. "lua/vimrc.vim"),
  --end,
}
