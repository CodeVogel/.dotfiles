local rebinds = function()
   -- Rebind gg to go to first character of file instead of just the top line
   vim.keymap.set('n', 'gg', 'gg0', { desc = 'Go to first character of file' })

   -- Rebind <C-c> to <Esc>
   vim.keymap.set({ 'i', 'n', 'v' }, '<C-C>', '<esc>', { desc = 'Make Ctrl+C behave exactly like escape.' })
end

local auto_cmds = function() end

return {
   dev = true,
   dir = '.',
   config = function()
      rebinds()
      auto_cmds()
   end,
}
