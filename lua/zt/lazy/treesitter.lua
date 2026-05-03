return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",

  config = function()
    -- Install parsers (manual control)
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua",
        "vimdoc",
        "javascript",
        "typescript",
        "c",
        "rust",
        "python",
        "markdown",
        "markdown_inline",
        "bash",
        "hyprlang",
      },
      auto_install = false,
    })

    -- Start treesitter safely
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if args.match ~= "markdown" then
          pcall(vim.treesitter.start)
        end
      end,
    })

    -- Disable markdown TS (still buggy upstream)
    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = "markdown",
    --   callback = function()
    --     vim.treesitter.stop()
    --     vim.bo.syntax = "on"
    --   end,
    -- })
  end,
}
