(ns samurai.contact.core
  (:require [samurai.contact.views :as views]
            [samurai.contact.events :as events]))

(defn main
  [_ctx]
  {:init ::events/init
   :panel views/main-panel})
