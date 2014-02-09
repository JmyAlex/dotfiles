if get(g:, 'airline#themes#tomorrow#constant', 0)
  let g:airline#themes#tomorrow#palette = {}

  " Normal mode
  let s:N1 = ['', '', 234, 4, 'bold']
  "let s:N2 = ['', '', 15, 8]
  "let s:N3 = ['', '', "NONE", 0]
  let s:N2 = airline#themes#get_highlight('Pmenu')
  let s:N3 = airline#themes#get_highlight('CursorLine')
  let g:airline#themes#tomorrow#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#tomorrow#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  " Insert mode
  let s:I1 = ['', '', 234, 10]
  let s:I2 = ['', '', 10, 234]
  let s:I3 = s:N3
  let g:airline#themes#tomorrow#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#tomorrow#palette.insert_modified = g:airline#themes#tomorrow#palette.normal_modified

  " Replace mode
  let s:R1 = ['', '', 9, 52, 'bold']
  let s:R2 = s:N2
  let s:R3 = s:N3
  let g:airline#themes#tomorrow#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#tomorrow#palette.replace_modified = g:airline#themes#tomorrow#palette.normal_modified

  " Visual mode
  let s:V1 = ['', '', 234, 9, 'bold']
  let s:V2 = ['', '', 9, 234]
  let s:V3 = s:N3
  let g:airline#themes#tomorrow#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#tomorrow#palette.visual_modified = g:airline#themes#tomorrow#palette.normal_modified

  " Inactive window
  "let s:IA = ['', '', 8, 0]
  let s:IA = airline#themes#get_highlight2(['NonText', 'fg'], ['CursorLine', 'bg'])
  let g:airline#themes#tomorrow#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#tomorrow#palette.inactive_modified = {
		\ 'airline_c': [ group[0], '', group[2], '', '' ]
		\ }
else
function! airline#themes#tomorrow#refresh()
  let g:airline#themes#tomorrow#palette = {}
  let g:airline#themes#tomorrow#palette.accents = {
        \ 'red': airline#themes#get_highlight('Constant'),
        \ }

  let s:N1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Directory', 'fg'], 'bold')
  let s:N2 = airline#themes#get_highlight('Pmenu')
  let s:N3 = airline#themes#get_highlight('CursorLine')
  let g:airline#themes#tomorrow#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#tomorrow#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  let s:I1 = airline#themes#get_highlight2(['Normal', 'bg'], ['MoreMsg', 'fg'], 'bold')
  let s:I2 = airline#themes#get_highlight2(['MoreMsg', 'fg'], ['Normal', 'bg'])
  let s:I3 = s:N3
  let g:airline#themes#tomorrow#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#tomorrow#palette.insert_modified = g:airline#themes#tomorrow#palette.normal_modified

  let s:R1 = airline#themes#get_highlight('Error', 'bold')
  let s:R2 = s:N2
  let s:R3 = s:N3
  let g:airline#themes#tomorrow#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#tomorrow#palette.replace_modified = g:airline#themes#tomorrow#palette.normal_modified

  let s:V1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Constant', 'fg'], 'bold')
  let s:V2 = airline#themes#get_highlight2(['Constant', 'fg'], ['Normal', 'bg'])
  let s:V3 = s:N3
  let g:airline#themes#tomorrow#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#tomorrow#palette.visual_modified = g:airline#themes#tomorrow#palette.normal_modified

  let s:IA = airline#themes#get_highlight2(['NonText', 'fg'], ['CursorLine', 'bg'])
  let g:airline#themes#tomorrow#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#tomorrow#palette.inactive_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }
endfunction

call airline#themes#tomorrow#refresh()
endif
