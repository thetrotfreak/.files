vim.lsp.enable({
    "pyrefly",
    "ruff",
})

vim.diagnostic.config({
    -- virtual_lines = true,
    -- virtual_text = true,
    float = {
        border = "rounded",
        source = true,
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end,
})

vim.lsp.config("ruff", {
    init_options = {
        settings = {
            lint = {
                enable = false, -- disable lint diagnostics
            },
            format = {
                enable = true,
            },
            organizeImports = true,
        },
    },
})

