return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup {
            sort = {
                sorter = "case_sensitive"
            },
            view = {
                width = 30
            },
            filters = {
                dotfiles = true
            },
            renderer = {
                full_name = true,
                group_empty = true,
                special_files = {},
                symlink_destination = false,
                indent_markers = {
                    enable = true
                },
                icons = {
                    git_placement = "signcolumn",
                    show = {
                        file = true,
                        folder = false,
                        folder_arrow = false,
                        git = true
                    }
                }
            }
        }
    end
}
