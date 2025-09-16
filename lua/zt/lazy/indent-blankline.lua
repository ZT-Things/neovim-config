-- lua/plugins/indent-blankline.lua
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "│",
            highlight = { "IblIndent" },
        },
        scope = { enabled = false },
    },
    -- inside your indent-blankline.lua config
    config = function(_, opts)
        require("ibl").setup(opts)

        local function set_indent_color()
            vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b3b3b", nocombine = true })
        end

        -- Apply immediately
        set_indent_color()

        -- Apply after colorscheme
        vim.api.nvim_create_autocmd("ColorScheme", { callback = set_indent_color })

        -- Apply every time a buffer is entered (forces the plugin to redraw with correct color)
        vim.api.nvim_create_autocmd("BufEnter", { callback = set_indent_color })
    end
}
