-- Toggle a horizontal terminal split
vim.keymap.set('n', '<leader>tt', function()
  -- Search for a terminal buffer in current tabpage
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
      -- If found, close the window
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  -- If not found, open a new horizontal split terminal
  vim.cmd 'split | term'
end, { desc = '[T]oggle Horizontal [T]erminal' })
