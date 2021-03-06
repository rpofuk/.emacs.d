;eq; Set up package.el to work with MELPA
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(defvar my-packages
  '(spacemacs-theme
    paredit
    use-package))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(load-file "~/.emacs.d/custom/ediff/init.el")
(load-file "~/.emacs.d/custom/project/init.el")
(load-file "~/.emacs.d/custom/cider/init.el")
(load-file "~/.emacs.d/custom/evil/init.el")
(load-file "~/.emacs.d/custom/lsp/init.el")
(load-file "~/.emacs.d/custom/tools/iniit.el")
(load-file "~/.emacs.d/rpofuk.el")

;; Refresh all files when they are changed form outside
(global-auto-revert-mode 1)

(load-theme 'spacemacs-dark t)

;; We enable paredit 
(add-hook 'clojure-mode-hook #'enable-paredit-mode)

(put 'erase-buffer 'disabled nil)

;; Set global font size
(set-face-attribute 'default nil :height 100)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-collection company flycheck lsp-java which-key lsp-ui cider lsp-mode clojure-mode project-tab-groups ivy treemacs-tab-bar treemacs-magit treemacs-evil treemacs winum use-package paredit spacemacs-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
