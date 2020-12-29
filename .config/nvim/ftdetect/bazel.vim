augroup bazel_detect
	autocmd!
	autocmd BufNewFile,BufReadPre *.bazel set filetype=bazel
	autocmd BufNewFile,BufReadPre *.bzl set filetype=bazel
	autocmd BufNewFile,BufReadPre WORKSPACE set filetype=bazel
	autocmd BufNewFile,BufReadPre BUILD set filetype=bazel
	autocmd BufNewFile,BufReadPre *.BUILD set filetype=bazel
augroup END
