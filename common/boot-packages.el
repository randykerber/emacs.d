;;;; emacs.d / common / boot-packages.el              -*- mode: emacs-lisp -*-

(setq debug-on-error t)

;; (print "begin ~/gh/randykerber/emacs.d/common/boot-packages.el")

;; (setq user-emacs-directory (concat *emacs-context-dir* "/"))

(require 'package)
(setq package-enable-at-startup nil)

(defun aqua-init-package-archives ()
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
;;;  (add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
;;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;;; deprecated for Org versions >= 9.5: see https://orgmode.org/elpa.html
  )

(defun common-init-package-archives ()
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
;;;  (add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
;;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;;; deprecated for Org versions >= 9.5: see https://orgmode.org/elpa.html
  )

(if (is-aqua) (aqua-init-package-archives)
              (common-init-package-archives))

;; (setq package-archives (if (is-aqua)
;;                            '(
;;                              ("melpa-stable" . "http://stable.melpa.org/packages/")
;;                              ;; ("melpa"        . "https://melpa.org/packages/")
;;                              ("melpa"        . "http://melpa.org/packages/")
;;                              ("gnu"          . "http://elpa.gnu.org/packages/"))
;;                          '(
;;                            ("melpa-stable" . "http://stable.melpa.org/packages/")
;;                            ("org"          . "http://orgmode.org/elpa/")
;;                            ;; ("melpa"        . "https://melpa.org/packages/")
;;                            ("melpa"        . "http://melpa.org/packages/")
;;                            ("gnu"          . "http://elpa.gnu.org/packages/"))
;;                          ))

;; (setq package-archive-priorities
;;       (if (is-aqua)
;;           '(("melpa-stable" . 20)
;;             ("elpa" . 10)
;;             ("melpa" . 0)
;;             )
;;         '(("melpa-stable" . 20)
;;           ("org" . 30)
;;           ("elpa" . 10)
;;           ("melpa" . 0)
;;           )
;;         ))

(package-initialize)

;;;;================================================================
;;;; use-package install
;;;;================================================================

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;;;;================================================================
;;;; paradox
;;;;================================================================

;;(use-package paradox
;;   :demand t
;;   :config
;;   (paradox-enable)
;;   )
;; (require 'paradox)
;; (paradox-enable)

;;;;================================================================

;;(print "END ~/gh/randykerber/emacs.d/common/boot-packages.el")
