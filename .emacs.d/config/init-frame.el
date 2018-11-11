(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq display-time-format "[CL: %H:%M]")
(display-time-mode t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(fboundp 'toggle-frame-fullscreen)
  ;; Command-Option-f to toggle fullscreen mode
  ;; Hint: Customize `ns-use-native-fullscreen'
(global-set-key (kbd "M-ƒ") 'toggle-frame-fullscreen)
(setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 70)))
(set-face-attribute 'default nil :height 110)
(set-face-attribute 'default t :font "Hack" )
(require 'ns-auto-titlebar)
(ns-auto-titlebar-mode t)
(load-theme 'solarized-dark t)

(require 'golden-ratio)
(golden-ratio-mode t)

(provide 'init-frame)
