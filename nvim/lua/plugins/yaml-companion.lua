return {
  {
    "someone-stole-my-name/yaml-companion.nvim",

    ft = { "yaml" },

    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },

    config = function(_, opts)
      local cfg = require("yaml-companion").setup(opts)
      require("lspconfig")["yamlls"].setup(cfg)
      require("telescope").load_extension("yaml_schema")
    end,

    opts = {
      lspconfig = {
        settings = {
          yaml = {
            validate = true,
            format = {
              enable = true,
              singleQuote = true,
            },
            customTags = {
              -- CloudFormation functions
              "!And scalar",
              "!And mapping",
              "!And sequence",
              "!If scalar",
              "!If mapping",
              "!If sequence",
              "!Not scalar",
              "!Not mapping",
              "!Not sequence",
              "!Equals scalar",
              "!Equals mapping",
              "!Equals sequence",
              "!Or scalar",
              "!Or mapping",
              "!Or sequence",
              "!FindInMap scalar",
              "!FindInMap mapping",
              "!FindInMap sequence",
              "!Base64 scalar",
              "!Base64 mapping",
              "!Base64 sequence",
              "!Cidr scalar",
              "!Cidr mapping",
              "!Cidr sequence",
              "!Ref scalar",
              "!Ref mapping",
              "!Ref sequence",
              "!Sub scalar",
              "!Sub mapping",
              "!Sub sequence",
              "!GetAtt scalar",
              "!GetAtt mapping",
              "!GetAtt sequence",
              "!GetAZs scalar",
              "!GetAZs mapping",
              "!GetAZs sequence",
              "!ImportValue scalar",
              "!ImportValue mapping",
              "!ImportValue sequence",
              "!Select scalar",
              "!Select mapping",
              "!Select sequence",
              "!Split scalar",
              "!Split mapping",
              "!Split sequence",
              "!Join scalar",
              "!Join mapping",
              "!Join sequence",
            },
          },
        },
      },
    },
  },
}
