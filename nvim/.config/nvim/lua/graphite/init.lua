local ok, telescope = pcall(require, 'telescope')
if not ok then
  vim.notify('This plugin requires telescope.nvim', vim.log.levels.ERROR)
  return
end

local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
--
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
--
local M = {}
local execute_command = function(cmd)
  local handle = io.popen(cmd)
  local result = handle:read '*a'
  handle:close()
  return result
end

local list_graphite_branches = function()
  local output = execute_command 'gt ls'
  local branches = {}
  for branch in output:gmatch '[^\r\n]+' do
    table.insert(branches, branch)
  end
  return branches
end

function M.graphite_branches()
  local branches = list_graphite_branches()

  pickers
    .new({}, {
      prompt_title = 'Graphite Branches',
      finder = finders.new_table {
        results = branches,
      },
      sorter = conf.generic_sorter {},
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          -- checkout_graphite_branch(selection[1])
          print('Checked out branch: ' .. selection[1])
        end)
        return true
      end,
    })
    :find()
end

M.graphite_branches = function(opts)
  opts = opts or {}
  local branches = list_graphite_branches()

  pickers
    .new(opts, {
      prompt_title = 'gt branches',
      finder = finders.new_table {
        results = branches,
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function()
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          print('selected' .. selection[1])
        end)
      end,
    })
    :find()
end

-- to execute the function
--
-- vim.api.nvim_echo 'hello'
--
function M.setup()
  vim.api.nvim_create_user_command('GraphiteBranches', M.graphite_branches, {})
end

M.setup()
return M
--
-- -- Function to checkout a Graphite branch
-- local function checkout_graphite_branch(branch)
--   execute_command('graphite branch checkout ' .. branch)
-- end
--
-- -- Telescope picker for Graphite branches
--
-- -- Set up the plugin
-- function M.setup()
--   vim.api.nvim_create_user_command('GraphiteBranches', M.graphite_branches, {})
-- end
--
-- -- Automatically set up the plugin
-- M.setup()
--
-- return M
