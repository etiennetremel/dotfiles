local opts = {
  -- add any opts here
  -- for example
  provider = "openrouter_gemini_2_5_pro",
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
    timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
    temperature = 0,
    max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
    --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  },
  -- gemini = {
  --   model = "gemini-2.5-pro-preview-05-06",
  --   -- model = "gemini-2.5-flash",
  -- },
  -- vertex = {
  --   endpoint = "https://us-central1-aiplatform.googleapis.com/v1/projects/home-diy-340312/locations/us-central1/publishers/google/models",
  --   model = "gemini-2.5-pro-preview-05-06",
  -- },
  vendors = {
    openrouter_gemini_2_5_pro = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "google/gemini-2.5-pro-preview",
    },
    openrouter_gemini_2_flash = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "google/gemini-2.0-flash-001",
    },
    openrouter_qwen3_235b_a22b = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "qwen/qwen3-235b-a22b",
    },
    openrouter_claude_3_7_sonnet = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "anthropic/claude-3.7-sonnet",
    },
    openrouter_chatgpt_4_1 = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "openai/gpt-4.1",
    },
  },
  auto_suggestions_provider = "openrouter_gemini_2_flash",
}

require("avante").setup(opts)
