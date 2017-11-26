;;;; emacs common init                -*- mode: emacs-lisp -*-

;(print "START common/init.el")

(setq debug-on-error t)


(load (concat *emacs-init-dir* "/" "common" "/" "packages.el"))

(load (concat *emacs-init-dir* "/" "common" "/" "config.el"))

;;;;================================================================
;;;;  Keys
;;;;================================================================

;; (load-init-file "keys.el")
;; (load-file "~/gh/randykerber/emacs.d/common/keys.el")

(load (concat *emacs-init-dir* "/" "common" "/" "keys.el"))


;(print "END   common/init.el")
