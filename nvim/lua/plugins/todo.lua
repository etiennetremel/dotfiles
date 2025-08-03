return {
  {
    "bngarren/checkmate.nvim",
    ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
