return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "List buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })

    vim.o.number = true
    vim.o.termguicolors = true

    pcall(telescope.load_extension, "fzf")
  end,
}
