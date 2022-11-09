;; Cider overrides

(require 'package)

(defvar cider-packages
  '(clojure-mode 
    lsp-mode 
    cider 
    lsp-ui
    which-key 
    lsp-treemacs
    flycheck
    company))

(dolist (p cider-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; clojure-lsp 

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil
      lsp-auto-guess-root t)


(setq lsp-clojure-custom-server-command '("bash" "-c" "/usr/local/bin/clojure-lsp"))

(lsp-ensure-server 'clojure-lsp)



(require 'cider)

;; This is to enable code completition popup
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

;; This will trigger that tab is trigerint auto complete 
(setq tab-always-indent 'complete)

(add-hook 'cider-repl-mode #'evil-normalize-keymaps)


(define-key cider-test-report-mode-map (kbd "C-c C-t C-j")
                         'cider-test-jump)

(define-key cider-test-report-mode-map (kbd "C-c C-t C-d")
                         'cider-test-ediff)

(define-key cider-test-report-mode-map (kbd "C-c C-t C-e")
                         'cider-test-stacktrace)

(define-key clojure-mode-map (kbd "C-c f")
                         'cider-format-defun)

(define-key clojure-mode-map (kbd "C-c r")
                         'cider-format-region)

(define-key clojure-mode-map (kbd "C-c b")
                         'cider-format-buffer)

(declare-function cider-undef-and-load-buffer "cider-eval")

;; Load also test namespace
(setq cider-clojure-cli-aliases ":test")


;; Prompt or save was very annoying (InteliJ autosaves all the time so I think this is sweet middle)
(setq cider-save-file-on-load t)

;; Show tests on success as well because it is very anoying when you kill report buffer and it does not pop up
(setq cider-test-show-report-on-success t)

(defun something-fixed (&optional ARG PRED)  
  (cider-find-and-clear-repl-output))

(advice-add 'cider-test-rerun-failed-tests :before #'something-fixed)
(advice-add 'cider-test-run-ns-tests :before #'something-fixed)
(advice-add 'cider-test-run-test :before #'something-fixed)


;; Reuse error window so it does not popup on random location
(add-to-list 'same-window-buffer-names "*cider-error*")


