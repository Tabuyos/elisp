(message "Hello Tabuyos")
"Hello Tabuyos"

(defun hello-world (name)
	"Say hello to user whose name is NAME."
	(message "Hello, %s" name))
hello-world

(hello-world "Tabuyos")
"Hello, Tabuyos"

(setq tabuyos "Tabuyos")
"Tabuyos"

(message tabuyos)
"Tabuyos"

(defvar tabuyos "This is tabuyos."
	"This is demo variable.")
tabuyos

(message tabuyos)
"Tabuyos"
;; the value don't change if existed and use defvar can be provide document string.


(defvar tabuyos-test "This is tabuyos."
	"This is demo variable.")
tabuyos-test

(message tabuyos-test)
"This is tabuyos."

(defun circle-area (radix)
	(let ((pi 3.1415926) (area))
		(setq area (* pi radix radix))
		(message "radix: %.2f -> area: %.2f" radix area)))
circle-area

(circle-area 2)
"radix: 2.00 -> area: 12.57"

(defun circle-area1 (radix)
	(let* ((pi 3.1415925) (area (* pi radix radix)))
		(message "radix: %.2f -> area: %.2f" radix area)))
circle-area1

(circle-area1 2)
"radix: 2.00 -> area: 12.57"

(funcall (lambda (name)
			 (message "Hello, %s!" name)) "Tabuyos")
"Hello, Tabuyos!"

(setq foo (lambda (name)
			  (message "Hello, %s!" name)))
(lambda (name) (message "Hello, %s!" name))

(funcall foo "tabuyos")
"Hello, tabuyos!"

(progn
	(setq foo 3)
	(message "Square of %d is %d" foo (* foo foo)))
"Square of 3 is 9"

(defun my-max (a b)
	(if (> a b)
		a
		b))
my-max

(my-max 3 4)
4

(my-max 4 2)
4

(defun fib (n)
	(cond ((= n 0) 0)
		((= n 1) 1)
		(t (+ (fib (- n 1)) (fib (- n 2))))))
fib

(fib 3)
2
(fib 4)
3
(fib 5)
5
(fib 6)
8
(fib 10)
55

(defun factorial (n)
	(let ((res 1))
		(while (> n 1)
			(setq res (* res n)
				n (- n 1)))
		res))
factorial
(factorial 10)
3628800

(defun hello-world (&optional name)
	(or name (setq name "Tabuyos"))
	(message "Hello, %s" name))
hello-world

(hello-world)
"Hello, Tabuyos"
(hello-world "Aaron Liew")
"Hello, Aaron Liew"

;; data type: primitive types
;; int float cons symbol string vector hash-table subr(cons if and etc.) byte-code function buffer

;; Starting with number.
#b101100
44

#o54
44

#x2c
44

#24r1k
44

#11r40
44

;; NaN(Not-a-Number)
(/ 0.0 0.0)
-0.0e+NaN

;; p->predicate
(integerp 1)
t

(integerp 1.)
t

(integerp 1.0)
nil

(floatp 1.0)
t

(numberp 1)
t

(numberp 1.0)
t

(zerop 1)
nil

(zerop 0)
t

(zerop 0.0)
t

(wholenump 1)
t

(wholenump -1)
nil

(setq foo (- (+ 1.0 1.0e-3) 1.0))
0.0009999999999998899

(setq bar 1.0e-3)
0.001

(= foo bar)
nil

(defvar fuzz-factor 1.0e-6)
fuzz-factor

(defun approx-equal (x y)
	(or (and (= x 0) (= y 0))
		(< (/ (abs (- x y)) (max (abs x) (abs y))) fuzz-factor)))
approx-equal

(approx-equal foo bar)
t

(abs 1.1)
1.1

(abs -1.1)
1.1

(max 2 4)
4

(abs (- 3.1 4.2))
1.1

(abs (- -3.1 4.2))
7.300000000000001

(abs (- 3.1 -4.2))
7.300000000000001

(abs (- -3.1 -4.2))
1.1

(= 1.0 1)
t

(eql 1.0 1)
nil

(/= 1.0 1)
nil

(/= 1 1)
nil

(float 2)
2.0

(truncate 2.1)
2

(truncate -1.4)
-1

(truncate 1.9)
1

(floor 1.2)
1

(ceiling 1.4)
2

(round 1.4)
1

(round 1.5)
2

(setq foo 10)
10

(setq foo (1+ foo))
11

(setq foo (1- foo))
10

(% 3 2)
1

(% 2 3)
2

(mod 3 2)
1

(mod 2 3)
2

(% 3.0 2.0)
;; error

(mod 3.0 2.0)
1.0

(mod 3.0 2)
1.0

;; so, %: first argument is integer. mod: first argument is integer or float.

(sqrt 4)
2.0

(log 100 10)
2.0

(log 1000 10)
3.0

(log 100)
4.605170185988092

(logb 4)
2

(random 10)
0
(random 10)
5
(random 10)
7

most-positive-fixnum
2305843009213693951

most-negative-fixnum
-2305843009213693952




