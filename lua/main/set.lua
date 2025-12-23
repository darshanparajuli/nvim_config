-- vim.opt.guicursor = ""
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 250

-- vim.opt.colorcolumn = "80"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = {
  tab = '‣ ',
  eol = '¬',
  extends = '→',
  precedes = '←',
  trail = '·',
  nbsp = '␣',
}
vim.opt.pumheight = 10

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.rs" },
  command = [[lua vim.lsp.buf.format()]],
})

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = false,
}

vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
