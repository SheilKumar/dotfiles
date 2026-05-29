---@module 'lazy'
---@type LazySpec
return {
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    opts = {
      terminal = {
        provider = "none",
      },
    },
    keys = {
      { '<leader>a',  nil,                                desc = 'AI/Claude Code' },
      { '<leader>ac', '<cmd>ClaudeCode<cr>',              desc = 'Toggle Claude' },
      { '<leader>af', '<cmd>ClaudeCodeFocus<cr>',         desc = 'Focus Claude' },
      { '<leader>ar', '<cmd>ClaudeCode --resume<cr>',     desc = 'Resume Claude' },
      { '<leader>aC', '<cmd>ClaudeCode --continue<cr>',   desc = 'Continue Claude' },
      { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>',   desc = 'Select model' },
      { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>',         desc = 'Add buffer' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>',          mode = 'v', desc = 'Send selection' },
      { '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>',       ft = { 'neo-tree', 'oil', 'minifiles', 'netrw' }, desc = 'Add file' },
      { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>',    desc = 'Accept diff' },
      { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>',      desc = 'Reject diff' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
