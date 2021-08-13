;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

;;; Standard package repositories

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
;; add Emacs China epla in case necessary.
;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))


;;; Fire up package.el

(setq package-enable-at-startup nil)
(package-initialize)

(provide 'init-elpa)
;;; init-elpa.el ends here
