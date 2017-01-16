;;;; emacs default.el                -*- mode: emacs-lisp -*-

(print "loading aqua/default.el")

(load-file "~/.emacs.d/all/default.el")
(setq *emacs-init-dir* "~/gh/randykerber/emacs.d")
(load (concat *emacs-init-dir* "/" "common" "/" "default.el"))

(print "end   aqua/default.el")
