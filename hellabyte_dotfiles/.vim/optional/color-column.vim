" Color column 72 and 80-300
if exists('+colorcolumn')
  execute "set colorcolumn=72," .join(range(80,300),",")
endif
