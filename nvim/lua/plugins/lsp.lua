return {
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          source = "always",
          prefix = "■",
          -- Only show virtual text matching the given severity
          severity = {
            -- Specify a range of severities
            min = vim.diagnostic.severity.ERROR,
          },
        },
      },
    },
  },
}
