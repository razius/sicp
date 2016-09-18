;; Newton's method for cube roots is based on the fact that
;; if y is an approximation to the cube root of x, then a better
;; approximation is given by the value

;; (x / (y^2) + (2 * y)) / 3

;; Use this formula to implement a cube-root procedure analogous
;; to the square root procedure.

(define (cube-root x)
  (define (good-enough? guess)
    (<= (abs (- (improve guess) guess)) (* guess 0.001)))
  (define (improve guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (define (cube-root-iter guess)
    (if (good-enough? guess)
        guess
        (cube-root-iter (improve guess))))
  (cube-root-iter 1.0))

(cube-root 9)
