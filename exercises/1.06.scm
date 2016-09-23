;; Alyssa doesn't see why if needs to be provided as a special form
;; "Why can't I just define it as an ordinary procedure in terms of cons?" she asks.
;; She defined a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; Eva demonstrates the program to Alyssa:

(new-if (= 2 3) 0 5)
; 5
(new-if (= 1 1) 0 5)
; 0

;; Delighted Alyssa uses new-if to rewrite the square root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;; What happends when Alyssa attempts to use this to compute square roots?

;; if in Scheme is lazy evaluated (it first evaluates the predicate and then evaluates either the
;; consequent of the alternative ), the new-if procedure is not so it will go into
;; infinite recursion while trying to evaluate sqrt-iter (both of the consequent
;; expressions will be evaluated)
