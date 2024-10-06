require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
        ['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
        ['<CR>'] = require('telescope.actions').select_default, -- open file
      },
    },
  },
  pickers = {
    find_files = {
      file_ignore_patterns = { 'node_modules', '.git', '.venv', 'env' },
      hidden = true,
    },
  },
  live_grep = {
    file_ignore_patterns = { 'node_modules', '.git', '.venv', 'env' },
    additional_args = function(_)
      return { '--hidden' }
    end,
  },

}

pcall(require('telescope').load_extension, 'fzf')