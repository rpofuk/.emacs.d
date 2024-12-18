(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 (python-mode . lsp))	     
  :bind-keymap ("M-l" . lsp-command-map)
  :config (setq lsp-completion-enable-additional-text-edit nil
		lsp-enable-snippet nil))

(use-package lsp-ui   
  :commands lsp-ui-mode)

(use-package which-key 
  :config (which-key-mode))
