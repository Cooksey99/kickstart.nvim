-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('harpoon').setup {
        global_settings = {
          mark_branch = true,
          save_on_toggle = false,
          enter_on_sendcmd = false,
        },
      }

      -- Custom keymap for jumping to last mark
      vim.api.nvim_set_keymap('n', '<Leader>lp', '<Cmd>lua require("harpoon.mark").jump_prev()<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'github/copilot.vim',
  },
  {
    'terrortylor/nvim-comment',
    lazy = false,
    config = function()
      require('nvim_comment').setup()

      vim.keymap.set('n', '<leader>m', function()
        require('Comment.api').toggle.linewise.current()
      end, { noremap = true, silent = true })

      vim.keymap.set('v', '<leader>m', function()
        local start_line = vim.fn.getpos "'<"
        local end_line = vim.fn.getpos "'>"

        require('Comment.api').toggle.linewise(start_line, end_line)
      end, { noremap = true, silent = true })
    end,
  },
}
