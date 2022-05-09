;; Cider overrides

(require 'package)

(defvar cider-packages
  '(cider
    company))

(dolist (p cider-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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



;; Show tests on success as well because it is very anoying when you kill report buffer and it does not pop up
(setq cider-test-show-report-on-success t)

;; Reuse error window so it does not popup on random location
(add-to-list 'same-window-buffer-names "*cider-error*")



