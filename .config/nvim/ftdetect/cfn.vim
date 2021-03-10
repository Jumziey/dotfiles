augroup cfn_detect
	autocmd!
	autocmd BufNewFile,BufRead * if match(getline(1),"AWSTemplateFormatVersion.*") >= 0 | set filetype=cfn | set syntax=yaml | endif
augroup END
