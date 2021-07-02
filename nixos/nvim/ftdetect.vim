augroup bazel_detect
        autocmd!
        autocmd BufNewFile,BufReadPre *.bazel set filetype=bazel
        autocmd BufNewFile,BufReadPre *.bzl set filetype=bazel
        autocmd BufNewFile,BufReadPre WORKSPACE set filetype=bazel
        autocmd BufNewFile,BufReadPre BUILD set filetype=bazel
        autocmd BufNewFile,BufReadPre *.BUILD set filetype=bazel
augroup END

augroup cfn_detect
        autocmd!
        autocmd BufNewFile,BufRead * if match(getline(1),"AWSTemplateFormatVersion.*") >= 0 | set filetype=cfn | set syntax=yaml | endif
augroup END

augroup pri_detect
        autocmd!
        autocmd BufRead,BufNewFile *.pri set filetype=qtextra
augroup END

augroup pro_detect
        autocmd!
        autocmd BufRead,BufNewFile *.pro set filetype=qtextra
augroup END

augroup puml_detect
        autocmd!
        autocmd BufNewFile,BufRead *.puml set filetype=puml
augroup END

augroup slide_detect
        autocmd!
        autocmd BufNewFile,BufRead *.slide set filetype=slide
augroup END
