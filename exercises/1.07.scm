;; The good-enough? test used in computing square roots will not be very effective
;; for finding the square roots of very small numbers. Also, in real computers,
;; arithmetic operations are almost always performed with limited precision. This
;; makes our test inadequate for very large numbers. Explain these statements, with
;; examples showing how the test fails for small and large numbers. An alternative
;; strategy for implementing good-enough? is to watch how guess changes from one
;; iteration to the next and to stop when the change is a very small fraction of
;; the guess. Design a square-root procedure that uses this kind of end test.
;; Does this work better for small and large numbers?

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

(define (sqrt-absolute x)
  (define (good-enough? guess)
    (begin
      (print guess)
      (< (abs (- (square guess) x)) 0.001)))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
                                        ; Small numbers
;;
;; When x - (guess * guess) is less than 0.001 the iteration
;; will stop to early, the solution is not correct and there is still
;; a large difference between the correct solution and the result.
;;
;; (- (sqrt-absolute 0.0003) 0.017320508075688773)
;; 1.0
;; 0.50015
;; 0.250374910026992
;; 0.125786556576763
;; 0.0640857745620867
;; 0.034383500326996
;;
;; The correct solution should have been 0.017320508075688773
;;
                                        ; Large numbers
;;
;; The machine is unable to represent very small differences between large numbers, the
;; algorithm will terminate, reaching a result, but the accuracy of the result may not be smaller
;; than 0.001 so the procedure will go into infinite recursion.

(define (sqrt-relative x)
  (define (good-enough? guess)
    (begin
      (print guess)
      (<= (abs (- (improve guess) guess)) (* guess 0.001))))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt-relative 0.0003)
(sqrt-relative 1234567898765432101010101010)

;; Useful links:
;;   - https://en.wikipedia.org/wiki/Floating_point
;;   - https://en.wikipedia.org/wiki/Methods_of_computing_square_roots
