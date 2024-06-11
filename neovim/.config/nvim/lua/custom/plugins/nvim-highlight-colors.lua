return {
   'brenoprata10/nvim-highlight-colors',
   config = function()
      require('nvim-highlight-colors').setup {
         enable_tailwind = true,
         render = 'background',
      }
   end,
}
