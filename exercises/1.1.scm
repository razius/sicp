; What is the result printed by the interpreter
; in response to each expression?

10
; 10

(+ 5 3 4)
(print (eq? (+ 5 3 4) 12))

(- 9 1)
(print (eq? (- 9 1) 8))

(/ 6 2)
(print (eq? (/ 6 2) 3))

(+ (* 2 4) (- 4 6))
(print (eq? (+ (* 2 4) (- 4 6)) 6))

(define a 3)
(define b (+ a 1))

(print (eq? (+ a b (* a b)) 19))

(print (eq? (= a b) #f))

(print (eq? (if (and (> b a) (< b (* a b))) b a) 4))

(print (eq? (cond ((= a 4) 6)
                  ((= b 4) (+ 6 7 a))
                  (else 25))
            16))

(print (eq? (+ 2 (if (> b a) b a)) 6))

(print (eq? (* (cond ((> a b) a)
                     ((< a b) b)
                     (else -1))
               (+ a 1))
            16))
