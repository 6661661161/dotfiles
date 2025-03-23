(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (use-package leaf :ensure t)

  (leaf leaf-keywords
    :ensure t
    :init
    (leaf blackout :ensure t)
    :config
    (leaf-keywords-init)))

(leaf leaf-convert
  :doc "Convert many format to leaf format"
  :ensure t)

(leaf cus-edit
  :doc "tools for customizing Emacs and Lisp packages"
  :custom `((custom-file . ,(locate-user-emacs-file "custom.el"))))

;(leaf cus-start
;  :doc "define customization properties of builtins"
;  :tag "builtin" "internal"
;  :custom ((tab-width . 4)
;           (truncate-lines . t)
;           (menu-bar-mode . t)
;           (tool-bar-mode . nil)
;           (scroll-bar-mode . nil)
;           (indent-tabs-mode . nil)))

(leaf *theme
  :config
  (load-theme 'deeper-blue t)
  (enable-theme 'deeper-blue))

(leaf autorevert
  :doc "revert buffers when files on disk change"
  :global-minor-mode global-auto-revert-mode)

(leaf paren
  :doc "highlight matching paren"
  :global-minor-mode show-paren-mode)

(leaf evil
  :ensure t
  :config
  (evil-mode 1)
  (leaf undo-tree
    :ensure t
    :custom
    ((evil-set-undo-system . 'undo-tree))
    :config
    (global-undo-tree-mode t))
  (leaf goto-chg
    :ensure t))

(leaf nerd-icons
  :ensure t
  :custom
  ((nerd-icons-font-family . "Symbols Nerd Font Mono")))

(leaf treemacs
  :ensure t
  :config
  (leaf treemacs-evil :ensure t)
  (leaf treemacs-nerd-icons
    :ensure t
    :after nerd-icons treemacs
    :require t
    :config
    (treemacs-load-theme "nerd-icons")
    ;:mode-hook
    ;(treemacs-mode-hook . ((treemacs-load-theme "nerd-icons")))
  )
)

(leaf markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :custom
  ((markdown-fontify-code-blocks-natively . t)))
