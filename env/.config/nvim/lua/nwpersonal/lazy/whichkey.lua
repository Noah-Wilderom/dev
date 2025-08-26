return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 2000
    end,
    config = function()
        local wk = require("which-key")
        local icons = require("nwpersonal.helpers.icons")

        wk.setup({
            -- your configuration comes here
        })

        -- Register group names using new spec format
        wk.add({{
            "<leader>f",
            group = icons.Search .. " Find"
        }, {
            "<leader>g",
            group = icons.Git .. " Git"
        }, {
            "<leader>t",
            group = icons.Terminal .. " Terminal"
        }, {
            "<leader>l",
            group = icons.Format .. " Format"
        }, {
            "<leader>h",
            group = icons.Search .. " Harpoon"
        }, {
            "<leader>n",
            group = icons.DefaultFile .. " Notes"
        }})
    end
}
