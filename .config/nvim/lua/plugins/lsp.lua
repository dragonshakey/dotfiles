return {
	'neovim/nvim-lspconfig',

	config = function()
		local servers = { 
			lua_ls = {}, 
			ccls = {}, 
			bashls = {} 
		}


		local on_attach = function(client, bufnr) 
			vim.lsp.completion.enable(true, client.id, bufnr, {autotrigger = true,})
		end

		for server, config in pairs(servers) do 
			config.on_attach = on_attach

			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end
}
