(require 'flycheck)

(setq flycheck-check-syntax-automatically '(save idle-change mode-enable))
(setq flycheck-idle-change-delay 4)

(provide 'init-flycheck)
