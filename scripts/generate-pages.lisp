(require :alexandria)
(require :cl-ppcre)
(require :cl-fad)

(defpackage :cuis-website
  (:use :cl))

(in-package :cuis-website)

(defvar +jekyll-site-path+)
(defvar +cuis-docs-path+)

(defun cuis-doc-files ()
  (loop for file in (fad:list-directory +cuis-docs-path+)
     when (equalp (pathname-type file) "md")
     collect file))

(defun extract-title-and-content (file)
  (with-open-file (f file)
    (values
     (extract-title (read-line f))
     (process-content
      (progn
        (when (member (peek-char nil f) '(#\- #\=))
          (read-line f))
        (alexandria:read-stream-content-into-string f))))))

(defun process-content (s)
  (process-links s))

(defun extract-title (str)
  (string-trim '(#\space #\#) str))

(defun process-links (content)
  (ppcre:regex-replace-all "\.md" content ""))

(defun jekyll-template (file)
  (multiple-value-bind (title content)
      (extract-title-and-content file)
    (format nil
            "---~%
layout: default~%
title: ~a~%
permalink: /~a
---

<div style=\"padding: 20px;\"></div>
<div class=\"windowbar\"><img src=\"{{'buttons.png' | relative_url}}\">&nbsp;&nbsp;~a</div>
<div class=\"window-content\">

{% capture markdown %}{% include_relative Documentation/~a %}{% endcapture %}
{% assign html = markdown | markdownify %}

<div id=\"table-of-contents\" class=\"toc\" style=\"float: right;\">
{% include toc.html html=html h_min=2 h_max=2 %}
</div>

{{ html }}
</div>"
            title        ;; title
            (pathname-name file) ;; link
            title                ;; window title
            (file-namestring file) ;; include
            )))

(defun write-jekyll-page-file (file)
  (let ((path (merge-pathnames (make-pathname :name (pathname-name file)
                                              :type "html")
                               +jekyll-site-path+)))
    (alexandria:write-string-into-file (jekyll-template file)
                                       path
                                       :if-exists :supersede
                                       :if-does-not-exist :create)))

(defun write-md-file (file)
  (let ((path (merge-pathnames (file-namestring file)
                               (merge-pathnames "Documentation/"
                                                +jekyll-site-path+))))
    (multiple-value-bind (title content)
        (extract-title-and-content file)
      (alexandria:write-string-into-file content path
                                         :if-exists :supersede
                                         :if-does-not-exist :create))))

(defun generate-index-page ()
  (let ((index
         (with-output-to-string (s)
           (format s  "## Index of Cuis topics~%~%")
           (loop for file in (cuis-doc-files)
              do
                (multiple-value-bind (title content)
                    (extract-title-and-content file)
                  (format s "* [~a](~a)~%" title (pathname-name file)))))))
    (alexandria:write-string-into-file index
                                       (merge-pathnames "docsindex.md" +jekyll-site-path+)
                                       :if-exists :supersede
                                       :if-does-not-exist :create)))

(defun generate-pages ()
  (setf +jekyll-site-path+ (uiop/os:getcwd))
  (setf +cuis-docs-path+ (merge-pathnames #p"../Cuis-Smalltalk-Dev/Documentation/" (uiop/os:getcwd)))

  (format t "Jekyll site path: ~a~%" +jekyll-site-path+)
  (format t "Cuis docs path: ~a~%" +cuis-docs-path+)
  (format t "INFO: run this from jekyll root directory as scripts/generate-pages~%")

  (loop
     for file in (cuis-doc-files)
     do
       (format t "Generating page for: ~a~%" (file-namestring file))
       (write-md-file file)
       (write-jekyll-page-file file))
  (generate-index-page))
