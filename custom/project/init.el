;; Configure project browsing 


(use-package winum
  :ensure t
  :config
   (define-key winum-keymap (kbd "M-0") 'winum-select-window-0)
   (define-key winum-keymap (kbd "M-1") 'winum-select-window-1)
   (define-key winum-keymap (kbd "M-2") 'winum-select-window-2)
   (define-key winum-keymap (kbd "M-3") 'winum-select-window-3)
   (define-key winum-keymap (kbd "M-4") 'winum-select-window-4)
   (define-key winum-keymap (kbd "M-5") 'winum-select-window-5)
   (define-key winum-keymap (kbd "M-6") 'winum-select-window-6)
   (define-key winum-keymap (kbd "M-7") 'winum-select-window-7)
   (define-key winum-keymap (kbd "M-8") 'toogle-select-window)
   (setq winum-ignored-buffers-regexp '("--")
	 winum-scope 'frame-local
	 winum-auto-assign-0-to-minibuffer t)
   (winum-mode))




(use-package treemacs
  :ensure t
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                5000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-project-follow-mode t)

    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-t"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)


(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)


(use-package treemacs-tab-bar  
  :after (treemacs)
  :bind
  (:map global-map
        ("C-x 5 3" . tab-bar-detach-tab))
  :ensure t
  :config 
  (treemacs-set-scope-type 'Tabs))



(use-package ivy 
  :ensure t
  :bind
  (:map global-map
        ("C-s" . 'swiper)
        ("C-c C-r" . 'ivy-resume)
        ("<f6>" . 'ivy-resume)) 
  :config 
   (ivy-mode)
   (setq ivy-use-virtual-buffers t
         ivy-count-format "(%d/%d) "
         ivy-use-virtual-buffers t))

(use-package swiper
  :after ivy
  :ensure t)

(use-package counsel 
  :after ivy
  :ensure t
  :bind 
  (:map global-map
        ("C-c j" . 'counsel-git-grep))
  :config 
  (counsel-mode))

(use-package tabspaces
  :ensure t
  :commands (tabspaces-switch-or-create-workspace
             tabspaces-open-or-create-project-and-workspace)
  :config
  (tabspaces-use-filtered-buffers-as-default t)
  (tabspaces-default-tab "Default")
  (tabspaces-remove-to-default t)
  (tabspaces-include-buffers '("*scratch*"))
  ;; sessions
  (tabspaces-session f)
  (tabspaces-session-auto-restore f)
  :after 
  (tabspaces-mode))
  
(with-eval-after-load 'project
  (define-key project-prefix-map  "p" 'tabspaces-open-or-create-project-and-workspace))

(defun kill-project-and-close-tab ()
  "Kills the current project and closes the current tab."
  (interactive)
  (project-kill-buffers)
  (tab-close))

(with-eval-after-load 'project
  (define-key project-prefix-map  "k" 'kill-project-and-close-tab))
 
(use-package which-key
  :config 
  (which-key-mode)
  :ensure t)

