return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require "cmp"

    local has_words_before = function()
      if vim.bo[0].buftype == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0
        and vim.api
            .nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]
            :match "^%s*$"
          == nil
    end

    cmp.setup {
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },

      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      mapping = cmp.mapping.preset.insert {
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        ["<C-p>"] = cmp.mapping.select_prev_item {
          behavior = cmp.SelectBehavior.Insert,
        },
        ["<C-n>"] = cmp.mapping.select_next_item {
          behavior = cmp.SelectBehavior.Insert,
        },
        ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
          elseif vim.snippet.active { direction = 1 } then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active { direction = -1 } then
            vim.snippet.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "treesitter" },
        { name = "buffer" },
        { name = "path" },
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = "λ",
            buffer = "Ω",
            path = "🖫",
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
    }
  end,
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp", dependencies = "nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help", dependencies = "nvim-cmp" },
    { "hrsh7th/cmp-buffer", dependencies = "nvim-cmp" },
    { "hrsh7th/cmp-path", dependencies = "nvim-cmp" },
    { "hrsh7th/cmp-nvim-lua", dependencies = "nvim-cmp" },
    { "ray-x/cmp-treesitter", dependencies = "nvim-cmp" },

    -- auto close opening brackets
    {
      "windwp/nvim-autopairs",
      config = function()
        local autopairs = require "nvim-autopairs"

        autopairs.setup {
          check_ts = true, -- treesitter integration
          disable_filetype = { "TelescopePrompt" },
        }

        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
          return
        end
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
      end,
    },
  },
}
