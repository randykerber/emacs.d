;;;; emacs default.el                -*- mode: emacs-lisp -*-

;; (print "loading aqua/default.el")

(setq debug-on-error t)

(setq *emacs-init-dir* "~/gh/randykerber/emacs.d")


;; (setq custom-file (concat *emacs-init-dir* "/" "brew" "/" "custom.el"))

(load (concat *emacs-init-dir* "/" "common" "/" "default.el"))

;; (load-file "~/.emacs.d/all/default.el")

;; (print "end   aqua/default.el")
