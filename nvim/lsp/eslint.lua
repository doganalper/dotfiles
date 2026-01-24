return {
  settings = {
    validate = "on",
    run = "onType",
  },
  on_init = function(client)
    if client.name == "eslint" then
      client.server_capabilities.documentFormattingProvider = false
      if client.server_capabilities.textDocument then
        client.server_capabilities.textDocument.diagnostic = nil
      end
      if client.server_capabilities.diagnosticProvider then
        client.server_capabilities.diagnosticProvider = nil
      end
    end
  end,
}
