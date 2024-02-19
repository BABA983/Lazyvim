return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
      -- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
      --
      local border = {
        { "🭽", "FloatBorder" },
        { "▔", "FloatBorder" },
        { "🭾", "FloatBorder" },
        { "▕", "FloatBorder" },
        { "🭿", "FloatBorder" },
        { "▁", "FloatBorder" },
        { "🭼", "FloatBorder" },
        { "▏", "FloatBorder" },
      }

      -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      --   -- Use a sharp border with `FloatBorder` highlights
      --   border = "single",
      --   -- add the title in hover float window
      --   title = "hover",
      -- })
      -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      --   border = "single",
      -- })
      --
      -- vim.diagnostic.config({
      --   float = { border = border },
      -- })

      -- local origin_util_open_floating_preview = vim.lsp.util.open_floating_preview
      -- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      --   opts = opts or {}
      --   opts.border = opts.border or border
      --   return origin_util_open_floating_preview(contents, syntax, opts, ...)
      -- end
      -- require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
  },
}
