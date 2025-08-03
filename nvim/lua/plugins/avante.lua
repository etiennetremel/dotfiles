local opts = {
  -- add any opts here
  -- for example
  provider = "gemini_flash",
  providers = {
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      extra_request_body = {
        timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        temperature = 0,
        max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      },
    },
    gemini_pro = {
      __inherited_from = "gemini",
      -- __inherited_from = "openai",
      -- endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "GEMINI_API_KEY",
      model = "gemini-2.5-pro",
    },
    gemini_flash = {
      __inherited_from = "gemini",
      -- __inherited_from = "openai",
      -- endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "GEMINI_API_KEY",
      model = "gemini-2.5-flash",
    },
    openrouter_qwen3_235b_a22b = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "qwen/qwen3-235b-a22b",
    },
    openrouter_claude_opus_4 = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "anthropic/claude-opus-4",
    },
    openrouter_claude_3_7_sonnet = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "anthropic/claude-3.7-sonnet",
    },
    openrouter_chatgpt_4_1 = {
      __inherited_from = "openai",
      -- endpoint = "https://openrouter.ai/api/v1",
      -- api_key_name = "OPENROUTER_API_KEY",
      model = "openai/gpt-4.1",
    },
  },
  auto_suggestions_provider = "gemini_flash",
}

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  build = "make",
  config = function()
    require("avante").setup(opts)
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    -- {
    --   -- support for image pasting
    --   "HakonHarnes/img-clip.nvim",
    --   event = "VeryLazy",
    --   opts = {
    --     -- recommended settings
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       -- required for Windows users
    --       use_absolute_path = true,
    --     },
    --   },
    -- },
    -- {
    --   -- Make sure to set this up properly if you have lazy=true
    --   "MeanderingProgrammer/render-markdown.nvim",
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
  },
}
