-- Modern keybinding setter using vim.keymap.set (supports both strings and functions)

-- Normal mode keybinding setter
function nm(key, command, desc)
    vim.keymap.set('n', key, command, {
        noremap = true,
        desc = desc
    })
end

-- Input mode keybinding setter
function im(key, command, desc)
    vim.keymap.set('i', key, command, {
        noremap = true,
        desc = desc
    })
end

-- Visual mode keybinding setter
function vm(key, command, desc)
    vim.keymap.set('v', key, command, {
        noremap = true,
        desc = desc
    })
end

-- Terminal mode keybinding setter
function tm(key, command, desc)
    vim.keymap.set('t', key, command, {
        noremap = true,
        desc = desc
    })
end