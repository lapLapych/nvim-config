return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.clang_format.with({ filetypes = { "c++", "c" } }),
        null_ls.builtins.formatting.csharpier.with({ filetypes = { "cs" } }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      }
    })

    vim.keymap.set('n', '<C-k><C-e>', vim.lsp.buf.format, {})
  end
}
