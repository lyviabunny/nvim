(import-macros {: use-package! : sync-packages!} :macros)

(use-package! "https://github.com/lewis6991/gitsigns.nvim")
(sync-packages!)

(let [{: setup} (require :gitsigns)]
  (setup {:signs {:add {:hl :diffAdded
                        :text "│"
                        :numhl :GitSignsAddNr
                        :linehl :GitSignsAAddLn}
                  :change {:hl :diffChanged
                           :text "│"
                           :numhl :GitSignsChangeNr
                           :linehl :GitSignsChangeLn}
                  :delete {:hl :diffRemoved
                           :text "-"
                           :numhl :GitSignsDeleteNr
                           :linehl :GitSignsDeleteLn}
                  :changedelete {:hl :diffChanged
                                 :text "‾"
                                 :numhl :GitSignsChangeNr
                                 :linehl :GitSignsChangeLn}
                  :topdelete {:hl :diffRemoved
                              :text "~"
                              :numhl :GitSignsDeleteNr
                              :linehl :GitSignsDeleteLn}}}))
