return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                php = { "pint" },
                vue = { "prettier" },
                rust = { "rustfmt" },
            },
            formatters = {
                pint = {
                    command = "pint",
                    args = function(self, ctx)
                        local config_file = vim.fn.expand("~/.config/pint.json")
                        if vim.fn.filereadable(config_file) == 1 then
                            return { "--config=" .. config_file, ctx.filename }
                        else
                            -- Fallback: look for pint.json in project root
                            local project_config = vim.fn.findfile("pint.json", ".;")
                            if project_config ~= "" then
                                return { "--config=" .. project_config, ctx.filename }
                            else
                                return { ctx.filename }
                            end
                        end
                    end,
                    stdin = false,
                }
            }
        })
    end
}
