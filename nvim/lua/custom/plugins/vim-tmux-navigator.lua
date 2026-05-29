---@module 'lazy'
---@type LazySpec
return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
    },
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', silent = true },
      { '<C-j>', '<cmd>TmuxNavigateDown<cr>', silent = true },
      { '<C-k>', '<cmd>TmuxNavigateUp<cr>', silent = true },
      { '<C-l>', '<cmd>TmuxNavigateRight<cr>', silent = true },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
