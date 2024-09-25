return {
  'nvim-neorg/neorg',
  lazy = false,
  version = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.highlights'] = {},
        ['core.qol.toc'] = {},
        ['core.queries.native'] = {},
        ['core.summary'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/notes',
              psf = '~/projects/psf/notes',
            },
          },
        },
      },
    }
    vim.api.nvim_create_user_command('NeorgTodos', function()
      require('neorg.core.queries.native').query('todo', {
        query = '* | (has-tag todo) (has-tag done)',
        workspace = 'notes',
      })
    end, {})
    vim.api.nvim_set_keymap('n', '<leader>nt', ':NeorgTodos<CR>', { noremap = true, silent = true })
  end,
}
