return {
    "akinsho/toggleterm.nvim",
    version = "*",
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
        -- vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>")
        vim.keymap.set("n", "<C-t>", function()
            vim.cmd("ToggleTerm")
            vim.defer_fn(function()
                local mode = vim.api.nvim_get_mode().mode
                if mode ~= "i" and mode ~= "t" then
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("a", true, false, true), "n", false)
                end
            end, 20)
        end, { noremap = true,silent = true })
        vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>ToggleTerm<CR>", { noremap = true, silent = true })
        vim.keymap.set("t", "<A-c>", "<C-\\><C-N>")
        vim.keymap.set({"n", "v", "t"}, "<C-g>", [[<C-\><C-n>$Fll]], { noremap = true, silent = true })
        vim.keymap.set("n", "<C-g>", "<C-\\><C-n>$Fll")

        vim.keymap.set({"t"}, "<C-y>", 'mzg_v$Fll"+y`za', { noremap = true, silent = true }) -- greatest term keymap
        vim.keymap.set({"n", "v"}, "<C-y>", '<C-\\><C-n>mzg_v$Fll"+y`z', { noremap = true, silent = true }) -- greatest term keymap
    end
}

