-- `on_attach` callback will be called after a language server
-- instance has been attached to an open buffer with matching filetype
-- here we're setting key mappings for hover documentation, goto definitions, goto references, etc
-- you may set those key mappings based on your own preference
Lsp_keymap = function(client, bufnr)
    local opts = { noremap = true, silent = true }

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-j>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end

vim.keymap.set("n", "\\", "<CMD>NvimTreeToggle<CR>")
vim.keymap.set("n", "|", "<CMD>NvimTreeFocus<CR>")
vim.keymap.set("n", "-", "<CMD>w<CR>")

vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open oil.nvim" })

vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Code" })

term_keymap = function()
    local term_map = require("terminal.mappings")
    vim.keymap.set({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true })
    vim.keymap.set("n", "<leader>to", term_map.run("nu", { autoclose = true }))
    vim.keymap.set("n", "<leader>tO", term_map.run("nu", { autoclose = true, layout = { open_cmd = "enew" } }))
    vim.keymap.set(
        "n",
        "<leader>tl",
        term_map.run("nu", { autoclose = true, layout = { open_cmd = "belowright vnew" } })
    )
    vim.keymap.set("n", "<leader>tf", term_map.run("nu", { autoclose = true, layout = { open_cmd = "float" } }))
    vim.keymap.set("n", "<leader>tL", term_map.run("nu", { autoclose = true, layout = { open_cmd = "botright vnew" } }))
    vim.keymap.set("n", "<leader>tr", term_map.run)
    vim.keymap.set("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
    vim.keymap.set("n", "<leader>tk", term_map.kill)
    vim.keymap.set("n", "<leader>t]", term_map.cycle_next)
    vim.keymap.set("n", "<leader>t[", term_map.cycle_prev)
end

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

Execute_keymap = function(script)
    vim.keymap.set("n", "_", script)
end

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

vim.keymap.set("n", "=", "<CMD>BufferPick<CR>")
vim.keymap.set("n", "+", "<CMD>BufferClose<CR>")
vim.keymap.set("n", "<Left>", "<CMD>BufferPrevious<CR>")
vim.keymap.set("n", "<Right>", "<CMD>BufferNext<CR>")

vim.keymap.set(
    "i",
    "<C-i>",
    "copilot#Accept()",
    { expr = true, silent = true, noremap = false, replace_keycodes = false }
)
vim.g.copilot_no_tab_map = true

CompleteConfirm = "<CR>"
AutoComplete = "<Tab>"
AutoCompleteBack = "<S-Tab>"
