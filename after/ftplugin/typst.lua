local add = vim.pack.add
local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

add({'https://github.com/chomosuke/typst-preview.nvim'})
require('typst-preview').setup()

-- Enable spelling and wrap for window
vim.cmd('setlocal spell wrap')
vim.cmd('setlocal spelllang=pl')

-- Set spellfile for adding words to dictionary
local custom_spellfile = "M:/userdata/nvimSpell/pl.utf-8.add"
local spell_dir = "M:/userdata/nvimSpell"
if vim.fn.isdirectory(spell_dir) == 0 then
  vim.fn.mkdir(spell_dir, "p")
end
vim.cmd("setlocal spellfile=" .. vim.fn.fnameescape(custom_spellfile))

-- Fold with tree-sitter
vim.cmd('setlocal foldmethod=expr foldexpr=v:lua.vim.treesitter.foldexpr()')

-- Disable built-in `gO` mapping in favor of 'mini.basics'
-- vim.keymap.del('n', 'gO', { buffer = 0 })

nmap_leader('op', '<cmd>TypstPreview<cr>', 'Open Typst preview')
