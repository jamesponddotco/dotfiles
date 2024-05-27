local installed, tscontext = pcall(require, 'treesitter-context')

if not installed then
  return
end

tscontext.setup({
  max_lines = 0,
  min_window_height = 0,
})
