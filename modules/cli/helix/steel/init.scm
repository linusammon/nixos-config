(require "oil/oil.scm")
(require "notify/notify.scm")
(require "helix/keymaps.scm")

(notify-config 'render 'minimal)
(oil-configure! #true #true #true)

(keymap (global)
  (normal
    (space
      (o ":oil"))))

(keymap (buffer OIL-BUFFER-NAME (inherit-from (deep-copy-global-keybindings)))
  (normal
    (- ":oil-up")
    (ret ":oil-enter")
    (q ":oil-close")
    (C-r ":oil-root")
    (C-l ":oil-refresh")
    (C-s ":oil-save")
    (C-h ":oil-toggle-hidden")
    (C-g ":oil-toggle-git-ignored")
    (C-t ":oil-toggle-metadata")
    (C-y ":oil-yank")
    (C-x ":oil-cut")
    (C-p ":oil-paste")
    (C-c ":oil-clipboard-clear")))
