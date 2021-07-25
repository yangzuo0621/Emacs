(setq inhibit-startup-message t)
(setq make-backup-files nil)
(global-display-line-numbers-mode)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

(setq save-interprogram-paste-before-kill t)
(global-auto-revert-mode 1) ;; you might not want this
(setq auto-revert-verbose nil) ;; or this

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Org-mode stuff
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe")
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook #'org-bullets-mode))

;; ido mode
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer)
; (defalias 'list-buffers 'ibuffer-other-window)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
;    (custom-set-faces
;     '(aw-leading-char-face
;      ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package counsel
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-line))

;(add-hook 'after-init-hook 'global-company-mode)
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;(use-package auto-complete
;  :ensure t
;  :init
;  (progn
;    (ac-config-default)
;    (global-auto-complete-mode t)
;    ))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(setq py-python-command "python3")
(setq python-shell-interpreter "python3")
(setq flycheck-python-pylint-executable "python3")

;(use-package jedi
;  :ensure t
;  :init
;  (add-hook 'python-mode-hook 'jedi:setup)
;  (add-hook 'python-mode-hook 'jedi:ac-setup))

;(use-package company-jedi
;  :ensure t
;  :config
;  (defun my/python-mode-hook ()
;    (add-to-list 'company-backends 'company-jedi))
;  (add-hook 'python-mode-hook 'jedi:setup)
;  (setq jedi:complete-on-dot t)
;  (add-hook 'python-mode-hook 'my/python-mode-hook))

;(use-package elpy
;  :ensure t
;  :init
;  (elpy-enable))

(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook #'lsp)
  (setq lsp-enable-snippet nil))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/yasnippet-snippets/snippets")))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

;(use-package better-shell
;  :ensure t
;  :bind (("C-'" . better-shell-shell)
;	    ("C-c [" . better-shell-remote-open)))

(use-package hydra
  :ensure t
  :init
  (global-set-key
   (kbd "C-x t")
   (defhydra toggle (:color blue)
     "toggle"
     ("a" abbrev-mode "abbrev")
     ("s" flyspell-mode "flyspell")
     ("d" toggle-debug-on-error "debug")
     ("c" fci-mode "fCi")
     ("f" auto-fill-mode "fill")
     ("t" toggle-truncate-lines "truncate")
     ("w" whitespace-mode "whitespace")
     ("q" nil "cancel")))
  (global-set-key
     (kbd "C-x j")
     (defhydra gotoline 
     (:pre (linum-mode 1)
     :post (linum-mode -1))
     "goto"
     ("t" (lambda () (interactive)(move-to-window-line-top-bottom 0)) "top")
     ("b" (lambda () (interactive)(move-to-window-line-top-bottom -1)) "bottom")
     ("m" (lambda () (interactive)(move-to-window-line-top-bottom)) "middle")
     ("e" (lambda () (interactive)(end-of-buffer)) "end")
     ("c" recenter-top-bottom "recenter")
     ("n" next-line "down")
     ("p" (lambda () (interactive) (forward-line -1))  "up")
     ("g" goto-line "goto-line")
     ))
  (global-set-key
   (kbd "C-c t")
   (defhydra hydra-global-org (:color blue)
     "Org"
     ("t" org-timer-start "Start Timer")
     ("s" org-timer-stop "Stop Timer")
     ("r" org-timer-set-timer "Set Timer") ; This one requires you be in an orgmode doc, as it sets the timer for the header
     ("p" org-timer "Print Timer") ; output timer value to buffer
     ("w" (org-clock-in '(4)) "Clock-In") ; used with (org-clock-persistence-insinuate) (setq org-clock-persist t)
     ("o" org-clock-out "Clock-Out") ; you might also want (setq org-log-note-clock-out t)
     ("j" org-clock-goto "Clock Goto") ; global visit the clocked task
     ("c" org-capture "Capture") ; Don't forget to define the captures you want http://orgmode.org/manual/Capture.html
     ("l" (or )rg-capture-goto-last-stored "Last Capture"))
   ))

;(load-theme 'zenburn t)
(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

; If you like a tabbar
;(use-package tabbar
;  :ensure t
;  :config
;  (tabbar-mode 1))

; (winner-mode 1)
; (windmove-default-keybindings)

; highlight the select line
(global-hl-line-mode t)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;(use-package aggressive-indent
;  :ensure t
;  :config
;  (global-aggressive-indent-mode 1))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-]") 'er/expand-region))

(use-package iedit
  :ensure t
  :config
  (global-set-key (kbd "C-c ;") 'iedit-mode))

(defun narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or defun,
whichever applies first. Narrowing to org-src-block actually
calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."

(interactive "P")
(declare (interactive-only))
(cond ((and (buffer-narrowed-p) (not p)) (widen))
      ((region-active-p)
       (narrow-to-region (region-beginning) (region-end)))
      ((derived-mode-p 'org-mode)
       ;; `org-edit-src-code' is not a real narrowing
       ;; command. Remove this first conditional if
       ;; you don't want it.
       (cond ((ignore-errors (org-edit-src-code) t)
	      (delete-other-windows))
	     ((ignore-errors (org-narrow-to-block) t))
	     (t (org-narrow-to-subtree))))
      ((derived-mode-p 'latex-mode)
       (LaTeX-narrow-to-environment))
      (t (narrow-to-defun))))

;; (define-key endless/toggle-map "n" #'narrow-or-widen-dwim)
;; This line actually replaces Emacs' entire narrowing keymap, that's
;; how much I like this command. Only copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

(use-package multiple-cursors
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
	'(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
	  ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))

(defun load-if-exists (f)
  "load the elisp file only if it exists and is readable"
  (if (file-readable-p f)
      (load-file f)))

;; load local elisp configs
(load-if-exists "some-file.el")
