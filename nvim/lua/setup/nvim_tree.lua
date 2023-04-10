require("nvim-tree").setup {
  auto_reload_on_write = true,
  sort_by = "name",
  filters = {
    dotfiles = false,
    custom = {
      "^\\.git$",
      "^\\.yarn$",
      "node_modules",
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    icons = {
      show = {
        file = false,
      },
    },
  },
  view = {
    side = "right",
    adaptive_size = true,
    centralize_selection = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "<CR>", action = "edit_no_picker" },
      },
    },
  },
}
