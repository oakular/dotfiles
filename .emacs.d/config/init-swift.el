(require 'flycheck)
(add-hook 'swift-mode-hook 'flycheck-mode)
(require 'flycheck-xcode)
(flycheck-xcode-setup)
(add-hook 'swift-mode-hook 'flycheck-xcode)
(eval-after-load 'flycheck '(flycheck-swift-setup))
(require 'company-sourcekit)
(add-to-list 'company-backends 'company-sourcekit)

(provide 'init-swift)
