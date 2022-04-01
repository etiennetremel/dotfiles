require('telescope').setup {
  defaults = {
    layout_strategy = "bottom_pane",
    file_ignore_patterns = {
      "node_modules",
      "terraform.d",
      "__pycache__",
      ".git/.*"
    }
  }
}
