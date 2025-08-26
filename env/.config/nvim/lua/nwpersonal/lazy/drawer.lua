return {
    'mikew/nvim-drawer',
    opts = {},
    config = function(_, opts)
        local drawer = require('nvim-drawer')
        drawer.setup(opts)

        -- See usage and examples below.
        drawer.create_drawer({
            size = 15,
            position = 'below',

            -- Automatically claim any opened terminals.
            does_own_buffer = function(context)
                return context.bufname:match('notes://') ~= nil
            end,

            on_vim_enter = function(event)
                -- Open the drawer on startup.

                -- Example keymaps:
                -- C-`: focus the drawer.
                -- <leader>tn: open a new terminal.
                -- <leader>tt: go to the next terminal.
                -- <leader>tT: go to the previous terminal.
                -- <leader>tz: zoom the terminal.
                vim.keymap.set('n', '<leader>nn', function()
                    event.instance.focus_or_toggle()
                end)
                vim.keymap.set('t', '<leader>nn', function()
                    event.instance.focus_or_toggle()
                end)
                vim.keymap.set('n', '<leader>nc', function()
                    event.instance.open({
                        mode = 'new'
                    })
                end)
            end,

            -- When a new buffer is created, switch it to a terminal.
            on_did_create_buffer = function()
                --
            end,

            -- Remove some UI elements.
            on_did_open_buffer = function()
            end,

            -- Scroll to the end when changing tabs.
            on_did_open = function()
            end
        })
    end
}
