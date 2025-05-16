(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 (python-mode . lsp))	     
  :bind-keymap ("M-l" . lsp-command-map)
  :config 
  (setq lsp-completion-enable-additional-text-edit nil
		lsp-enable-snippet nil)
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t))))
  

(use-package lsp-ui   
  :commands lsp-ui-mode)

(use-package which-key 
  :config (which-key-mode))
