(setq compilation-window-height 10)
(setq compilation-scroll-output t)

(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

(require 'corral)
(global-set-key (kbd "C-c b 9") 'corral-parentheses-backward)
(global-set-key (kbd "C-c b 0") 'corral-parentheses-forward)
(global-set-key (kbd "C-c b [") 'corral-brackets-backward)
(global-set-key (kbd "C-c b ]") 'corral-brackets-forward)
(global-set-key (kbd "C-c b {") 'corral-braces-backward)
(global-set-key (kbd "C-c b }") 'corral-braces-forward)
(global-set-key (kbd "C-c b \"") 'corral-double-quotes-backward)

(provide 'init-sdev)
