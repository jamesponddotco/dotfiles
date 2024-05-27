local installed, indent_blankline = pcall(require, 'indent_blankline')

if not installed then
  return
end

indent_blankline.setup {
  use_treesitter = true,
  show_current_context = true,
  context_patterns = {
    'class',
    'function',
    'method',
    'for_statement',
    'try_statement',
    'except_clause',
    'finally_clause',
    'while_statement',
    'if_statement',
    'with_statement',
  },
  filetype_exclude = {
    'lspinfo',
    'packer',
    'checkhealth',
    'help',
    'man',
    'git',
    'markdown',
    'text',
    'terminal',
  },
}
