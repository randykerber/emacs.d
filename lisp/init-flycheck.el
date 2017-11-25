(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
)

(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(provide 'init-flycheck)
