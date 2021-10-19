if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1


lua << EOF
local config = {
  -- The command that starts the language server
  cmd = {
    'jdt-language-server',
    '-Dosgi.bundles.defaultStartLevel=4',
    -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
  },
}
require('jdtls').start_or_attach(config)
EOF
