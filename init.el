;;;; emacs init                -*- mode: emacs-lisp -*-

(setq debug-on-error t)

;; (print "begin ~/gh/randykerber/emacs.d/init.el")


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

;;(load "~/.emacs.d/start.el")
;; Have to add (provided 'emacs-modified) to Emacs.app installation for following to work.

;; (print "features = ")
;; (print features)
;; (print "(featurep 'version-modified) = ")
;; (print (featurep 'version-modified))


(setq *emacs-init-dir* "~/gh/randykerber/emacs.d")

(setq *emacs-common-dir* (concat *emacs-init-dir* "/" "common"))

(let ((gc-cons-threshold (* 50 1024 1024)))

  ;; (load (concat *emacs-context-dir* "/" "init.el"))
  (load (concat *emacs-common-dir* "/" "init.el"))

  (garbage-collect)
  )

;;(add-to-list 'load-path "~/.emacs.d")

;; (print "END   ~/gh/randykerber/emacs.d/init.el")
