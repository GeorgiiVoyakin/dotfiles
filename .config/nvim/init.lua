-- Set colorscheme
vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]

vim.opt.number = true -- show line numbers
vim.opt.termguicolors = true -- 24-bit RGB colors
-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Turn off arrow keys
vim.api.nvim_set_keymap('', '<Up>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Down>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Left>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Right>', '<Nop>', {noremap = true})

-- Lualine
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
