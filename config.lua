-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- rd: https://discord.com/invite/Xb9B4Ny

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.encoding = "UTF-8"
vim.opt.shiftwidth = 2
vim.opt.textwidth = 80
vim.opt.expandtab = true
vim.opt.breakindent = true


lvim.leader = "space"

reload("plugins")
reload("keymaps")

local ascii = require("ascii")

lvim.builtin.alpha.dashboard.section.header.val = ascii.art.text.neovim.sharp
-- reload("alpha-header")

-- Telescope
lvim.builtin.telescope.theme = "center"
-- lvim.builtin.telescope.defaults.file_ignore_patterns = { "node_modules" }

-- LSP Config
require("lvim.lsp.manager").setup("cssls", {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
  },
})

local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
      reportIncompatibleVariableOverride = false,
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "basic",   -- off, basic, strict
        useLibraryCodeForTypes = true
      }
    }
  },
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local util = require 'lspconfig.util'

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Dart LSP
lspconfig.dartls.setup({
  default_config = {
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    root_dir = util.root_pattern 'pubspec.yaml',
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = true,
      suggestFromUnimportedLibraries = true,
      closingLabels = true,
      outline = true,
      flutterOutline = true,
    },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
      },
    },
  },
  docs = {
    description =
    [[ https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec Language server for dart. ]],
    default_config = {
      root_dir = [[root_pattern("pubspec.yaml")]],
    },
  },
})

-- Emmet LSP
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "php", "htmldjango" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
        ["jsx.enabled"] = true,
        ["output.selfClosingStyle"] = "xml"
      },
    },
  }
})

-- Tailwind CSS LSP
lspconfig.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" }
        },
      },
    },
  },
})

-- SQL LSP
lspconfig.sqlls.setup({
  default_config = {
    cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
    filetypes = { 'sql', 'mysql' },
    root_dir = util.root_pattern '.sqllsrc.json',
    settings = {},
  },
  docs = {
    description = [[
https://github.com/joe-re/sql-language-server

This LSP can be installed via  `npm`. Find further instructions on manual installation of the sql-language-server at [joe-re/sql-language-server](https://github.com/joe-re/sql-language-server).
<br>
    ]],
  },
})

-- PHP Intelephense LSP
local intelephense_bin_name = "intelephense"

lspconfig.intelephense.setup({
  default_config = function()
    return util.utf8_config {
      cmd = { intelephense_bin_name, "--stdio" },
      filetypes = { "php" },
      root_dir = function(pattern)
        local cwd  = vim.loop.cwd();
        local root = util.root_pattern("composer.json", ".git")(pattern);

        -- prefer cwd if root is a descendant
        return util.path.is_descendant(cwd, root) and cwd or root;
      end
    }
  end,

  docs = {
    description = [[
https://intelephense.com/

`intelephense` can be installed via `:LspInstall intelephense` or by yourself with `npm`:
```sh
npm install -g intelephense
```
]],
    default_config = {
      root_dir = [[root_pattern("composer.json", ".git")]],
      on_init = [[function to handle changing offsetEncoding]],
      capabilities = [[default capabilities, with offsetEncoding utf-8]],
      init_options = [[{
        storagePath = Optional absolute path to storage dir. Defaults to os.tmpdir().
        globalStoragePath = Optional absolute path to a global storage dir. Defaults to os.homedir().
        licenceKey = Optional licence key or absolute path to a text file containing the licence key.
        clearCache = Optional flag to clear server state. State can also be cleared by deleting {storagePath}/intelephense
        -- See https://github.com/bmewburn/intelephense-docs#initialisation-options
      }]],
      settings = [[{
        intelephense = {
          files = {
            maxSize = 1000000;
          };
        };
        -- See https://github.com/bmewburn/intelephense-docs#configuration-options
      }]],
    },
  },
})

-- Formatters & Linters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "sqlfmt", filetypes = { "sql" } },
  { name = "black",  filetypes = { "python" } },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact", "css", "cssls", "vue", "html", "htmldjango", "javascript", "javascriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { name = "flake8" },
  -- { name = "eslint_d" }
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  { name = "eslint_d" }
}

-- NvimTree
local nvimtree = lvim.builtin.nvimtree

nvimtree.setup.filters.custom = {}

-- Miscelaneous
local lualine = lvim.builtin.lualine
local bufferline = lvim.builtin.bufferline
-- lvim.colorscheme = "material-palenight"
lvim.colorscheme = "carbonfox"
-- lvim.colorscheme = "tokyonight-storm"
-- lvim.colorscheme = "solarized-osaka"

lualine.style = "default"
lualine.sections.lualine_c = { "buffers" }
lualine.sections.lualine_x = { "diff", "encoding", "fileformat", "filetype" }

bufferline.active = false
