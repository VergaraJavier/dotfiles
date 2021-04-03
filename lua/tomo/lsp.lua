local on_attach = require'completion'.on_attach
require'lspconfig'.tsserver.setup{on_attach=on_attach}

-- g(o) d(efinition)
vim.api.nvim_set_keymap("n", "gd" , "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- g(o) r(eference)
vim.api.nvim_set_keymap("n", "gr" , "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
-- K for hover information
vim.api.nvim_set_keymap("n", "K" , "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- s(how) d(iagnostics)
vim.api.nvim_set_keymap("n", "<leader>sd", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { noremap = true})
