vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<A-h>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<A-l>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<A-j>", ":resize +2<CR>")
vim.keymap.set("n", "<A-k>", ":resize -2<CR>")

vim.keymap.set("n", "<A-Left>",  ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })
vim.keymap.set("n", "<A-Up>",    ":resize -2<CR>",           { desc = "Decrease height" })
vim.keymap.set("n", "<A-Down>",  ":resize +2<CR>",           { desc = "Increase height" })

vim.keymap.set("n", "<leader>l", ":set list!<CR>", {noremap = true, silent=true})

vim.keymap.set("n", "<leader>rp", function()
    local file = vim.fn.expand("%")
    local cmd = "python3 " .. file
    require("toggleterm").exec(cmd, 1)  -- Sends to terminal 1
end, { noremap = true, silent = true })
vim.remap.set("n", "<leader> rc", function()
    require("toggleterm").exec("cargo run")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>re", ":e %<CR>", { noremap = true, silent=true })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("i", "<C-v>", '<C-r>+', { noremap = true, silent = true })
