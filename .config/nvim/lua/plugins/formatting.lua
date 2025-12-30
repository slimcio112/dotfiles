return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {

        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            cpp = { "clang-format" },
            c = { "clang-format" },
        },

        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        },

        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
        },
    },
}
