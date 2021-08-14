;;; init-packages.el --- Measure startup and require times -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-screen 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(global-hl-line-mode 1)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)


(provide 'init-packages)
;;; init-packages.el ends here
