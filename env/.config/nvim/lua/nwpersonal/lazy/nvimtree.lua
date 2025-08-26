local fullScreen = true

local function open_win_config_func()
    local scr_w = vim.opt.columns:get()
    local scr_h = vim.opt.lines:get()

    local tree_w = math.floor(scr_w)
    local tree_h = math.floor(scr_h)
    local border = "none"

    if not fullScreen then
        border = "double"
        tree_w = 80
        tree_h = math.floor(tree_w * scr_h / scr_w) * 2
    end

    return {
        border = border,
        relative = "editor",
        width = tree_w,
        height = tree_h,
        col = (scr_w - tree_w) / 2,
        row = (scr_h - tree_h) / 2
    }
end

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
                cursorline = false,
                float = {
                    enable = true,
                    open_win_config = open_win_config_func
                }
            },
            filters = {
                dotfiles = true
            },
            renderer = {
                indent_width = 3,
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
