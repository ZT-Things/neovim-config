return {
    "akinsho/toggleterm.nvim",
    version = "*", -- or use a specific tag like "v2.*"
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = nil,
            direction = "float", -- "horizontal", "vertical", "tab", or "float"
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            close_on_exit = true,
            shell = vim.o.shell,
        })

        -- Example: custom terminal for lazygit
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
        })

        local function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.keymap.set("n", "<leader>gg", _lazygit_toggle, { noremap = true, silent = true })
        vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
        vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>ToggleTerm<CR>", { noremap = true, silent = true })
        vim.cmd [[
          autocmd TermOpen * startinsert
        ]]
    end
}

