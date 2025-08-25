require("nwpersonal.helpers.keyboard")

local icons = require("nwpersonal.helpers.icons")

vim.g.mapleader = " "

local sections = {
    f = icons.Search .. " Find",
    t = icons.Terminal .. " Terminal",
    g = icons.Git .. " Git"
}
