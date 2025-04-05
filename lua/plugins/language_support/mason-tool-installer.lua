return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			"black",
			"isort",
			"prettier",
			"prettierd",
			"stylua",
      "shfmt",
      "hclfmt"
		},
	},
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
}
