;;; early-init.el --- Emacs 27+ pre-initialisation config  -*- lexical-binding: t; -*-

;;; Commentary:

;; Emacs 27+ loads this file before (normally) calling
;; `package-initialize'.  We use this file to suppress that automatic
;; behaviour so that startup is consistent across Emacs versions.

;;; Code:

;; macOS 27 fix (2026-11-08): the emacs-app bundle's libgccjit computes a bogus
;; deployment target ("18.0") from the Darwin version, and clang 21 rejects it,
;; so every native compilation fails. An explicit MACOSX_DEPLOYMENT_TARGET
;; overrides the broken computation. Derived from sw_vers so future macOS
;; upgrades don't need an edit. Remove when a fixed emacs-app build ships.
(when (eq system-type 'darwin)
  (setenv "MACOSX_DEPLOYMENT_TARGET"
          (string-trim (shell-command-to-string "sw_vers -productVersion"))))

(setq package-enable-at-startup nil)
;; package-load-list
;; package-user-dir

;; So we can detect this having been loaded
(provide 'early-init)

;;; early-init.el ends here

;; Customizations that take effect during Emacs startup earlier than the
;; normal init file is processed.  Such customizations can be put in the
;; early init file, ‘~/.config/emacs/early-init.el’ or
;; ‘~/.emacs.d/early-init.el’.  This file is loaded before the package
;; system and GUI is initialized, so in it you can customize variables that
;; affect frame appearance as well as the package initialization process,
;; such as ‘package-enable-at-startup’, ‘package-load-list’, and
;; ‘package-user-dir’.  Note that variables like ‘package-archives’ which
;; only affect the installation of new packages, and not the process of
;; making already-installed packages available, may be customized in the
;; regular init file.
