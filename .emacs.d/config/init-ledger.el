(require 'ledger-mode)

(setq ledger-post-amount-alignment-column 60)
(setq ledger-highlight-xact-under-point nil)
(setq ledger-report-use-header-line 1)
(setq ledger-report-use-native-highlighting nil)

(setq ledger-accounts-file "~/Documents/personal/finance/ledger/accounts.ledger")
(setq ledger-master-file "~/Documents/personal/finance/ledger/journal.ledger")

(define-key ledger-mode-map  (kbd "C-c C-b") 'ledger-mode-clean-buffer)

(setq ledger-reports
      (quote
       (("income" "ledger [[ledger-mode-flags]] -f /Users/callum/Documents/personal/finance/ledger/journal.ledger bal income and not parents:rent -b 2018/07/29 --invert")
        ("assets" "ledger [[ledger-mode-flags]] -f /Users/callum/Documents/personal/finance/ledger/journal.ledger bal assets")
        ("expenses" "ledger [[ledger-mode-flags]] -f /Users/callum/Documents/personal/finance/ledger/journal.ledger bal expenses -b 2018/07/29")
        ("BAL" "ledger ")
        ("report" "ledger ")
        ("bal" "%(binary) -f %(ledger-file) bal")
        ("reg" "%(binary) -f %(ledger-file) reg")
        ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
        ("account" "%(binary) -f %(ledger-file) reg %(account)"))))

(provide 'init-ledger)
