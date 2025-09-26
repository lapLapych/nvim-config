return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "csharp_ls", "clangd", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
	        vim.lsp.enable('lua_ls')
            vim.lsp.enable('csharp_ls')
            vim.lsp.enable('clangd')
            vim.lsp.enable('pyright')

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
