(ns samurai.contact.subs
  (:require
   [clojure.string :refer [blank?]]
   [samurai.contact.db :as db]
   [re-frame.core :as re-frame]))

(re-frame/reg-sub
 ::form
 (fn [{:keys [::db/form]}]
   form))

(defn validate-email [email]
  (re-matches #".+\@.+\..+" email))

(re-frame/reg-sub
 ::disabled
 (fn [{:keys [::db/form]}]
   (or
    (blank? (:email form))
    (not (validate-email (:email form)))
    (blank? (:comment form)))))


