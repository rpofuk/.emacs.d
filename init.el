;eq; Set up package.el to work with MELPA
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(defvar my-packages
  '(evil
    spacemacs-theme
    paredit
    use-package
    evil-collection))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Enable evil mode
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)

(when (require 'evil-collection nil t)
  (evil-collection-init))

(evil-mode 1)

;; Refresh all files when they are changed form outside
(global-auto-revert-mode 1)

(load-theme 'spacemacs-dark t)

(load-file "~/.emacs.d/custom/cider/init.el")
(load-file "~/.emacs.d/custom/ediff/init.el")
(load-file "~/.emacs.d/custom/project/init.el")

;; Kill this buffer is usefull to avoid propmt (usually bound to C-x k)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; We enable paredit 
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)

;; Lets zoom out a bit :)
(setq text-scale-mode-amount -2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages '(company spacemacs-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
