return {
  dir = vim.fn.stdpath 'config' .. '/lua/graphite',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local ok, graphite = pcall(require, 'graphite')
    if not ok then
      vim.notify('Failed to load Graphite', vim.log.levels.ERROR)
      return
    end
    graphite.setup()
  end,
}
