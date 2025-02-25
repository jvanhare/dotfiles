;; Maximize the frame.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Do not show the splash screen.
(setq inhibit-startup-message t)

;; Flash when the bell rings
(setq visible-bell t)

;; Keep backups in a separate directory.
(setq backup-directory-alist '(("." . "~/.emacs_backups")))

;; Remove unneeded UI elements.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Show line numbers.
(global-display-line-numbers-mode 1)

;; Set Fira fonts.
(set-face-attribute 'default nil :font "Fira Code Retina" :height 140)

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(require 'use-package)
(setq use-package-always-ensure t)



;; Load theme.
(use-package dracula-theme
  :ensure t)
(load-theme 'dracula)

;; Remenber recently edited files
(recentf-mode 1)

;; Save what you enter into minibuffer prompts
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

;; Enable projectile.
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

(use-package projectile
  :ensure t
  :init
  (when (file-directory-p "~/Desktop/wkdir/src")
    (setq projectile-project-search-path '("~/Desktop/wkdir/src")))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1))

(with-eval-after-load 'projectile
  (add-to-list 'projectile-other-file-alist '("hxx" "cpp" "hpp"))
  (add-to-list 'projectile-other-file-alist '("hpp" "cpp" "hxx"))
  (add-to-list 'projectile-other-file-alist '("cpp" "hpp" "hxx")))

(setq lsp-keymap-prefix "C-c l")

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(use-package lsp-ui)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(global-set-key (kbd "C-c f") 'clang-format-buffer)
(setenv "PATH" (concat "/usr/bin:" (getenv "PATH")))

(require 'dired-sidebar)
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("11819dd7a24f40a766c0b632d11f60aaf520cf96bd6d8f35bae3399880937970"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
