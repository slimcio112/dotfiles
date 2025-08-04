-- Twój plik lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path ="${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- === Dodaj tę sekcję ===
      vim.diagnostic.config({
        -- Wyświetlaj komunikat błędu obok linii kodu
        virtual_text = {
          source = "always",
          prefix = "●",
        },
        -- Pokazuj ikony błędów w signcolumn
        signs = true,
        -- Podkreślaj błędy w kodzie
        underline = true,
        -- Nie aktualizuj w trybie wprowadzania
        update_in_insert = false,
      })

    --local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "pyright",
	  "texlab",
        },
      })
    end,
  },
}

