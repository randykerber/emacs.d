;;;; emacs default.el                -*- mode: emacs-lisp -*-

;; (print "loading brew/default.el")

(setq debug-on-error t)

(setq *emacs-init-dir* "~/gh/randykerber/emacs.d")


;; (setq custom-file (concat *emacs-init-dir* "/" "brew" "/" "custom.el"))

(load (concat *emacs-init-dir* "/" "common" "/" "default.el"))


;; (print "end   brew/default.el")
