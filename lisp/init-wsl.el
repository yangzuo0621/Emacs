;;; init-wsl.el --- wsl settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; teach Emacs how to open links with your default browser
(let ((cmd-exe "/mnt/c/Windows/System32/cmd.exe")
      (cmd-args '("/c" "start")))
  (when (file-exists-p cmd-exe)
    (setq browse-url-generic-program  cmd-exe
          browse-url-generic-args     cmd-args
          browse-url-browser-function 'browse-url-generic
          search-web-default-browser 'browse-url-generic)))

(provide 'init-wsl)
;;; prelude-wsl.el ends here
