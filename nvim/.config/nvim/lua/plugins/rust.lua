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
          on_attach = function(client, bufnr)
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

            -- Set up formatting on save
            if client.server_capabilities.documentFormattingProvider then
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("Format", { clear = true }),
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format()
                end,
              })
            end
          end,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                -- If you want to specify features, use this instead:
                -- features = {"your_feature_1", "your_feature_2"},
              },
              checkOnSave = {
                command = "clippy",
              },
              -- Add other rust-analyzer settings here
            },
          },
        },
        tools = {
          inlay_hints = {
            auto = true,
          },
        },
      })
    end,
  },
}
