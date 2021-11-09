(require :drakma)
(require :cl-json)
(require :access)
(require :str)

(defpackage :cuis-github
  (:use :cl :access))

(in-package :cuis-github)

(defun fetch-github (url)
  (destructuring-bind (stream &rest args)
      (multiple-value-list
       (drakma:http-request url
                            :want-stream t
                            :preserve-uri t))
    (values-list
     (list* (json:decode-json-from-source stream)
            args))))

(defun fetch-next (headers)
  (let ((link (find :link headers :key 'car)))
    (ppcre:do-register-groups (next) ("\\<(.+)\\>; rel=\"next\"" link)
      (fetch-github next))))

;; (fetch-github "https://api.github.com/search/repositories?q=Cuis+language:Smalltalk")

(defun fetch-all (url)
  (let ((all-results)
        (next url))
    (loop while next
          do
             (print next)
             (multiple-value-bind (results status headers)
                 (fetch-github next)
               (setf next nil)
               (sleep 3)
               (setf all-results (append all-results (cdr (assoc :items results))))
               (let ((link (find :link headers :key 'car)))
                 (ppcre:do-register-groups (next-url) ("<(https://[^/]+/[^<>]+)>; rel=\"next\"" (cdr link))
                   (setf next next-url)))))
    all-results))

;; (fetch-all "https://api.github.com/search/repositories?q=Cuis+language:Smalltalk")

(defun extract-cuis-repos (filespec)
  (with-open-file (f filespec :direction :output :external-format :utf8
                              :if-exists :supersede
                              :if-does-not-exist :create)
    (loop for repo in (fetch-all "https://api.github.com/search/repositories?q=Cuis+language:Smalltalk")
          do
	     (let ((repo-name (if (str:starts-with-p "Cuis-Smalltalk-" (access repo :name))
				  (subseq (access repo :name)
					  (length "Cuis-Smalltalk-"))
				  (access repo :name))))
               (format f "- name: ~a~%" repo-name)
		     
               (format f "  description: ~a~%" (or (access repo :description) repo-name))
               (format f "  url: ~a~%" (access repo :html--url))
               (when (access repo :license)
		 (format f "  license: ~a~%" (accesses repo :license :SPDX--ID)))
               (format f "  tags: [~{~a~^, ~}]~%" (access repo :topics))
               (terpri f)
               ))))

;; (extract-cuis-repos #p"/home/marian/src/Cuis-Website/_data/github.yaml")
