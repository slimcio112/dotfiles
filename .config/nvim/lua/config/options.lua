vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true

vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})
