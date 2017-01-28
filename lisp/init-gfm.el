(when (maybe-require-package 'markdown-mode)
  (after-load 'whitespace-cleanup-mode
              (push 'gfm-mode whitespace-cleanup-mode-ignore-modes))
  )

;; (add-auto-mode 'gfm-mode "\\.\\(md\\|markdown\\|gfm\\)\\'")
;;; Markdown mode

(autoload 'gfm-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdt$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown$" . gfm-mode) auto-mode-alist))

(provide 'init-gfm)
