return {
    "neovim/nvim-lspconfig",
    dependencies = {

        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        "saghen/blink.cmp",
    },
    config = function()
        require("mason").setup()

        local servers = {
            "lua_ls",
            "ts_ls",
            "html",
            "cssls",
            "pyright",
            "clangd",
            "texlab",
        }

        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_installation = true,
        })

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        for _, server in ipairs(servers) do
            local config = {
                capabilities = capabilities,
            }

            if server == "lua_ls" then
                config.settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                }
            end

            local current_config = vim.lsp.config[server] or {}
            vim.lsp.config[server] = vim.tbl_deep_extend("force", current_config, config)

            vim.lsp.enable(server)
        end
    end,
}
