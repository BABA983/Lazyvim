-- https://github.com/LazyVim/LazyVim/pull/2687
local LazyUtil = require("lazyvim.util")
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_c[4] = { LazyUtil.lualine.pretty_path({ length = 99 }) }
    end,
  },
}
