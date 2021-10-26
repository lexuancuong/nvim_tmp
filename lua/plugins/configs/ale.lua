-- ALE options
vim.g.ale_disable_lsp = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_text_changed = 0
vim.g.ale_maximum_file_size = 500000 -- Don't lint large files (> 500KB), it can slow things down
vim.g.ale_sign_error = ''
vim.g.ale_sign_warning = ''

-- ALE fixers
local ale_fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  python = {'black', 'isort'}
}
vim.g.ale_fixers = ale_fixers

require("nvim-ale-diagnostic")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)
