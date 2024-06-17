return {
   {
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      dependencies = {
         'nvim-lua/plenary.nvim',
      },
      config = function()
         -- basic config from https://github.com/ThePrimeagen/harpoon/tree/harpoon2
         local harpoon = require 'harpoon'

         -- REQUIRED
         harpoon:setup()
         -- REQUIRED

         vim.keymap.set('n', '<leader>a', function()
            harpoon:list():add()
         end)
         vim.keymap.set('n', '<leader>hh', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
         end, { desc = 'Open harpoon window' })

         vim.keymap.set('n', '<C-h>', function()
            harpoon:list():select(1)
         end)
         vim.keymap.set('n', '<C-j>', function()
            harpoon:list():select(2)
         end)
         vim.keymap.set('n', '<C-k>', function()
            harpoon:list():select(3)
         end)
         vim.keymap.set('n', '<C-l>', function()
            harpoon:list():select(4)
         end)

         -- -- Toggle previous & next buffers stored within Harpoon list
         -- vim.keymap.set('n', '<C-S-P>', function()
         --    harpoon:list():prev()
         -- end)
         -- vim.keymap.set('n', '<C-S-N>', function()
         --    harpoon:list():next()
         -- end)
      end,
   },
   -- Indicator of current harpoon selection in Lualine --
   {
      'letieu/harpoon-lualine',
      dependencies = {
         {
            'ThePrimeagen/harpoon',
            branch = 'harpoon2',
         },
      },
   },
}
