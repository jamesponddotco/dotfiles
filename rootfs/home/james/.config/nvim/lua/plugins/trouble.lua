return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require("trouble")

    trouble.setup {
      mode = "document_diagnostics",
      use_diagnostic_signs = true,
    }

    vim.keymap.set("n", "<C-d>", function() require("trouble").toggle("diagnostics") end)
  end
}
