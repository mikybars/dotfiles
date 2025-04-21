return {
  "folke/snacks.nvim",
  opts = {
    -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          hidden = true,
          layout = {
            preset = "default",
            preview = false,
          },
          win = {
            list = {
              keys = {
                ["y"] = "copy_file_path",
              },
            },
          },
          actions = {
            copy_file_path = {
              action = function(_, item)
                if not item then
                  return
                end

                local vals = {
                  ["BASENAME"] = vim.fn.fnamemodify(item.file, ":t:r"),
                  ["EXTENSION"] = vim.fn.fnamemodify(item.file, ":t:e"),
                  ["FILENAME"] = vim.fn.fnamemodify(item.file, ":t"),
                  ["PATH"] = item.file,
                  ["PATH (CWD)"] = vim.fn.fnamemodify(item.file, ":."),
                  ["PATH (HOME)"] = vim.fn.fnamemodify(item.file, ":~"),
                  ["URI"] = vim.uri_from_fname(item.file),
                }

                local options = vim.tbl_filter(function(val)
                  return vals[val] ~= ""
                end, vim.tbl_keys(vals))
                if vim.tbl_isempty(options) then
                  vim.notify("No values to copy", vim.log.levels.WARN)
                  return
                end
                table.sort(options)
                vim.ui.select(options, {
                  prompt = "Choose to copy to clipboard:",
                  format_item = function(list_item)
                    return ("%s: %s"):format(list_item, vals[list_item])
                  end,
                }, function(choice)
                  local result = vals[choice]
                  if result then
                    vim.fn.setreg("+", result)
                    Snacks.notify.info("Yanked `" .. result .. "`")
                  end
                end)
              end,
            },
          },
        },
      },
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
