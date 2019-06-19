(require 'engine-mode)
(engine-mode t)
(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")
(defengine goodreads
  "https://www.goodreads.com/search?q=%s"
  :keybinding "gr")
(defengine wikipedia
  "https://en.wikipedia.org/w/index.php?search=%s"
  :keybinding "w"
  :browser 'eww-browse-url)
(defengine libgen
  "http://gen.lib.rus.ec/search.php?req=%s&lg_topic=libgen&open=0&view=simple&res=25&phrase=1&column=def"
  :keybinding "libg")
(defengine osm
  "https://www.openstreetmap.org/search?query=%s"
  :keybinding "m")
(defengine def
  "www.oed.com/search?searchType=dictionary&q=%s"
  :keybinding "oed")

(provide 'init-engine)
