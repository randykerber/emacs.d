;;;; emacs linux init           -*- mode: emacs-lisp -*-
;;

;; (print "START linux/init.el")

(setq debug-on-error t)

(unless (equal *emacs-context* "aqua")
  (setq custom-file (concat *emacs-context-dir* "/" "custom.el"))
  (load custom-file))

;; (setq rk--elpa-dir (concat user-emacs-directory "elpa"))

(load (concat *emacs-common-dir* "/" "boot-packages.el"))
(load (concat *emacs-common-dir* "/" "packages.el"))
(load (concat *emacs-common-dir* "/" "config.el"))
(load (concat *emacs-common-dir* "/" "keys.el"))


(setq initial-frame-alist
      '((top . 0) (left . 0) (width . 240) (height . 71)))

(setq default-frame-alist
      '((top . 0) (left . 0) (width . 240) (height . 71)))

;; (print (concat "system-type = " system-type))
;; (print "system-type =")
;; (print system-type)

;; ==================================================
;; Packages
;; ==================================================

;; (load-file "~/.emacs.d/linux/packages.el")

;; ==================================================
;; line wrapping
;; ==================================================

(when (equal *emacs-context* "aqua")
  (aquamacs-set-line-wrapping-in-text-modes))


;; ==================================================
;; init.el that loads a bunch of init-* package dependencies.
;; ==================================================

;; (load (concat *emacs-init-dir* "/" "init.el"))


;; ==================================================
;; COMMON version of init.el
;; ==================================================

;; (load (concat *emacs-init-dir* "/" "common" "/" "init.el"))


;; ==================================================
;; Mac OS Modifier keys
;; ==================================================

;; key bindings
;; (when (eq system-type 'darwin) ;; mac specific settings
;;   ;; (setq ns-alternate-modifier 'meta)   ;; Behavior of the 'alt/option' key
;;   (setq ns-command-modifier 'alt)
;;   ;; (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
;;   )

;; (print "END   linux/init.el")
