;; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with
;; is using applicative-order evaluation or normal order-evaluation.
;; He defined the following two procedures:


(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Then he evaluates the expression:

(test 0 (p))

;; What behavior will Ben observe with an interpreter that uses applicative-order evaluation?

;; Applicative-order evaluation will first evaluate the operator and then the operands, when trying
;; to evaluate (p) it will go into infinite recursion because (p) is a self-referential procedure

;; What behaviour will he observe with an interpreter that uses normal-order evaluation?

;; Normal-order evaluation will first expand and will only evaluate the operands only when needed
;; by a primitive operation so (p) is never evaluated.

;; Q: Why doesn't go into an infinite recursion while trying to expand (p)?
;; A: Because if uses lazy evaluation?

(test 0 (p))
(if (= 0 0) 0 (p))
0
