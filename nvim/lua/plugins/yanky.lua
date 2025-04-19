return {
  "gbprod/yanky.nvim",
  opts = {
    textobj = {
      enabled = true,
    },
  },
  keys = {
    {
      "lp",
      "<cmd>lua require('yanky.textobj').last_put()<CR>",
      mode = { "o", "x" },
      desc = "Last put object",
    },
  },
}
