-- Mason tool declarations
-- Community plugin imported in community.lua; this file configures it.

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "cuelsp",
        -- add more tools here as needed
      },
    },
  },
}
