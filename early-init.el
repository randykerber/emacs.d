;;; early-init.el --- Emacs 27+ pre-initialisation config

;;; Commentary:

;; Emacs 27+ loads this file before (normally) calling
;; `package-initialize'.  We use this file to suppress that automatic
;; behaviour so that startup is consistent across Emacs versions.

;;; Code:

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
