local config = {
    name = "jdtls",

    cmd = {
        vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls',
        ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar')
    },

    -- root_dir = vim.fs.root(0, {"gradlew", ".git", "mvnw"}),
    root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),

    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        java = {
        }
    },

    init_options = {
        bundles = {}
    },
}
require('jdtls').start_or_attach(config)
