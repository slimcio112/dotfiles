return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        ls.add_snippets("tex", {
            -- figure environment
            s("fig", {
                t({ "\\begin{figure}[h!]", "    \\centering", "    \\includegraphics[width=0.6\\textwidth]{" }),
                i(1, "img/example.pdf"),
                t({ "}", "    \\caption{" }),
                i(2, "Opis obrazka"),
                t({ "}", "    \\label{fig:" }),
                i(3, "etykieta"),
                t({ "}", "\\end{figure}" }),
            }),

            -- tcolorbox
            s("defi", { t({ "\\begin{Defi}", "" }), i(1, "Treść definicji"), t({ "", "\\end{Defi}" }) }),
            s("tw", { t({ "\\begin{Tw}", "" }), i(1, "Treść twierdzenia"), t({ "", "\\end{Tw}" }) }),
            s("prz", { t({ "\\begin{Prz}", "" }), i(1, "Treść przykładu"), t({ "", "\\end{Prz}" }) }),
            s("uw", { t({ "\\begin{Uw}", "" }), i(1, "Treść uwagi"), t({ "", "\\end{Uw}" }) }),
        })

        -- Inkscape snippet
        vim.keymap.set("n", "<leader>fi", function()
            local filename = vim.fn.input("SVG file (without .svg): ", "img/diagram")
            if filename ~= "" then
                os.execute("mkdir -p img")
                local svg_path = filename .. ".svg"
                local pdf_path = filename .. ".pdf"

                -- create inkscape file
                if vim.fn.filereadable(svg_path) == 0 then
                    local f = io.open(svg_path, "w")
                    f:write([[
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
</svg>
                    ]])
                    f:close()
                end

                -- run inkscape
                vim.fn.jobstart({
                    "sh",
                    "-c",
                    "inkscape '" .. svg_path .. "' && inkscape '" .. svg_path .. "' --export-type=pdf",
                }, { detach = true })

                print("Inkscape file editing.")
            end
        end, { desc = "Run inkscape and export as PDF." })
    end,
}
