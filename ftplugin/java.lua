local settings = require 'config.lsp-settings'
local on_attach = settings.on_attach
local capabilities = settings.capabilities

local config = {
    cmd = {'/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    on_attach = on_attach,
    capabilities = capabilities,
}

require('jdtls').start_or_attach(config)

