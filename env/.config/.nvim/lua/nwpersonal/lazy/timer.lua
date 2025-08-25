return {
    "linguini1/pulse.nvim",
    version = "*", -- Latest stable release
    config = function() 
        require("pulse").setup {
            level = vim.log.levels.INFO,
        }
     end 
}