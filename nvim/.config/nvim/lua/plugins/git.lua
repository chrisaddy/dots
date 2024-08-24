return {
  {
    'chrisaddy/graphite.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('graphite').setup()
      require('which-key').add {
        { '<leader>g', group = '[G]it' },
        { '<leader>gb', '<cmd>GraphiteBranches<cr>', desc = '[G]it [B]ranches' },
      }
    end,
  },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
      'kdheepak/lazygit.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('octo').setup()
      require('which-key').add {
        { '<leader>g', group = '[G]it' },
        { '<leader>gp', group = '[G]it Pull Requests' },
        { '<leader>gi', group = '[G]it Issues' },
        { '<leader>gil', '<cmd>Octo issue list<cr>', desc = '[G]it Issue List' },
        { '<leader>gic', '<cmd>Octo issue create<cr>', desc = '[G]it Issue Create' },
        { '<leader>gpc', '<cmd>Octo pr create<cr>', desc = '[G]it Pull [R]equest [C]reate' },
        { '<leader>gg', '<cmd>LazyGit<cr>', desc = '[G]it dashboard' },
        { '<leader>gpl', '<cmd>Octo pr list<cr>', desc = '[G]it [P]ull Request [L]ist' },
      }
    end,
  },
}
