;;;; emacs common init                -*- mode: emacs-lisp -*-

;(print "START common/init.el")

(setq debug-on-error t)


(setq *emacs-context*
      (cond ((featurep 'aquamacs)
             "aqua")

            ;; ((featurep 'emacs-modified)
            ;;  "mod")

            ;; ((featurep 'version-modified)
            ;;  "mod")

            ((string-match "linux" (symbol-name system-type))
             "linux")

            ((featurep 'linux)
             "linux")

            (t
             "brew"))
      )

;; (load (concat *emacs-init-dir* "/" "common" "/" "config.el"))

;;;;================================================================
;;;;  Keys
;;;;================================================================

;; (load (concat *emacs-init-dir* "/" "common" "/" "keys.el"))


;(print "END   common/init.el")
