;;; init-packages.el --- Measure startup and require times -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil)
(global-hl-line-mode 1)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-packages)
;;; init-packages.el ends here
