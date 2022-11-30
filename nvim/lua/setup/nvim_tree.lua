local mode = require("consts").modes
local map = require("utils").map

require("nvim-tree").setup {
  auto_reload_on_write = true,
  sort_by = "name",
  filters = {
    dotfiles = true,
    custom = {
      "^\\.git",
      "node_modules"
    }
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  git = {
    ignore = false,
  },
  view = {
    side = "right",
    adaptive_size = true,
    centralize_selection = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "s",       action = "vsplit" },
        { key = "<CR>",    action = "edit_no_picker" },
        { key = "i",       action = "split" },
        { key = "x",       action = "close_node" },
        { key = "r",       action = "refresh" },
        { key = "a",       action = "create" },
        { key = "d",       action = "remove" },
        { key = "m",       action = "rename" },
        { key = "q",       action = "close" },
        { key = "W",       action = "collapse_all" },
        { key = "S",       action = "search_node" },
      },
    },
  }
}

map(mode.normal, "<leader>nn", ":NvimTreeToggle<CR>")
map(mode.normal, "<leader>nf", ":NvimTreeFindFileToggle<CR>")
