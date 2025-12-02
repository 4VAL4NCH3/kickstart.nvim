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

-- Copilot keybindings
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<S-Tab>', 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })

-- UndoTree toggle keybinding
vim.keymap.set('n', '<leader>tu', ':UndotreeToggle<CR>', { desc = '[T]oggle [U]ndoTree panel' })

-- Reload file keybinding
vim.keymap.set('n', '<leader>r', ':edit<CR>', { desc = '[R]eload buffer from file' })
