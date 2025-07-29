return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require("jdtls")
    local config = {
      cmd = {
        "jdtls"
      },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    }
    jdtls.start_or_attach(config)
  end,
}
