local capabilities = vim.lsp.protocol.make_client_capabilities()

if capabilities.workspace then
    capabilities.workspace.didChangeWatchedFiles = nil
end

return {
    capabilities = capabilities,
    settings = {
        gopls = {
            -- Prevents gopls from aggressively expanding workspace to unneeded modules
            expandWorkspaceToModule = false, 

            -- Keep staticcheck enabled, but tune down completion placeholders if typing lags
            usePlaceholders = false,

            -- If "Go to Implementation" or references freeze, disable experimental analyses
            analyses = {
                unusedparams = true,
                shadow = true,
            },
        },
    },
}
