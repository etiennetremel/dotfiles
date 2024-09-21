require("telescope").setup {
  defaults = {
    layout_strategy = "bottom_pane",
    file_ignore_patterns = {
      ".embuild/.*",
      ".git/.*",
      "Cargo.lock",
      "__pycache__",
      "cargo.lock",
      "dist-types/.*",
      "dist/.*",
      "go.sum",
      "node_modules",
      "terraform.d",
      "yarn.lock",
    },
  },
}
