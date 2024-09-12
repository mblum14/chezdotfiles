return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        helm_ls = {},
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true, -- using ruff
            },
          },
        },
      },
    },
  },
}
