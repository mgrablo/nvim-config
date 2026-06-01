local bufnr = vim.api.nvim_get_current_buf()

local nmap = function(lhs, rhs, opts)
  -- See `:h vim.keymap.set()`
  vim.keymap.set('n', lhs, rhs, opts)
end

nmap(
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  {
    desc = "Show code actions",
    silent = true,
    buffer = bufnr
  }
)

nmap(
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  {
    desc = "Show hover actions",
    silent = true,
    buffer = bufnr
  }
)

nmap(
  "D",
  function()
    vim.cmd.RustLsp('openDocs')
  end,
  {
    desc = "Open docs",
    silent = true,
    buffer = bufnr,
  }
)
