(import-macros {: let! : autocmd!} :laurel.macros)
(import-macros {: vlua} :macros)

(local modes {:n :normal
              :no :readonly
              :v :visual
              :V "visual line"
              "\022" :insert
              :s :s
              :s :sl
              "\019" :sb
              :i :insert
              :ic :insert
              :r :ra
              :rv :rv
              :c :viex
              :cv :viex
              :ce :ex
              :r :r
              :rm :r
              :r? :r
              :! "!"
              :t ""})

(fn get-git-status []
  ;; TODO: implement this
  "")

(fn get-lsp-diagnostic []
  ;; TODO: implement this
  "")

(fn get-filetype []
  (.. "%#NormalNC#" vim.bo.filetype))

(fn color []
  (let [mode (. (vim.api.nvim_get_mode) :mode)]
    (var mode-color "%#Normal#")
    (if (= mode :n) (set mode-color "%#StatusNormal#")
        (or (= mode :i) (= mode :ic)) (set mode-color "%#StatusInsert#")
        (or (or (= mode :v) (= mode :V)) (= mode "\022"))
        (set mode-color "%#StatusVisual#") (= mode :R)
        (set mode-color "%#StatusReplace#") (= mode :c)
        (set mode-color "%#StatusCommand#") (= mode :t)
        (set mode-color "%#StatusTerminal#"))
    mode-color))

(fn get-fileinfo []
  (var filename (or
                  (and (= (vim.fn.expand "%") "")
                       " lopunny ")
                  (vim.fn.expand "%:t")))
  (when (not= filename " lopunny ")
    (set filename (.. " " filename " ")))
  (.. "%#Normal#" filename "%#NormalNC#"))

(fn get-searchcount []
  (when (= vim.v.hlsearch 0)
    (lua "return \"%#Normal# %l:%c \""))
  (local (ok count) (pcall vim.fn.searchcount {:recompute true}))
  (when (or
          (or (not ok) (= count.current nil))
          (= count.total 0))
    (lua "return \"\""))
  (when (= count.incomplete 1)
    (lua "return \"?/?\""))
  (local too-many (: ">%d" :format count.maxcount))
  (local total
         (or
           (and (> count.total count.maxcount)
                too-many)
           count.total))
  (.. "%#Normal#" (: " %s matches " :format total)))

(global Statusline {})
(set Statusline.statusline
     (fn []
       (table.concat [(color)
                      (: (string.format " %s "
                                        (. modes
                                           (. (vim.api.nvim_get_mode) :mode)))
                         :upper)
                      (get-fileinfo)
                      (get-git-status)
                      "%="
                      (get-lsp-diagnostic)
                      (get-filetype)
                      (get-searchcount)])))

(let! :o :laststatus 3)
(let! :o :cmdheight 0)
(let! :o :statusline (.. "%!" (vlua Statusline.statusline)))
