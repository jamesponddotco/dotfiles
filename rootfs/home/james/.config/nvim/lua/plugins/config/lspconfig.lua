local installed, lspconfig = pcall(require, 'lspconfig')

if not installed then
  return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.bashls.setup{
  capabilities = capabilities,
}

lspconfig.golangci_lint_ls.setup{
  capabilities = capabilities,
}

lspconfig.gopls.setup{
  capabilities = capabilities,
}

lspconfig.intelephense.setup{
  capabilities = capabilities,
  settings = {
    intelephense = {
      stubs = {
        "bcmath",
        "bz2",
        "Core",
        "curl",
        "date",
        "dom",
        "fileinfo",
        "filter",
        "gd",
        "gettext",
        "hash",
        "iconv",
        "imap",
        "intl",
        "json",
        "libxml",
        "mbstring",
        "mcrypt",
        "mysql",
        "mysqli",
        "password",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_mysql",
        "Phar",
        "readline",
        "regex",
        "session",
        "SimpleXML",
        "sockets",
        "sodium",
        "standard",
        "superglobals",
        "tokenizer",
        "xml",
        "xdebug",
        "xmlreader",
        "xmlwriter",
        "yaml",
        "zip",
        "zlib",
        "wordpress",
        "wordpress-globals",
      },
      environment = {
        includePaths = '/home/james/.config/composer/vendor/php-stubs/',
      },
      files = {
        maxSize = 1000000,
      },
      diagnostics = {
        enabled = true,
      },
    },
  },
}

lspconfig.rust_analyzer.setup{
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
        enableExperimental = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
    }
  }
}

lspconfig.taplo.setup{
  capabilities = capabilities,
}

lspconfig.tsserver.setup{
  capabilities = capabilities,
}
