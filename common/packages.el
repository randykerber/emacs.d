;;;; emacs common init                -*- mode: emacs-lisp -*-

(eval-when-compile
  (require 'use-package))

(setq use-package-verbose t)
;; (require 'use-package-ensure)
(setq use-package-always-ensure t)
;;(setq use-package-always-defer t)


(use-package diminish)
(use-package bind-key)

;;; [use-package]( https://github.com/jwiegley/use-package )


(use-package better-defaults)


(use-package text-mode
  :ensure nil
  :defer t
  ;; :preface (provide 'text-mode)
  ;; :mode (("\\.txt\\'" . text-mode)
  ;;        ("\\.log\\'" . text-mode))
  :mode "\\.txt$"
  ;; :hook (turn-on-word-wrap
  ;;        turn-on-auto-fill)
  ;; :config
  ;; (turn-on-word-wrap)
  ;; (turn-on-auto-fill)
  ;; :init
  ;; (remove-hook 'text-mode-hook 'smart-spacing-mode)
  ;; (remove-hook 'text-mode-hook 'auto-detect-wrap)
  ;; (add-hook 'text-mode-hook 'turn-on-auto-fill) ; wrap long lines in text mode
  ;; (add-hook 'text-mode-hook 'turn-on-word-wrap)
  )

(use-package f :disabled)
(use-package s :disabled)
;;(use-package dash
  ;;:demand t
  ;;:mode "\\.el$" "\\.lisp$"
;;)

(use-package ido
  ;; :disabled
  :config
  (setq ido-show-dot-for-dired t)
  )

(use-package company)

(use-package sparql-mode
             :mode "\\.sparql$" "\\.rq$")

;;(use-package ttl-mode
;;             :mode "\\.ttl$" "\\.nt$")
;;(use-package rdf-prefix
;;             :mode "\\.ttl$" "\\.nt$" "\\.rdf$" "\\.owl$")

;; (use-package tidy)
;; (use-package sql-mode)
;;              :mode "\\.sql$"
;;              :interpreter "sql")
(use-package sql-indent
             :mode "\\.sql$")
;; (use-package sql-ident)
;; sqlite

(use-package pkg-info)
;; (use-package magit)


(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.gfm\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;; (use-package gfm-mode
;;              :mode "\\.md$" "\\.gfm$")
;; (use-package markdown-mode)

(use-package whitespace-cleanup-mode
             :config
             (push 'gfm-mode whitespace-cleanup-mode-ignore-modes)
             (push 'markdown-mode whitespace-cleanup-mode-ignore-modes))

;; exec-path-from-shell
;; expand-region
;; gh, github
;; gitignore-mode
;; gnuplot
;; html
;; paredit
;; pip
;; pkg-info
;; (use-package smex)


(use-package osx-location)

;; (use-package magit-popup)

;; (use-package async)

(use-package bash-completion
             :mode ("\\.sh$" "\\.bash$")
             )

(use-package eshell)

;; (use-package epl)
;; (use-package flycheck)
;; (use-package request)
;; (use-package slime)
;; (use-package tablist)
;; (use-package yasnippet)

;; (use-package flycheck-scala-sbt)


;;(use-package ruby-mode
;;             :mode "\\.rb$"
;;             :interpreter "ruby")
;; (use-package scala-mode)
;; (use-package sbt-mode)
;; (use-package ensime)

(use-package yaml-mode
             :mode ("\\.yml$" "\\.yaml$")
             :init
             (add-hook 'yaml-mode-hook
                       #'(lambda ()
                           (define-key yaml-mode-map "\C-m"
                            'newline-and-indent))))
;; (use-package org)
;; (use-package helm)

(use-package tramp
             :config
             (defun sudo ()
               "Use TRAMP to `sudo' the current buffer" (interactive)
               (when buffer-file-name
                 (find-alternate-file
                  (concat "/sudo:root@localhost:"
                          buffer-file-name)))))

;; (use-package slime-docker)
;; (use-package docker-tramp)
;; (use-package docker-api)
;; (use-package docker)
;; (use-package dockerfile-mode)

(use-package which-key)

;; (use-package discover)
;; (use-package discover-my-major)

(use-package whole-line-or-region)

(use-package json-mode
  :mode (("\\.json\\'" . json-mode)
         ("\\.tmpl\\'" . json-mode)
         ("\\.eslintrc\\'" . json-mode))
  :config (setq-default js-indent-level 2))

(use-package json-reformat
  :after json-mode
  :bind (("C-c r" . json-reformat-region)))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  )
(use-package elpy
  :after python-mode
  :init (elpy-enable))

(use-package init-scala
  :disabled
  :mode (("\\.scala" . scala-mode))
  :load-path "lisp/")

(use-package ess-site
  :disabled
  :commands R)

(use-package dired+
  :disabled
  :config
  ;;(setq diredp-hide-details-initially-flag nil)
  ;;(set-face-foreground 'diredp-file-name nil)
  ;; Keep dired buffers updated when the file system changes.
  ;;(setq global-auto-revert-non-file-buffers t)
  ;;(setq auto-revert-verbose nil)
  )

(use-package dired-x
  :disabled)

(use-package ivy
  :disabled)


(use-package smartparens
  :demand t
  :config (smartparens-global-mode 1)
  :diminish smartparens-mode
  )

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize)
  ;; (exec-path-from-shell-copy-env "PATH")
  )

;; (use-package csv-mode
;;              :mode "\\.csv$" "\\.tsv$"
;;              :config
;;              (setq csv-separators '("," ";" "|" " " "	")))
;; (use-package csv-nav
;;              :mode "\\.csv$" "\\.tsv$"
;;              :config
;;              (setq csv-separators '("," ";" "|" " " "	")))

(use-package csv
             :mode ("\\.csv$" "\\.tsv$")
             :config
             (setq csv-separators '("," ";" "|" " " "	"))
             )

;;(use-package smart-mode-line
;;  :ensure t
;;  )
;;
;; (sml/setup)

(use-package key-chord
  :disabled
  :config
  (key-chord-mode 1)
  (key-chord-define-global "--" "_")
  )

;; http://www.funtoo.org/Keychain
;;(use-package keychain-environment
;;  :init (keychain-refresh-environment))
