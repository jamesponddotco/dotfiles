local installed, trouble = pcall(require, 'trouble')

if not installed then
  return
end

trouble.setup {
  mode = "document_diagnostics",
  use_diagnostic_signs = true,
}

vim.keymap.set("n", "<C-t>", function() require("trouble").toggle() end)
