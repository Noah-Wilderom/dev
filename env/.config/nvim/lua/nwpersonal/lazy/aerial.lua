return {
    {
        "stevearc/aerial.nvim",
        opts = {
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
            layout = {
                -- These control the width of the aerial window.
                -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- min_width and max_width can be a list of mixed types.
                max_width = { 40, 0.2 },
                width = nil,
                min_width = 10,
                
                -- key-value pairs of window-local options for aerial window (e.g. winhl)
                win_opts = {},
                
                -- Determines the default direction to open the aerial window. The 'prefer'
                -- options will open the window in the other direction *if* there is a
                -- different buffer in the way of the preferred direction
                default_direction = "prefer_right",
                
                -- Determines where the aerial window will be opened
                --   edge   - open aerial at the far right/left of the editor
                --   window - open aerial to the right/left of the current window
                placement = "window",
                
                -- When the symbols change, resize the aerial window (within min/max constraints) to fit
                resize_to_content = true,
                
                -- Preserve window size equality with (:help CTRL-W_=)
                preserve_equality = false,
            },
            -- Determines how the aerial window decides which buffer to display symbols for
            --   window - aerial window will display symbols for the buffer in the window from which it was opened
            --   global - aerial window will display symbols for the current window
            attach_mode = "window",
            
            -- List of enum values that configure when to auto-close the aerial window
            --   unfocus       - close aerial when you leave the original source window
            --   switch_buffer - close aerial when you change buffers in the source window
            --   unsupported   - close aerial when attaching to a buffer that has no symbol source
            close_automatic_events = {},
            
            -- Keymaps in aerial window. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("aerial.actions").<name>
            -- Set to `false` to remove a keymap
            keymaps = {
                ["?"] = "actions.show_help",
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.jump",
                ["<2-LeftMouse>"] = "actions.jump",
                ["<C-v>"] = "actions.jump_vsplit",
                ["<C-s>"] = "actions.jump_split",
                ["p"] = "actions.scroll",
                ["<C-j>"] = "actions.down_and_scroll",
                ["<C-k>"] = "actions.up_and_scroll",
                ["{"] = "actions.prev",
                ["}"] = "actions.next",
                ["[["] = "actions.prev_up",
                ["]]"] = "actions.next_up",
                ["q"] = "actions.close",
                ["o"] = "actions.tree_toggle",
                ["za"] = "actions.tree_toggle",
                ["O"] = "actions.tree_toggle_recursive",
                ["zA"] = "actions.tree_toggle_recursive",
                ["l"] = "actions.tree_open",
                ["zo"] = "actions.tree_open",
                ["L"] = "actions.tree_open_recursive",
                ["zO"] = "actions.tree_open_recursive",
                ["h"] = "actions.tree_close",
                ["zc"] = "actions.tree_close",
                ["H"] = "actions.tree_close_recursive",
                ["zC"] = "actions.tree_close_recursive",
                ["zr"] = "actions.tree_increase_fold_level",
                ["zR"] = "actions.tree_open_all",
                ["zm"] = "actions.tree_decrease_fold_level",
                ["zM"] = "actions.tree_close_all",
                ["zx"] = "actions.tree_sync_folds",
                ["zX"] = "actions.tree_sync_folds",
            },
            
            -- When you fold code with za, zo, etc., update the aerial tree as well.
            -- Only works when manage_folds = true
            link_folds_to_tree = false,
            
            -- Fold code when you open/collapse symbols in the tree.
            -- Only works when manage_folds = true
            link_tree_to_folds = true,
            
            -- Use symbol tree for folding. Set to true or false to enable/disable
            -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
            -- This can be a filetype map (see :help aerial-filetype-map)
            manage_folds = false,
            
            -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
            -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
            nerd_font = "auto",
            
            -- Call this function when aerial attaches to a buffer.
            on_attach = function(bufnr) end,
            
            -- Call this function when aerial first sets symbols on a buffer.
            on_first_symbols = function(bufnr) end,
            
            -- Automatically open aerial when entering supported buffers.
            -- This can be a function (see :help aerial-open-automatic)
            open_automatic = false,
            
            -- Run this command after jumping to a symbol (false will disable)
            post_jump_cmd = "normal! zz",
            
            -- Invoked after each symbol is parsed, can be used to modify the parsed item,
            -- or to filter it by returning false.
            --
            -- bufnr: a vim buffer number
            -- item: of type aerial.Symbol
            -- ctx: a record containing the following fields:
            --   * backend_name: name of the backend
            --   * lang: language server name
            --   * symbols: a list of aerial.Symbol items, not necessarily the same as the one being iterated on
            post_parse_symbol = function(bufnr, item, ctx)
                return true
            end,
            
            -- Invoked after all symbols have been parsed and post-processed,
            -- allows to modify the symbol structure before final display
            --
            -- bufnr: a vim buffer number
            -- items: a list of aerial.Symbol items
            -- ctx: a record containing the following fields:
            --   * backend_name: name of the backend
            --   * lang: language server name
            --   * symbols: a copy of the original symbols list
            post_add_all_symbols = function(bufnr, items, ctx)
                return items
            end,
            
            -- When true, aerial will automatically close after jumping to a symbol
            close_on_select = false,
            
            -- The autocmds that trigger symbols update (not used for LSP backend)
            update_events = "TextChanged,InsertLeave",
            
            -- Show box drawing characters for the tree hierarchy
            show_guides = false,
            
            -- Customize the characters used when show_guides = true
            guides = {
                -- When the child item has a sibling below it
                mid_item = "├─",
                -- When the child item is the last in the list
                last_item = "└─",
                -- When there are nested child guides to the right
                nested_top = "│ ",
                -- Raw indentation
                whitespace = "  ",
            },
            
            -- Options for opening aerial in a floating win
            float = {
                -- Controls border appearance. Passed to nvim_open_win
                border = "rounded",
                
                -- Determines location of floating window
                --   cursor - Opens float on top of the cursor
                --   editor - Opens float centered in the editor
                --   win    - Opens float centered in the window
                relative = "cursor",
                
                -- These control the height of the floating window.
                -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- min_height and max_height can be a list of mixed types.
                max_height = 0.9,
                height = nil,
                min_height = { 8, 0.1 },
                
                override = function(conf, source_winid)
                    -- This is the config that will be passed to nvim_open_win.
                    -- Change values here to customize the layout
                    return conf
                end,
            },
        },
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons" -- optional for icon support
        },
        keys = {
            { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Aerial Toggle" },
            { "<leader>ao", "<cmd>AerialOpen<CR>", desc = "Aerial Open" },
            { "<leader>ac", "<cmd>AerialClose<CR>", desc = "Aerial Close" },
            { "<leader>an", "<cmd>AerialNext<CR>", desc = "Aerial Next" },
            { "<leader>ap", "<cmd>AerialPrev<CR>", desc = "Aerial Prev" },
        },
    }
}
