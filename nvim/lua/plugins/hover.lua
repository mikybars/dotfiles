return {
  {
    "nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
    end,
  },
  {
    "lewis6991/hover.nvim",
    event = "VeryLazy",
    keys = {
      {
        "K",
        function()
          require("hover").hover()
        end,
        mode = { "n" },
        desc = "hover.nvim",
      },
      {
        "<C-p>",
        function()
          require("hover").hover_switch("prev")
        end,
        mode = { "n" },
        desc = "hover.nvim (next)",
      },
      {
        "<C-n>",
        function()
          require("hover").hover_switch("next")
        end,
        mode = { "n" },
        desc = "hover.nvim (next)",
      },
      {
        "<MouseMove>",
        function()
          require("hover").hover_mouse()
        end,
        mode = { "n" },
        desc = "hover.nvim (mouse)",
      },
    },
    config = function()
      require("hover").setup({
        init = function()
          require("hover.providers.lsp")
          require("hover.providers.diagnostic")
          require("hover.providers.fold_preview")
          require("hover.providers.man")
          require("hover.providers.gh")
          require("hover.providers.gh_user")
        end,
        preview_opts = {
          border = nil,
        },
        mouse_providers = {
          "diagnostic",
        },
      })
      vim.o.mousemoveevent = true
    end,
  },
}
