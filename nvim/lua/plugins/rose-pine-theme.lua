-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine")
    require("rose-pine").setup({
      dark_variant = "moon", -- main, moon, or dawn
    })
  end,
}
