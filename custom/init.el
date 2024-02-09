(require 'package)


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(setq visible-bell t)
(setq inhibit-startup-message t)

(package-initialize)
(package-refresh-contents)

(when (not (package-installed-p 'use-package))
    (package-install 'use-package))

(unless (package-installed-p 'no-littering)
  (package-refresh-contents)
  (package-install 'no-littering))
(use-package no-littering)

(load-file "~/.emacs.d/custom/ediff/init.el")
(load-file "~/.emacs.d/custom/project/init.el")
(load-file "~/.emacs.d/custom/lsp/init.el")
(load-file "~/.emacs.d/custom/cider/init.el")
(load-file "~/.emacs.d/custom/evil/init.el")
(load-file "~/.emacs.d/custom/tools/iniit.el")
(load-file "~/.emacs.d/custom/plugins/init.el")
(load-file (concat "~/.emacs.d/" (getenv "USER")  ".el"))


;; Refresh all files when they are changed form outside
(global-auto-revert-mode 1)


(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(load-theme 'modus-vivendi t)


(put 'erase-buffer 'disabled nil)

;; Set global font size
(set-face-attribute 'default nil :height 100)

(message "Done initializing")
