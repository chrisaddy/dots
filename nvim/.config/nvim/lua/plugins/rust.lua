return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "simrat39/rust-tools.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local rust_tools = require("rust-tools")

      rust_tools.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

            -- Mappings.
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            -- Add more keybindings as needed
          end,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                -- If you want to specify features, use this instead:
                -- features = {"your_feature_1", "your_feature_2"},
              },
              -- Add other rust-analyzer settings here
            },
          },
        },
      })
    end,
  },
}
