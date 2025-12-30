return {
    {
        "saghen/blink.cmp",
        version = "*",
        dependencies = {
            "rafamadriz/friendly-snippets",
            { "L3MON4D3/LuaSnip", version = "v2.*" },
        },
        opts = {

            snippets = { preset = "luasnip" },

            keymap = { preset = "super-tab" },
            appearance = { nerd_font_variant = "mono" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
    },
}
