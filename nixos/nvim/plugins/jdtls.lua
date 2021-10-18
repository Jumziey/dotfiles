local config = {
  -- The command that starts the language server
  cmd = {
    'jdt-language-server',
    '-Dosgi.bundles.defaultStartLevel=4',
    -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
  },
}
require('jdtls').start_or_attach(config)
