-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.cursorline = true
-- vim.opt.termguicolors = true
-- vim.opt.winblend = 0
-- vim.opt.wildoptions = "pum"
-- vim.opt.pumblend = 5
-- vim.opt.background = "dark"
-- vim.opt.colorscheme = "darkplus"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
