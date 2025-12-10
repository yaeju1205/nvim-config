local servers = vim.lsp.servers
local formatters = vim.lsp.formatters
local linters = vim.lsp.linters

local registry = require("mason-registry")

for i = 1, #servers do
    local success, pkg = pcall(registry.get_package, servers[i])

    if success and not pkg:is_installed() then
        pkg:install()
    end
end

for i = 1, #formatters do
    local success, pkg = pcall(registry.get_package, formatters[i])

    if success and not pkg:is_installed() then
        pkg:install()
    end
end

for i = 1, #linters do
    local success, pkg = pcall(registry.get_package, linters[i])

    if success and not pkg:is_installed() then
        pkg:install()
    end
end

vim.lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    flags = {
        debounce_text_changes = 200,
    },
})

vim.lsp.enable(servers)
