-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- https://www.reddit.com/r/neovim/comments/142vcy4/how_does_one_delete_the_current_file_and_delete/
local function confirm_and_delete_buffer()
  local confirm = vim.fn.confirm("Delete buffer and file?", "&Yes\n&No", 2)

  if confirm == 1 then
    os.remove(vim.fn.expand("%"))
    vim.api.nvim_buf_delete(0, { force = true })
  end
end

map("n", "<leader>df", confirm_and_delete_buffer, { desc = "Delete current file" })
map("n", "<leader>y", '"+y', { desc = "Copy to the system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from the system clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste from the system clipboard" })
