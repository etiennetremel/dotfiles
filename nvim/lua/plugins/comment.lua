return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup {
      mappings = {
        basic = false,
        extra = false,
      },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }

    require("Comment.ft").set("terraform", "#%s")
  end,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}
