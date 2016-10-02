(message "loading init-helm.el")

;; (when (maybe-require-package 'helm-config)
(when (maybe-require-package 'helm)
  (message "after maybe-require-package 'helm-config")
  (require 'helm-config)
  (after-load 'helm-mode
    (diminish 'elm-indent-mode)
    (message "after-load 'helm-mode after (diminish-elm)")
    ;; (when (executable-find "elm-oracle")
    ;;   (add-hook 'elm-mode-hook 'elm-oracle-setup-completion))
    )
  )

(provide 'init-helm)
