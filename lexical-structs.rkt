#lang typed/racket/base

(provide (all-defined-out))

;;;;;;;;;;;;;;

;;  Lexical environments

;; A toplevel prefix contains a list of toplevel variables.
(define-struct: Prefix ([names : (Listof Symbol)])
  #:transparent)





(define-type CompileTimeEnvironmentEntry (U False  ;; placeholder for temporary space
                                            Symbol ;; lexically bound local identiifer
                                            Prefix ;; a prefix
                                            ))

;; A compile-time environment is a (listof (listof symbol)).
;; A lexical address is either a 2-tuple (depth pos), or 'not-found.
(define-type CompileTimeEnvironment (Listof CompileTimeEnvironmentEntry))

;; A lexical address is a reference to an value in the environment stack.
(define-type LexicalAddress (U LocalAddress PrefixAddress))
(define-struct: LocalAddress ([depth : Natural])
  #:transparent)
(define-struct: PrefixAddress ([depth : Natural]
                               [pos : Natural]
                               [name : Symbol])
  #:transparent)