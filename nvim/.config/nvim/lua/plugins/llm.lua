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
        log_level = 'error', -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
      }
    end,
  },
  {
    'Bryley/neoai.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    cmd = {
      'NeoAI',
      'NeoAIOpen',
      'NeoAIClose',
      'NeoAIToggle',
      'NeoAIContext',
      'NeoAIContextOpen',
      'NeoAIContextClose',
      'NeoAIInject',
      'NeoAIInjectCode',
      'NeoAIInjectContext',
      'NeoAIInjectContextCode',
    },
    keys = {
      { '<leader>as', desc = 'summarize text' },
      { '<leader>ag', desc = 'generate git message' },
      { '<leader>aa', '<cmd>NeoAIToggle<cr>', desc = 'NeoAI', mode = 'n' },
      { '<leader>aa', '<cmd>NeoAIContextOpen<cr>', desc = 'NeoAI with Conext', mode = 'v' },
    },
    config = function()
      require('neoai').setup {
        ui = {
          output_popup_text = 'Al',
        },
        models = {
          { name = 'openai', model = 'gpt-4o-mini' },
        },
      }
    end,
  },
  {
    'frankroeder/parrot.nvim',
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim', 'rcarriga/nvim-notify' },
    config = function()
      require('parrot').setup {
        providers = {
          anthropic = {
            api_key = os.getenv 'ANTHROPIC_API_KEY',
          },
          gemini = {
            api_key = os.getenv 'GEMINI_API_KEY',
          },
          groq = {
            api_key = os.getenv 'GROQ_API_KEY',
          },
          mistral = {
            api_key = os.getenv 'MISTRAL_API_KEY',
          },
          pplx = {
            api_key = os.getenv 'PERPLEXITY_API_KEY',
          },
          ollama = {},
          openai = {
            api_key = os.getenv 'OPENAI_API_KEY',
          },
        },
        user_input_ui = 'buffer',
      }
      require('which-key').add {
        { '<leader>ai', '<cmd>PrtChatToggle<cr>', mode = 'n' },
        { '<leader>ai', '<cmd>PrtRewrite<cr>', mode = 'v' },
      }
    end,
  },
}
