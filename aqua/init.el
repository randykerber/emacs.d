;;;; emacs aquamacs init           -*- mode: emacs-lisp -*-
;;

;; (print "START aqua/init.el")

(setq debug-on-error t)

(setq initial-frame-alist
      '((top . 0) (left . 0) (width . 240) (height . 71)))

(setq default-frame-alist
      '((top . 0) (left . 0) (width . 240) (height . 71)))

;; (setq *emacs-init-dir* "~/gh/randykerber/emacs.d")

;; (print (concat "system-type = " system-type))
;; (print "system-type =")
;; (print system-type)

;; (setq custom-file (concat *emacs-init-dir* "/" "brew" "/" "custom.el"))

;; (package-initialize)

;; ==================================================
;; Packages
;; ==================================================

;; (load-file "~/.emacs.d/aqua/packages.el")
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))


;; ==================================================
;; line wrapping
;; ==================================================

(aquamacs-set-line-wrapping-in-text-modes)


;; ==================================================
;; init.el that loads a bunch of init-* package dependencies.
;; ==================================================

;; (load (concat *emacs-init-dir* "/" "init.el"))


;; ==================================================
;; COMMON version of init.el
;; ==================================================

(load (concat *emacs-init-dir* "/" "common" "/" "init.el"))


;; ==================================================
;; Mac OS Modifier keys
;; ==================================================

;; key bindings
;; (when (eq system-type 'darwin) ;; mac specific settings
;;   ;; (setq ns-alternate-modifier 'meta)   ;; Behavior of the 'alt/option' key
;;   (setq ns-command-modifier 'alt)
;;      ;; (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
;;   )

;; (print "END   aqua/start.el")
