;;;; emacs.d / common / boot-packages.el              -*- mode: emacs-lisp -*-

(setq debug-on-error t)

;; (print "begin ~/gh/randykerber/emacs.d/common/boot-packages.el")

;; (setq user-emacs-directory (concat *emacs-context-dir* "/"))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org"         . "http://orgmode.org/elpa/")
                         ;; ("melpa" . "https://melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; From end of: https://github.com/jwiegley/use-package
(require 'diminish) ;; if you use :diminish
(require 'bind-key) ;; if you use any :bind variant

(setq use-package-always-ensure t)
(setq use-package-always-defer t)
