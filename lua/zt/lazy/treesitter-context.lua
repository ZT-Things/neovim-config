return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  config = function()
    require("treesitter-context").setup({
      enable = false,         -- Enable this plugin
      max_lines = 1,         -- How many lines the context window can span
      trim_scope = "outer",  -- Which context lines to discard if max_lines is exceeded
      mode = "cursor",       -- Line to show context from ('cursor' or 'topline')
    })
  end,
}

