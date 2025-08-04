local M = {}

function M.setup()
    local map = vim.keymap.set

    -- Lepsze poruszanie się w zawiniętych liniach
    map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
    map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
    map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
    map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

    -- Przechodzenie między oknami (windows)
    map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
    map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
    map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
    map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

    -- Zmiana rozmiaru okien
    map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
    map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
    map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
    map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

    -- Przenoszenie linii
    map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
    map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
    map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
    map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
    map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
    map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

    -- Bufory
    map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
    map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
    map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
    map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
    map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
    map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
    map("n", "<leader>bd", function()
        Snacks.bufdelete()
    end, { desc = "Delete Buffer" })
    map("n", "<leader>bo", function()
        Snacks.bufdelete.other()
    end, { desc = "Delete Other Buffers" })
    map("n", "<leader>bD", "<cmd>bd<cr>", { desc = "Delete Buffer and Window" })

    -- Czyszczenie podświetlenia wyszukiwania przy ESC
    map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch", silent = true })

    -- Odświeżenie ekranu
    map(
        "n",
        "<leader>ur",
        "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
        { desc = "Redraw / Clear hlsearch / Diff Update" }
    )

    -- Lepsze działanie n i N
    map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
    map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
    map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
    map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
    map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
    map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

    -- Punkty cofania (undo breakpoints)
    map("i", ",", ",<c-g>u")
    map("i", ".", ".<c-g>u")
    map("i", ";", ";<c-g>u")

    -- Zapis pliku
    map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

    -- Lepsze wcięcia
    map("v", "<", "<gv")
    map("v", ">", ">gv")

    -- Komentowanie
    map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
    map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

    -- Dostęp do lazy.nvim
    map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

    -- Nowy plik
    map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

    -- Listy location/quickfix
    map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
    map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
    map("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous Quickfix" })
    map("n", "]q", "<cmd>cnext<cr>", { desc = "Next Quickfix" })

    -- Formatowanie
    -- Zastąpiono LazyVim.format() standardową, wbudowaną funkcją formatowania LSP
    map({ "n", "v" }, "<leader>cf", function()
        vim.lsp.buf.format({ async = true })
    end, { desc = "Format" })

    -- Diagnostyka
    local diagnostic_goto = function(next, severity)
        local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
        severity = severity and vim.diagnostic.severity[severity] or nil
        return function()
            go({ severity = severity })
        end
    end
    map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
    map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
    map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
    map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
    map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
    map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
    map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

    -- Przełączniki (toggles) - z biblioteki Snacks
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle.option("conceallevel", { off = 0, on = 2, name = "Conceal Level" }):map("<leader>uc")
    Snacks.toggle.option("showtabline", { off = 0, on = 2, name = "Tabline" }):map("<leader>uA")
    Snacks.toggle.treesitter():map("<leader>uT")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")

    if vim.lsp.inlay_hint then
        Snacks.toggle.inlay_hints():map("<leader>uh")
    end

    -- Lazygit
    if vim.fn.executable("lazygit") == 1 then
        map("n", "<leader>gg", function()
            Snacks.lazygit()
        end, { desc = "Lazygit (cwd)" })
    end

    -- Wyjście
    map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

    -- Inspekcja pod kursorem
    map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

    -- Pływający terminal
    map("n", "<leader>ft", function()
        Snacks.terminal()
    end, { desc = "Terminal (cwd)" })
    map("n", "<c-/>", function()
        Snacks.terminal()
    end, { desc = "Terminal (cwd)" })
    map("n", "<c-_>", function()
        Snacks.terminal()
    end, { desc = "which_key_ignore" })

    -- Mapowania w terminalu
    map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
    map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

    -- Okna
    map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
    map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
    map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
    Snacks.toggle.zoom():map("<leader>wm")
    Snacks.toggle.zen():map("<leader>uz")

    -- Taby
    map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
    map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
    map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
    map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
    map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
    map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
    map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
end

return M
