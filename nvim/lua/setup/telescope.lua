require("telescope").setup {
  defaults = {
    layout_strategy = "bottom_pane",
    file_ignore_patterns = {
      ".embuild/.*",
      ".git/.*",
      "__pycache__",
      "node_modules",
      "terraform.d",
    },
  },
}
