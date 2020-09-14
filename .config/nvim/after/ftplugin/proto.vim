function! ProcessBuf(context) abort
    let entries = []
    for line in a:context['output']
			let data = json_decode(line)
				let entry = {
										\ 'maker_name': 'buf',
										\ 'filename': data.path,
										\ 'text': data.message,
										\ 'lnum': data.start_line,
										\ 'col': data.start_column,
										\ 'type': data.type,
										\ }
				call add(entries, entry)
    endfor
    return entries
endfunction

let g:neomake_buf_maker = {
\ 'exe': 'buf',
\ 'args': ['check', 'lint', '--error-format=json', '--file'],
\ 'process_output': function('ProcessBuf')
\ }

let g:neomake_proto_enabled_makers = ['buf']

augroup proto
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

