(ns samurai.contact.events
  (:require
   [re-frame.core :as rf]
   [samurai.contact.db :as db]))

(rf/reg-event-db
 ::init
 (fn [db _]
   (merge db db/default-db)))

(rf/reg-event-db
 ::on-change-form
 (fn [db  [_ field-name value]]
   (assoc-in db [::db/form field-name] value)))

(rf/reg-event-fx
 ::send
 (fn [cofx _]
   (print (get-in (:db cofx) [::db/form]))
   {}))
