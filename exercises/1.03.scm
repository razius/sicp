; Define a procedure that takes three numbers as arguments and returns
; the sum of the square of the two largest numbers

(define (f a b c)
  (define (square x) (* x x))
  (define (sum-of-square x y) (+ (square x) (square y)))
  (cond ((and (< c a) (< c b)) (sum-of-square a b))
        ((and (< b a) (< b c)) (sum-of-square a c))
        (else (sum-of-square b c))))

(f 1 2 3)
