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

(defun is-aqua () (equal *emacs-context* "aqua"))
(defun is-brew () (equal *emacs-context* "brew"))
(defun is-linux () (equal *emacs-context* "linux"))
(defun is-mac () (or (is-brew) (is-aqua)))

(setq *emacs-context-dir* (concat *emacs-init-dir* "/" *emacs-context*))

;; (print "user-emacs-directory = ")
;; (print user-emacs-directory)

(unless (is-aqua)
  (setq user-emacs-directory (concat *emacs-context-dir* "/")))

(print (concat "user-emacs-directory = " user-emacs-directory))


;;;;================================================================
;;;;  Keys
;;;;================================================================

;; (load (concat *emacs-init-dir* "/" "common" "/" "keys.el"))


;(print "END   common/init.el")
