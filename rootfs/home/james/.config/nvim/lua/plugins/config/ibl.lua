local installed, ibl = pcall(require, 'ibl')

if not installed then
  return
end

ibl.setup({
  debounce = 100,
  scope = {
    show_start = false,
    show_end = false,
  },
  whitespace = {
    remove_blankline_trail = false,
  },
  scope = {
    show_start = false,
    show_end = false,
  },
})
