(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 (python-mode . lsp))	     
  :config (setq lsp-completion-enable-additional-text-edit nil
		lsp-enable-snippet nil
	     	lsp-pylsp-plugins-autopep8-enabled t))

(use-package lsp-ui   
  :commands lsp-ui-mode)

(use-package which-key 
  :config (which-key-mode))
