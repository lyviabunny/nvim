(local paths (-> (vim.fn.stdpath "config")
                 (.. "/fnl/modules/*")
                 (vim.fn.glob)
                 (vim.split "\n")))

(each [_ abs_path (ipairs paths)]
  (let [path (string.match abs_path "(modules/[^./]+)%.fnl$")]
    (if (and path (not= path "modules/init"))
        (require path))))
