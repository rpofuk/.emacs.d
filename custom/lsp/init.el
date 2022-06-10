(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil
		lsp-enable-snippet nil))

(use-package lsp-ui)

(use-package which-key 
  :config (which-key-mode))
