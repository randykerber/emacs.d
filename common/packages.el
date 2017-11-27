;;;; emacs common init                -*- mode: emacs-lisp -*-

(require 'use-package)

(use-package f)
(use-package s)
(use-package dash
  ;; :mode "\\.el$" "\\.lisp$"
)
(use-package company)

(use-package sparql-mode
             :mode "\\.sparql$" "\\.rq$")

(use-package ttl-mode
             :mode "\\.ttl$" "\\.nt$")
(use-package rdf-prefix
             :mode "\\.ttl$" "\\.nt$" "\\.rdf$" "\\.owl$")

;; (use-package tidy)
;; (use-package sql-mode)
;;              :mode "\\.sql$"
;;              :interpreter "sql")
(use-package sql-indent
             :mode "\\.sql$")
;; (use-package sql-ident)
;; sqlite

(use-package pkg-info)
(use-package magit)


(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . gfm-mode)
         )
  :init (setq markdown-command "multimarkdown"))

;; (use-package gfm-mode
;;              :mode "\\.md$" "\\.gfm$")
;; (use-package markdown-mode)

(use-package text-mode
             :ensure nil
             :mode "\\.txt$" "\\.log$"
             :init
             (remove-hook 'text-mode-hook 'smart-spacing-mode)
             (remove-hook 'text-mode-hook 'auto-detect-wrap)
             (add-hook 'text-mode-hook 'turn-on-auto-fill) ; wrap long lines in text mode
             (add-hook 'text-mode-hook 'turn-on-word-wrap)
             )

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


(use-package osx-location
             :defer nil)
(use-package magit-popup)
;; (use-package async)
(use-package bash-completion
             :mode "\\.sh$")
;; (use-package epl)
;; (use-package eshell)
;; (use-package flycheck)
;; (use-package request)
;; (use-package slime)
;; (use-package tablist)
;; (use-package yasnippet)
             
;; (use-package flycheck-scala-sbt)


(use-package ruby-mode
             :mode "\\.rb$"
             :interpreter "ruby")
;; (use-package scala-mode)
;; (use-package sbt-mode)
;; (use-package ensime)
(use-package yaml-mode
             :mode "\\.yml$"
             :init
             (add-hook 'yaml-mode-hook
                       '(lambda ()
                          (define-key yaml-mode-map "\C-m" 'newline-and-indent))))
;; (use-package org)
;; (use-package helm)
;; (use-package ivy
;;              :ensure t)

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

(use-package which-key
             :ensure t)
;; (use-package discover)
;; (use-package discover-my-major)
(use-package whole-line-or-region)
;; (use-package )

(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)
         ("\\.tmpl\\'" . json-mode)
         ("\\.eslintrc\\'" . json-mode))
  :config (setq-default js-indent-level 2))

(use-package json-reformat
  :ensure t
  :after json-mode
  :bind (("C-c r" . json-reformat-region)))

(use-package dired+
  :ensure t
  :defer t
  :config
  (setq diredp-hide-details-initially-flag nil)
  (set-face-foreground 'diredp-file-name nil)
  ;; Keep dired buffers updated when the file system changes.
  (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-verbose nil))

(use-package smartparens
  :ensure t
  :init (smartparens-global-mode 1)
  :diminish smartparens-mode)

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :config
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PATH")
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
             :mode "\\.csv$" "\\.tsv$"
             :config
             (setq csv-separators '("," ";" "|" " " "	")))
