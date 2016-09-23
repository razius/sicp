; Observe that our model of evaluation allows for combinations
; whose operators are compound expressions. Use this observation
; to describe the behaviour of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; The operator is determined based on the value of the parameter b
