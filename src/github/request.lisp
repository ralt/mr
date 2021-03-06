(in-package #:mr.github)


(defvar *github-api-endpoint* "https://api.github.com")
(defvar *github-accept-header* "application/vnd.github.v3+json")

(defun request (path access-token)
  (j:parse
   (f:octets-to-string
    (d:http-request
     (concatenate 'string *github-api-endpoint* path)
     :accept *github-accept-header*
     :additional-headers (list
                          (list*
                           "Authorization"
                           (concatenate 'string "token " access-token)))))))
