return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { "node_modules", "vendor", ".git", ".idea", "target", ".DS_Store", "composer.lock", ".vscode", "storage/debugbar", "storage/framework"},
                mappings = {
                    n = {
                        ["q"] = require("telescope.actions").close
                    }
                }
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*" },
                }
            }
        })
    end
}