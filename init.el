;; (setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(global-display-line-numbers-mode)

(add-hook 'after-init-hook 'global-company-mode)

(setq make-backup-files nil)
