(require 'eshell)

(setq eshell-buffer-name "esh")
(setq eshell-modify-global-environment t)
(setq eshell-prefer-lisp-functions t)
(setq eshell-rc-script "~/.eshell/profile")
(setq Man-notify-method 'bully)

(provide 'init-esh)
