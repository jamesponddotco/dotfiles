return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local ibl = require("ibl")

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
  end
}
