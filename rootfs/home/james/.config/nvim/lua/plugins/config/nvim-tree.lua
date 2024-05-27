local installed, tree = pcall(require, 'nvim-tree')

if not installed then
  return
end

tree.setup()

vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {
  silent = true,
  noremap = true
})
