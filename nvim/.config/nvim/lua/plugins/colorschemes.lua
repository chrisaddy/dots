return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      -- Load the colorscheme
      vim.cmd.colorscheme 'tokyonight-day'
      -- Set background to none
      vim.cmd.highlight 'Normal ctermbg=none guibg=none'
      vim.cmd.hi 'Comment gui=none'
      require('which-key').add {
        { '<leader>tp', '<cmd>Telescope colorscheme<cr>', desc = '[T]heme [P]icker' },
      }
    end,
  },
}
