return {
    "vyfor/cord.nvim",
    config = function()
        require("cord").setup({
            main_image = "neovim",
            file_image = nil,
            display = {
                swap_icons = true,
                theme = "default",
                flavor = "dark",
                swap_fields = false,
            },
            idle = {
                enabled = false,
            },
        })
    end,
}

