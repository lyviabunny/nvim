(import-macros {: map!} :macros)

(map! [n] :<leader>bl ":buffers<CR>"
      { :silent true })
(map! [n] :<leader>bk ":bdelete<CR>"
      { :silent true })
