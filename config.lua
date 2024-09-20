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

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "php" },
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
-- Formatters & Linters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    -- filetypes = { "typescript", "typescriptreact", "css", "cssls", "vue" },
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
