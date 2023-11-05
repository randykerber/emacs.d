;;;; emacs common init                -*- mode: emacs-lisp -*-

(print "START common/init.el")

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

;; (print (concat "user-emacs-directory = " user-emacs-directory))


(unless (is-aqua)
  (setq custom-file (concat *emacs-context-dir* "/" "custom.el"))
  (load custom-file))

;; (setq rk--elpa-dir (concat user-emacs-directory "elpa"))

(load (concat *emacs-common-dir* "/" "boot-packages.el"))
(load (concat *emacs-common-dir* "/" "packages.el"))
(load (concat *emacs-common-dir* "/" "config.el"))
(load (concat *emacs-common-dir* "/" "keys.el"))


;;;;================================================================
;;;;  Window
;;;;================================================================


(setq initial-frame-alist
      '((top . 0) (left . 0) (width . 240) (height . 71)))

(setq default-frame-alist
      '((top . 0) (left . 0) (width . 240) (height . 71)))


;;;;================================================================
;;;;  Server
;;;;================================================================

;; INIT DAEMON SERVER
;;(require 'server)
;;(unless (server-running-p)
;;  (server-start))

(print "END   common/init.el")
