-- Leader Key configuration
-- Must be set BEFORE loading lazy.nvim and plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Editor options
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true

-- Diagnostics configuration
vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})
