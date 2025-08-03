-- logic to close the diff
vim.api.nvim_create_autocmd("WinEnter", {
  group = vim.api.nvim_create_augroup("GitsignsDiffQ", { clear = true }),
  callback = function()
    if not vim.wo.diff then
      return
    end

    vim.keymap.set("n", "q", function()
      local cur = vim.api.nvim_get_current_win()
      local wins = vim.api.nvim_tabpage_list_wins(0)

      -- 1) Remember which windows are in diff now
      local diffwins = {}
      for _, w in ipairs(wins) do
        if vim.api.nvim_win_get_option(w, "diff") then
          table.insert(diffwins, w)
        end
      end
      if #diffwins == 0 then
        return
      end

      -- 2) Turn off diff in those windows
      for _, w in ipairs(diffwins) do
        if vim.api.nvim_win_is_valid(w) then
          vim.api.nvim_win_call(w, function()
            vim.cmd "diffoff!"
          end)
        end
      end

      -- 3) Close all former diff windows except the one you’re in
      for _, w in ipairs(diffwins) do
        if w ~= cur and vim.api.nvim_win_is_valid(w) then
          pcall(vim.api.nvim_win_close, w, false)
        end
      end

      -- 4) Stay in the current window
      if vim.api.nvim_win_is_valid(cur) then
        vim.api.nvim_set_current_win(cur)
      end
    end, { buffer = 0, silent = true })
  end,
})

return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gd", ":Gitsigns diffthis<CR>" },
      { "<leader>q", ":bd<CR>" },
      { "<leader>d", ":Gitsigns preview_hunk_inline<CR>" },
    },
  },
}
