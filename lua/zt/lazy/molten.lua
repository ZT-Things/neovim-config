return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" }, -- for image/plot output
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
  },
  {
    "GCBallesteros/jupytext.nvim",
    config = true, -- sets up default configuration
  },
  {
    "3rd/image.nvim",
    opts = {},
  },
}
