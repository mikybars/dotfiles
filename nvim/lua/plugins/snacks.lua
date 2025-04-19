return {
  "folke/snacks.nvim",
  opts = {
    -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
    picker = {
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["J"] = { "preview_scroll_down", mode = { "n", "i" } },
            ["K"] = { "preview_scroll_up", mode = { "n", "i" } },
            ["H"] = { "preview_scroll_left", mode = { "n", "i" } },
            ["L"] = { "preview_scroll_right", mode = { "n", "i" } },
          },
        },
      },
      matcher = {
        frecency = true,
      },
      -- layout = {
      --   preset = "vertical",
      -- },
      layouts = {
        vertical = {
          layout = {
            width = 0.8,
            min_width = 80,
          },
        },
      },
      formatters = {
        file = {
          filename_first = true,
          truncate = 80,
        },
      },
    },
  },
  keys = {
    {
      "<leader>n",
      function()
        Snacks.picker.notifications({
          layout = "vertical",
        })
      end,
      desc = "Notification History",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps({
          layout = "vertical",
        })
      end,
      desc = "Keymaps",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols({
          layout = "select",
        })
      end,
      desc = "LSP Symbolssss",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers({
          on_show = function()
            vim.cmd.stopinsert()
          end,
          win = {
            input = {
              keys = {
                ["d"] = "bufdelete",
              },
            },
            list = { keys = { ["d"] = "bufdelete" } },
          },
        })
      end,
      desc = "Buffers",
    },
  },
}
