(in-package :mu-cl-resources)
(defparameter *cache-model-properties-p* t)
(defparameter *cache-count-queries* t)
(defparameter *supply-cache-headers-p* t
  "when non-nil, cache headers are supplied.  this works together with mu-cache.")

(define-resource email ()
  :class (s-prefix "nmo:Email")
  :properties `((:message-id :string ,(s-prefix "nmo:messageId"));; e-mail protocol-specific id: https://tools.ietf.org/html/rfc2822#section-3.6.4
                (:from :uri ,(s-prefix "nmo:messageFrom"))
                (:to :uri ,(s-prefix "nmo:emailTo"))
                (:cc :uri ,(s-prefix "nmo:emailCc"))
                (:bcc :uri ,(s-prefix "nmo:emailBcc"))
                (:subject :string ,(s-prefix "nmo:messageSubject"))
                (:content :string ,(s-prefix "nmo:plainTextMessageContent"))
                (:html-content :string ,(s-prefix "nmo:htmlMessageContent"))
                (:is-read :boolean ,(s-prefix "nmo:isRead"))
                (:content-mime-type :string ,(s-prefix "nmo:contentMimeType"))
                (:received-date :datetime ,(s-prefix "nmo:receivedDate"))
                (:sent-date :datetime ,(s-prefix "nmo:sentDate")))
  :resource-base (s-url "http://example.com/id/emails/")
  :features '(include-uri)
  :on-path "emails")
  