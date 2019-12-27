
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(setq ruby-insert-encoding-magic-comment nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0f14" "#781f36" "#26a98b" "#edb54b" "#228dac" "#4e5165" "#33859d" "#98d1ce"])
 '(custom-safe-themes
   (quote
    ("a185f85b239e0f6a5e325d701f37359b5da744b42faacc4f2c66d73bd9011128" "ee0afc03c263ba0eda6444765329f2a2376487e902f7af52ce09338ae4e3a0d8" "7c9e494a749abddfb6a59e9195e3f05af447da9fd8045e24d2b417261d972158" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(markdown-command
   "pandoc --highlight-style=haddock --self-contained --css=/home/armin/.local/share/markdown-css/tufte.css")
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (sokoban material-theme pkgbuild-mode lsp-ui lsp-haskell lsp-mode zenburn-theme flycheck haskell-mode flymd markdown-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(global-flycheck-mode)

(customize-set-variable 'menu-bar-mode nil)
(customize-set-variable 'tool-bar-mode nil)

(require 'lsp)
(require 'lsp-haskell)
(require 'lsp-ui)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)



(set-face-attribute 'default nil :height 125)


(set-frame-parameter (selected-frame) 'alpha '(93 . 93))

(load-theme 'mytheme)
