(ns samurai.contact.views
  (:require [re-frame.core :as rf]
            [samurai.contact.subs :as subs]
            [samurai.contact.events :as events]

            [web.primitives.components :refer [RawGrid RawTextField RawButton RawTypography]]))

(defn main-panel
  [classes]
  (let [form @(rf/subscribe [::subs/form])]
    [RawGrid {:container true :spacing 2 :class-name (:container classes)}
     [RawGrid {:item true :xs 12}
      [RawTypography {:variant "h5"} "Contact"]]
     [RawGrid {:item true :xs 12}
      [RawTextField {:label         "Email"
                     :default-value (:email form)
                     :required      true
                     :on-change     #(rf/dispatch [::events/on-change-form :email %])}]]
     [RawGrid {:container true :item true :xs 12}
      [RawTextField {:default-value (:comment form)
                     :required      true
                     :multiline     true
                     :minRows       2
                     :placeholder   "Schreibe deine Frage"
                     :on-change     #(rf/dispatch [::events/on-change-form :comment %])}]]
     [RawGrid {:container true :item true :xs 12 :justify "flex-end"}
      [RawButton {:variant  "outlined"
                  :color    "secondary"
                  :disabled @(rf/subscribe [::subs/disabled])
                  :on-click #(rf/dispatch [::events/send])} "Send"]]]))







