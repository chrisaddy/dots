return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-j>',
          clear_suggestion = '<C-k>',
          accept_word = '<C-w>',
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = '#ffffff',
          cterm = 244,
        },
        log_level = 'error',
        disable_inline_completion = false,
        disable_keymaps = false,
      }
    end,
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    build = 'make',
    opts = {
      -- add any opts here
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  -- {
  --   'frankroeder/parrot.nvim',
  --   dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim', 'rcarriga/nvim-notify', 'nvim-telescope/telescope.nvim' },
  --   config = function()
  --     require('parrot').setup {
  --       providers = {
  --         anthropic = {
  --           api_key = os.getenv 'ANTHROPIC_API_KEY',
  --         },
  --         gemini = {
  --           api_key = os.getenv 'GEMINI_API_KEY',
  --         },
  --         groq = {
  --           api_key = os.getenv 'GROQ_API_KEY',
  --         },
  --         mistral = {
  --           api_key = os.getenv 'MISTRAL_API_KEY',
  --         },
  --         pplx = {
  --           api_key = os.getenv 'PERPLEXITY_API_KEY',
  --         },
  --         ollama = {},
  --         openai = {
  --           api_key = os.getenv 'OPENAI_API_KEY',
  --         },
  --       },
  --       user_input_ui = 'buffer',
  --       hooks = {
  --         Docstring = function(prt, params)
  --           local template = [[
  --             You are a skilled programmer tasked with creating clear, concise, and informative docstrings.
  --
  --             Briefly describe the purpose of the function/method/class.
  --             List parameters with their types and explanations.
  --             Specify the return value type and description.
  --             Note any exceptions raised.
  --             Provide a short example of usage if helpful.
  --             Use the appropriate docstring format for the given language (e.g., PEP 257 for Python).
  --             Keep explanations clear and concise.
  --             Analyze the provided code and generate an appropriate docstring based on these guidelines.
  --
  --             Do not include any text except for the code itself. Do not include backticks.
  --
  --             Consider the folowing content from /home/chrisaddy/dots/nvim/.config/nvim/lua/plugins/llm.lua:
  --
  --             ```lua
  --             {{selection}}
  --             ```
  --           ]]
  --           local model_obj = prt.get_model 'command'
  --           prt.Prompt(params, prt.ui.Target.rewrite, model_obj, nil, template)
  --         end,
  --       },
  --     }
  --
  --     local commands = {
  --       { 'write docstring', 'PrtDocstring' },
  --       { 'rewrite', 'PrtRewrite' },
  --       { 'chat', 'PrtChatToggle' },
  --     }
  --
  --     local run_command = function(command)
  --       vim.cmd(command)
  --     end
  --
  --     local telescope = require 'telescope'
  --
  --     local parrot_picker = function(opts)
  --       local pickers = require 'telescope.pickers'
  --       local finders = require 'telescope.finders'
  --       local conf = require('telescope.config').values
  --       local actions = require 'telescope.actions'
  --       local action_state = require 'telescope.actions.state'
  --
  --       opts = opts or {}
  --       pickers
  --         .new(opts, {
  --           prompt_title = 'Parrot Commands',
  --           finder = finders.new_table {
  --             results = commands,
  --             entry_maker = function(entry)
  --               return {
  --                 value = entry,
  --                 display = entry[1],
  --                 ordinal = entry[1],
  --               }
  --             end,
  --           },
  --           sorter = conf.generic_sorter(opts),
  --           attach_mappings = function(prompt_bufnr, map)
  --             actions.select_default:replace(function()
  --               actions.close(prompt_bufnr)
  --               local selection = action_state.get_selected_entry()
  --               run_command(selection.value[2])
  --             end)
  --             return true
  --           end,
  --         })
  --         :find()
  --     end
  --
  --     telescope.register_extension {
  --       exports = {
  --         parrot = parrot_picker,
  --       },
  --     }
  --
  --     vim.api.nvim_set_keymap('n', '<leader>ap', [[<cmd>Telescope parrot<CR>]], { noremap = true, silent = true, desc = 'Open Parrot' })
  --   end,
  -- },
}
