if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  -- "you-n-g/jinja-engine.nvim",
  -- dependencies = {},
  --
  "HiPhish/jinja.vim",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
    },
  },
}
