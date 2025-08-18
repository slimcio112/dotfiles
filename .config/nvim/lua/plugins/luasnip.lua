return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        -- ✦ Snippety dla LaTeX ✦
        ls.add_snippets("tex", {
            -- figure (PDF-ready)
            s("fig", {
                t({ "\\begin{figure}[h!]", "    \\centering", "    \\includegraphics[width=0.6\\textwidth]{" }),
                i(1, "img/example.pdf"), -- domyślnie PDF
                t({ "}", "    \\caption{" }),
                i(2, "Opis obrazka"),
                t({ "}", "    \\label{fig:" }),
                i(3, "etykieta"),
                t({ "}", "\\end{figure}" }),
            }),

            -- ramki Catppuccin
            s("defi", { t({ "\\begin{Defi}", "" }), i(1, "Treść definicji"), t({ "", "\\end{Defi}" }) }),
            s("tw", { t({ "\\begin{Tw}", "" }), i(1, "Treść twierdzenia"), t({ "", "\\end{Tw}" }) }),
            s("prz", { t({ "\\begin{Prz}", "" }), i(1, "Treść przykładu"), t({ "", "\\end{Prz}" }) }),
            s("uw", { t({ "\\begin{Uw}", "" }), i(1, "Treść uwagi"), t({ "", "\\end{Uw}" }) }),
        })

        -- ✦ Keymap do odpalania Inkscape i automatycznej konwersji PDF ✦
        vim.keymap.set("n", "<leader>fi", function()
            local filename = vim.fn.input("Plik SVG (bez .svg): ", "img/diagram")
            if filename ~= "" then
                os.execute("mkdir -p img")
                local svg_path = filename .. ".svg"
                local pdf_path = filename .. ".pdf"

                -- jeśli plik SVG nie istnieje → stwórz minimalny
                if vim.fn.filereadable(svg_path) == 0 then
                    local f = io.open(svg_path, "w")
                    f:write([[
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
</svg>
                    ]])
                    f:close()
                end

                -- odpal Inkscape w tle i po zamknięciu konwertuj do PDF
                vim.fn.jobstart({
                    "sh",
                    "-c",
                    "inkscape '" .. svg_path .. "' && inkscape '" .. svg_path .. "' --export-type=pdf",
                }, { detach = true })

                print("Otwieram Inkscape i automatycznie wygeneruję PDF po zapisaniu.")
            end
        end, { desc = "Otwórz Inkscape i wygeneruj PDF" })
    end,
}
