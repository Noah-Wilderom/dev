return {
    "tjdevries/php.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("nwpersonal.helpers.keyboard")
        require("php").setup({})
        nm("<leader>pa", function()
            R "php"
            require("php.artisan").telescope_select_artisan()
        end, "Laravel Artisan")
    end
}
