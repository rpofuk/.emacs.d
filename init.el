(load-file "~/.emacs.d/custom/init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(csv-mode evil-collection paredit company flycheck lsp-treemacs lsp-ui cider lsp-mode clojure-mode which-key tabspaces counsel swiper ivy treemacs-tab-bar treemacs-magit treemacs-evil treemacs winum))
 '(safe-local-variable-values
   '((eval let
	   ((personal-env "~/.emacs.d/environment.el"))
	   (when
	       (file-exists-p personal-env)
	     (load-file personal-env))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
