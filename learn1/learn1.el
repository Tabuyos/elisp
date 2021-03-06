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

(setq foo "abc\000abc")
"abc abc"

?A
65
?a
97

?\+
43
?+
43

?\a
7

?\C-g
7
?\^g
7

(logior (lsh 1 27) ?A)
134217793
?\M-a
134217825
?\M-A
134217793

?\C-a
1
?\C-A
1

?\M-
134217738
?\C-
67108874
?\M-\C-
201326602

?\S-
33554442
?\H-
16777226

(stringp 'a)
nil
(stringp ?a)
nil
(stringp foo)
t

(defun string-empty-p (str)
	(not (string< "" str)))
string-empty-p

(string< "" "1")
t
(string< "1" "")
nil
(string< "" "")
nil

(string-empty-p "")
t

(make-string 5 ?x)
"xxxxx"

(make-string 4 ?a)
"aaaa"

(string ?a ?b ?c)
"abc"

(substring "1234567890" 1 4)
"234"

(substring "1234567890" 5)
"67890"

(substring "1234567890" -3 -1)
"89"

(concat "ab" "cd" "e")
"abcde"

case-fold-search
t

(char-equal ?a ?c)
nil

(char-equal ?a ?a)
t

(char-equal ?a ?A)
t

(setq case-fold-search nil)
nil

(char-equal ?a ?A)
nil

(char-equal ?a ?a)
t

(setq case-fold-search t)
t

(string= "adfdsa" "fdsa")
nil

(string= "adb" "adb")
t

(string-equal "string" "string")
t

(string< "afds" "ad")
nil

(length "sfdsa")
5

(char-to-string ?a)
"a"

(string-to-char "fdsa")
102

?f
102

(number-to-string 123)
"123"

(string-to-number "1234")
1234

(defun number-to-bin-string (number)
	(require 'calculator)
	(let ((calculator-output-radix 'bin)
			 (calculator-radix-grouping-mode nil))
		(calculator-number-to-string number)))
number-to-bin-string

(number-to-bin-string 256)
"100000000"

(concat '(?a ?b ?c ?d ?e))
"abcde"
(concat [?a ?b ?c ?d ?e])
"abcde"
(vconcat "abcdef")
[97 98 99 100 101 102]
(append "abcd" "ef")
(97 98 99 100 . "ef")
(append "abcdef")
"abcdef"
(append "abcdef" nil)
(97 98 99 100 101 102)

(downcase "FDSA")
"fdsa"

(upcase "fdsa")
"FDSA"

(capitalize "tabuyos")
"Tabuyos"

(capitalize "Tabuyos")
"Tabuyos"

(capitalize "TABuYoS")
"Tabuyos"

(upcase-initials "this is test")
"This Is Test"

(string-match "34" "43254321532424345643")
14

(string-match "34" "43254321532424345643" 14)
14

(string-match "34" "43254321532424345643" 15)
nil

(regexp-quote "2*")
"2\\*"

(string-match (regexp-quote "2*") "232*3=696")
2

(progn
	(string-match "3\\(4\\)" "01234567890123456789")
	(match-data))
(3 5 4 5)

(let ((start 0))
	(while (string-match "34" "01234567890123456789" start)
		(princ (format "find at %d\n" (match-beginning 0)))
		(princ (format "end at %d\n" (match-end 0)))
		(setq start (match-end 0))))
find at 3
end at 5
find at 13
end at 15
nil

(let ((str "01234567890123456789"))
	(princ str)
	(princ "\n")
	(string-match "34" str)
	(princ (replace-match "x" nil nil str 0))
	(princ "\n")
	(princ str))
01234567890123456789
012x567890123456789
01234567890123456789"01234567890123456789"
;; the last line is by-product

(string-or-null-p "")
t
(string-or-null-p "abc")
t
(char-or-string-p "abc")
t
(char-or-string-p ?a)
t
(char-or-string-p "a")
t
;; the t is string

;; car: Contents of Address part of Register
;; cdr: Contents of Decrement part of Register
;; cons: construction

'(1 . 2)
(1 . 2)

'(1 . ?a)
(1 . 97)

'(1 . nil)
(1)

'(1 . "a")
(1 . "a")

'(nil . nil)
(nil)

;; ': eval-last-sexp
;; eval-last-sexp: 1. read previous S-expression, 2. calculator S-expression.
;; number and string(char) is special S-expression, call they self-evaluating-form
;; ' is special function -- quote, so '(1 . 2) => (quote (1 . 2))

(read "(1 . 2)")
(1 . 2)
;; read form equal output form

nil
nil

'()
nil

;; nil isn't cons cell, becuase have not car and cdr
;; in fact, nil is nothing in cons cell, but wo can think nil's car or cdr is nil for easy code

(car nil)
nil
(cdr nil)
nil

'( 1 2 3)
(1 2 3)
'(1 2 . 3)
(1 2 . 3)
'(1 . #1=(2 3 . #1#))
(1 2 3 . #1)
(cdr '(1 2 3))
(2 3)
(cdr '(1))
nil
(cdr '(1 (2 3)))
((2 3))
(cdr '((2 3)))
nil
(car '((2 3)))
(2 3)
(cdr '(1 . 2))
2
(cdr '(1 2 . 3))
(2 . 3)

'(1 . (2 . (3 . nil)))
(1 2 3)

(cdr '(1 . (2 . (3 . nil))))
(2 3)

(null nil)
t

(cons 1 2)
(1 . 2)

(cons 1 (cons 2 3))
(1 2 . 3)

(setq foo '(a b))
(a b)

(cons 'x foo)
(x a b)

foo
(a b)

(push 'x foo)
(x a b)

foo
(x a b)

(list 1 2 3 4 5 6 7)
(1 2 3 4 5 6 7)
(consp (list 1 2 3 4 5 6))
t

'((+ 1 2) 3)
((+ 1 2) 3)
(list (+ 1 2) 3)
(3 3)

(list ?a ?b ?c)
(97 98 99)
(list "a" "b" "c")
("a" "b" "c")
(list '(a b c))
((a b c))

(append '(a b) '(c))
(a b c)

(append '(car '(a b)) '(c))
(car (quote (a b)) c)

(append '(a b) 'c)
(a b . c)
(cdr '(a b . c))
(b . c)
(cdr '(b . c))
c

(cdr (cdr '(b c)))
nil

(cdr (cdr '(b . c)))
;; error

;; cons faster than append

(append [a b] "cd")
(a b . "cd")
(append [a b] "cd" nil)
(a b 99 100)

?c
99
?d
100

(append "abcd" nil)
(97 98 99 100)

(nth 3 '(0 1 2 3 4 5 6))
3
(nthcdr 2 '(0 1 2 3 4 5 6))
(2 3 4 5 6)
(nthcar 2 '(0 1 2 3 4 5 6))
;; error
(last '(0 1 2 3 4 5 6) 2)
(5 6)
(last '(7 (0 1 2 3 4 5 6)) 2)
(7 (0 1 2 3 4 5 6))
(butlast '(0 1 2 3 4 5 6) 2)
(0 1 2 3 4)

(defun my-subseq (str begin end)
	(cond
		((< (length str) end) (message "error!"))
		(t (nthcdr begin (butlast str (- (length str) end))))))
my-subseq

(my-subseq '(0 1 2 3 4 5 6 7 8 9) 2 5)
(2 3 4)

(my-subseq '(0 1 2 (3 4 5 6) 7 8 9) 2 5)
(2 (3 4 5 6) 7)

'(0 1 2 (3 4 5 6) 7 8 9)
(0 1 2 (3 4 5 6) 7 8 9)
(length '(0 1 2 (3 4 5 6) 7 8 9))
7

(my-subseq '(0 1 2 3 4 5 6 7 8 9) 2 5)
(2 3 4)

(my-subseq '(0 1 2 3 4 5 6 7 8 9) 2 11)
"error!"

(my-subseq '(0 1 2 3 4 5 6 7 8 9) 3 1)
nil

(setq foo '(a b c))
(a b c)

(setcar foo 'x)
x

foo
(x b c)

(setcdr foo '(y z))
(y z)

foo
(x y z)

(setq foo '(a b c))
(a b c)

(setcdr foo foo)
(a . #0)

(setq foo '((a b) c))
((a b) c)

(setcdr foo foo)
((a b) . #0)

(setq foo '(1 2 3))
(1 2 3)

(setcar foo 'a)
a

(setcar (cdr foo) 'b)
b

(setcar (nthcdr 2 foo) 'c)
c

foo
(a b c)

(setq foo nil)
nil

(push 'b foo)
(b)

(push 'b foo)
(b b)

(push 'a foo)
(a b b)

(pop foo)
a

foo
(b b)

(setq foo '(a b c))
(a b c)

(reverse foo)
(c b a)

foo
(a b c)

(nreverse foo)
(c b a)

foo
(a)
;; so nreverse function is devastation!

(setq foo '(3 2 4 1 5))
(3 2 4 1 5)
(sort foo '<)
(1 2 3 4 5)

foo
(3 4 5)

(setq foo '(3 2 4 1 5))
(3 2 4 1 5)

(sort (copy-sequence foo) '<)
(1 2 3 4 5)

foo
(3 2 4 1 5)

(setq foo '(1 4 3 2 5))
(1 4 3 2 5)

(sort foo '<)
(1 2 3 4 5)

foo
(1 2 3 4 5)

(setq foo '(a b c))
(a b c)

(remq 'b foo)
(a c)

foo
(a b c)

(delq 'b foo)
(a c)

foo
(a c)

(delq 'a foo)
(c)

foo
(a c)

(eq 1 3)
nil
(eq 1 "1")
nil
(eq 1 1)
t

(assoc "a" '(("a" 97) ("b 98")))
("a" 97)
(assq 'a '((a . 97) (b . 98)))
(a . 97)

(cdr '(a b))
(b)
(cdr '(a . b))
b

(assoc-default "a" '(("a" 97) ("b" 98)))
(97)

(rassoc '(97) '(("a" 97) ("b" 98)))
("a" 97)
(rassq '97 '((a . 97) (b . 98)))
(a . 97)

(setq foo '(("a" . 97) ("b" . 98)))
(("a" . 97) ("b" . 98))

(if (setq bar (assoc "a" foo))
	(setcdr bar "this is a")
	(setq foo (cons '("a" . "this is a") foo)))
"this is a"

foo
(("a" . "this is a") ("b" . 98))

(setq foo (cons '("a" . 97)
			  (delq (assoc "a" foo) foo)))
(("a" . 97) ("b" . 98))

foo
(("a" . 97) ("b" . 98))

(mapc '1+ '(1 2 3))
(1 2 3)

(mapcar '1+ '(1 2 3))
(2 3 4)

(setq foo '(1 2 3))
(1 2 3)

(mapc '1+ foo)
(1 2 3)

foo
(1 2 3)

(mapcar '1+ foo)
(2 3 4)

foo
(1 2 3)

(dolist (foo '(1 2 3))
	(incf foo))
nil

(setq bar nil)
nil

(dolist (foo '(1 2 3) bar)
	(push (incf foo) bar))
(4 3 2)

(defun my-remova-if (predicate list)
	(delq nil (mapcar (lambda (n)
						  (and (not (funcall predicate n)) n))
				  list)))
my-remova-if

(defun evenp (n)
	(= (% n 2) 0))
evenp

(my-remova-if 'evenp '(0 1 2 3 4 5))
(1 3 5)

(and t 1)
1
(and t nil)
nil
(and 1 t)
t
(and nil t)
nil
(and 1 0)
0
(and 0 1)
1

(delq nil '(1 2 3))
(1 2 3)

(mapcar (lambda (n)
			(and (not (funcall 'evenp n)) n)) '(1 2 3 4 5))
(1 nil 3 nil 5)

(evenp 2)
t
(evenp 1)
nil

(defun my-fold-left (op initial list)
	(dolist (var list initial)
		(setq initial (funcall op initial var))))
my-fold-left

(my-fold-left '+ 0 '(1 2 3 4 5))
15

(number-sequence 3 8 2)
(3 5 7)

(split-string "key = val" "\\s-*=\\s-*")
("key" "val")

(mapconcat 'identity '("a" "b" "c") "\t")
"a	b	c"
(identity "af")
"af"

(list 'a 'b 'c)
(a b c)

(defun my-nthcdr (n list)
	(if (or (null list) (= n 0))
		(car list)
		(my-nthcdr (1- n) (cdr list))))
my-nthcdr

(my-nthcdr 3 '(1 2 3 4 5 6))
4

(defun my-subseq (list from &optional to)
	(if (null to) (nthcdr from list)
		(butlast (nthcdr from list) (- (length list) to))))
my-subseq

;; list and array both of sequence
;; array: vector string char-table boolean-vector
;; array is self-evaluating and can't change length of it

(length '(1 2 3 4))
4

(safe-length '(a . b))
1

(safe-length '#1=(1 2 . #1#))
4
'#1=(1 2 . #1#)
(1 2 1 . #1)

(aref '[1 2 3 4] 3)
4

(setq foo (copy-sequence '(1 2 3 4 5)))
(1 2 3 4 5)

foo
(1 2 3 4 5)

(setq foo (copy-sequence '(1 2 3 4 . 5)))
;; error

(setq foo (copy-tree '(1 2 3 4 . 5)))
(1 2 3 4 . 5)

foo
(1 2 3 4 . 5)

(vector 'foo 23 [bar baz] "rats")
[foo 23 [bar baz] "rats"]

(setq foo '(a b))
(a b)

[foo]
[foo]

(vector foo)
[(a b)]

(make-vector 9 'z)
[z z z z z z z z z]

(fillarray (make-vector 3 'z) 5)
[5 5 5]

(fillarray '[1 2 3] 5)
[5 5 5]

(vconcat [1 2 3 4 5] "aa" '(foo (6 7)))
[1 2 3 4 5 97 97 foo (6 7)]

(append [1 2 3 4 5] [6 7])
(1 2 3 4 5 . [6 7])

(append [1 2 3] nil)
(1 2 3)

(defun circular-list-p (list)
	(and (consp list)
		(circular-list-p-l (cdr list) list 0)))
circular-list-p

(defun circular-list-p-l (tail halftail len)
	(if (eq tail halftail)
		t
		(if (consp tail)
			(circular-list-p-l (cdr tail)
				(if (= (% len 2) 0)
					(cdr halftail)
					halftail)
				(1+ len))
			nil)))
circular-list-p-l

(circular-list-p '#1=(1 2 . #1#))
t

(defun my-tr (str from to)
	(if (= (length to) 0)
		(progn
			(setq from (append from nil))
			(concat
				(delq nil
					(mapcar (lambda (c)
								(if (member c from)
									nil c))
						(append str nil)))))
		(let (table newstr pair)
			;; build convert table
			(dotimes (i (length from))
				(push (cons (aref from i) (aref to i)) table))
			(dotimes (i (length str))
				(push
					(if (setq pair (assoc (aref str i) table))
						(cdr pair)
						(aref str i))
					newstr))
			(concat (nreverse newstr) nil))))
my-tr

(let (a b c)
	(message"%s %s %s" a b c))
"nil nil nil"
(let ((a 0) (b 2) (c 5))
	(message"%s %s %s" a b c))
"0 2 5"

(symbolp '+1)
nil
(symbolp '\+1)
t

(setq foo (make-vector 10 0))
[0 0 0 0 0 0 0 0 0 0]

(intern-soft "abc" foo)
nil

(intern "abc" foo)
abc

(intern-soft "abc" foo)
abc

foo
[0 0 0 0 0 0 0 0 0 abc]

(intern-soft "abc")
nil

'abc
abc

(intern-soft "abc")
abc

(intern-soft "abcd")
nil

'#:abcd
abcd
;; don't intern to obarray

(intern-soft "abcd")
nil

(intern-soft "abc" foo)
abc

(unintern "abc" foo)
t

(intern-soft "abc" foo)
nil

(setq count 0)
0

(defun count-syms (s)
	(setq count (1+ count)))
count-syms

(mapatoms 'count-syms)
nil

count
43737

(length obarray)
15121

?\
-1

(set (intern "abc" foo) "I'm abc")
"I'm abc"

foo
[0 0 0 0 0 0 0 0 0 abc]

(symbol-value (intern "abc" foo))
"I'm abc"

;; (setq symbol value) = (set (quote symbol) value)
;; so, the q mean is quote in the setq

(intern "a" foo)
a

foo
[0 0 0 0 0 0 0 a 0 abc]

(boundp (intern "abc" foo))
t

(boundp 'abc)
nil

(boundp (intern 'abc foo))
;; error

(fset (intern "abc" foo) (symbol-function 'car))
#<subr car>

(funcall (intern "abc" foo) '(a b))
a

(put (intern "abc" foo) 'doc "this is abc")
"this is abc"

(get (intern "abc" foo) 'doc)
"this is abc"

(symbol-plist (intern "abc" foo))
(doc "this is abc")

(plist-get '(foo 4) 'foo)
4

(plist-get '(foo 4 bad) 'bar)
nil

(setq my-plist '(bar t foo 4))
(bar t foo 4)

(setq my-plist (plist-put my-plist 'foo 69))
(bar t foo 69)

(setq my-plist (plist-put my-plist 'quux '(a)))
(bar t foo 69 quux (a))

'("a" . ("b" . ("c" . nil)))
("a" "b" "c")

(defun hash-string (str)
	(let ((hash 0) c)
		(dotimes (i (length str))
			(setq c (aref str i))
			(if (> c #o140)
				(setq c (- c 40)))
			(setq hash (+ (setq hash (lsh hash 3))
						   (lsh hash -28)
						   c)))
		hash))
hash-string

(dotimes (i 4)
	(print i))
0

1

2

3
nil

(let ((len 10) str hash)
	(setq foo (make-vector len 0))
	(dotimes (i (1+ len))
		(setq str (char-to-string (+ ?a i))
			hash (% (hash-string str) len))
		(message "I put %s in slot %d" str hash)
		(if (eq (aref foo hash) 0)
			(intern str foo)
			(message "I found %S is already taking the slot: %S" (aref foo hash) foo)
			(intern str foo)
			(message "Now I'am in the slot too: %S" foo))))
nil

;; this has-string like that hash-string in the obarray just in algorithm

(defun remove-from-list (list-var key &optional test)
	(let ((prev (symbol-value list-var))
			 tail found value elt)
		(or test (setq test 'equal))
		(if (funcall test (caar prev) key)
			(set list-var (cdr prev))
			(setq tail (cdr prev))
			(while (and tail (not found))
				(setq elt (car tail))
				(if (funcall test (car elt) key)
					(progn
						(setq found t)
						(setcdr prev (cdr tail)))
					(setq tail (cdr tail)
						prev (cdr prev)))))
	(symbol0value list-var)))
remove-from-list

foo
[0 0 0 0 0 0 0 0 0 abc]

(intern "efg" foo)
efg

foo
[0 efg 0 0 0 0 0 0 0 abc]

(defun my-plist-get (plist prop)
	(cadr (memq plist prop)))
my-plist-get

(defun my-plist-put (plist pro val)
	(let ((tail (memq pro plist)))
		(if tail
			(setcar (cdr tail) cal)
			(setcdr (last plist) (list prop val))))
	plist)
my-plist-put

;; symbol consist of 1.name 2.value 3.function 4.property-list

(symbol-function 'car)
#<subr car>

(fset 'first 'car)
car

(fset 'erste 'first)
first

(erste '(1 2 3))
1

(defmacro cadr (x)
	(list 'car (list 'cdr x)))
cadr

(progn
	(setq foo "I'm global variable!")
	(let ((foo 5))
		(message "foo value is: %S" foo)
		(let (foo)
			(setq foo "I'm local variable!")
			(message foo))
		(message "foo value is still:%S" foo))
	(message foo))
"I’m global variable!"

max-specpdl-size
1300

(setq foo "I'm global variable!")
"I'm global variable!"

(make-local-variable 'foo)
foo

foo
"I'm global variable!"

(setq foo "I'm buffer-local variable!")
"I'm buffer-local variable!"

foo
"I'm buffer-local variable!"

(with-current-buffer "*Messages*" foo)
"I'm global variable!"

(default-value 'foo)
"I'm global variable!"

(local-variable-p 'foo)
t

(local-variable-p 'foo (get-buffer "*Messages*"))
nil

(with-current-buffer "*Messages*"
	(buffer-local-value 'foo (get-buffer "*Messages*")))
"I'm global variable!"

(defun foo (var1 var2 &optional opt1 opt2 &rest rest)
	(list var1 var2 opt1 opt2 rest))
foo

(foo 1 2)
(1 2 nil nil nil)

(defun foo (var1 var2 &optional opt1 opt2 &rest rest)
	"You should call the function like:
	\(fn v1 v2)"
	(list var1 var2 opt1 opt2 rest))
foo

(defmacro foo (arg)
	(list 'message "%d %d" arg arg))
foo

(defun bar (arg)
	(message "%d %d" arg arg))
bar

(foo 1)
"1 1"

(bar 2)
"2 2"

(let ((i 1))
	(bar (incf i)))
"2 2"
;; eval before

(let ((i 1))
	(foo (incf i)))
"2 3"
;; eval after

(macroexpand '(foo (incf i)))
(message "%d %d" (incf i) (incf i))

(macroexpand '(bar (incf i)))
(bar (incf i))

'(a list of ,(+ 2 3) elements)
(a list of (\, (+ 2 3)) elements)

`(a list of ,(+ 2 3) elements)
(a list of 5 elements)

(setq some-list '(2 3))
(2 3)

`(1 ,some-list 4 ,@some-list)
(1 (2 3) 4 2 3)

(defun hello-world (name)
	(interactive "sWhat you name?")
	(message "Hello, %s" name))
hello-world

(read-string "What you name? " user-full-name)
"tabuyos"

(defun read-hiden-file (file arg)
	(interactive
		(list (read-file-name "Choose a hiden file: " "~/" nil nil nil
				  (lambda (name)
					  (string-match "^\\." (file-name-nondirectory name))))
			current-prefix-arg))
	(message "%s, %S" file arg))
read-hiden-file

(defun foo ()
	(interactive)
	(message "%S" current-prefix-arg))
foo

;; error function
(defun approx-equal (x y &optional err)
	(if err
		(setq err (abs err))
		(setq err 1.0e-6))
	(or (and (= x 0) (= y 0))
		(< (/ (abs (- x y))
			   (max (abs x) (abs y)))
			err)))
approx-equal

(approx-equal 1 1.0)
t

(approx-equal 1 2)
t

(approx-equal 1 100)
t
(defun tree-mapcar (func tree)
	(if (consp tree)
		(mapcar (lambda (child)
					(tree-mapcar func child))
			tree)
		(funcall func tree)))
tree-mapcar

(defmacro with-inhibit-read-only-t (&rest body)
	(declare (indent 0) (debug t))
	(cons 'let (cons '((inhibit-read-only-t))
				   body)))
with-inhibit-read-only-t

(defvar switch-major-mode-history nil)
switch-major-mode-history

(defun switch-major-mode (mode)
	(interactive
		(list
			(intern
				(completing-read "Switch to mode: "
					obarray (lambda (s)
								(and (fboundp s)
									(string-match "-mode$" (symbol-name s))))
					t nil 'switch-major-mode-history))))
	(setq switch-major-mode-history
		(cons (symbol-name major-mode) switch-major-mode-history))
	(funcall mode))
switch-major-mode

(let ((str "abc]-^]123"))
	(string-match "[]^0-9-]+" str)
	(match-string 0 str))
"]-^]123"

(set-buffer "*Messages*")

(message (buffer-name))
"learn1.el"

(progn
	(set-buffer "*Messages*")
	(message (buffer-name)))

(let (buffer-read-only (obuf (current-buffer)))
	(set-buffer ...)
	...
	(set-buffer obuf))
;; error. becuase set-buffer function can't deal exception or exit.

(save-current-buffer
	(set-buffer "*scratch*")
	(goto-char (point-min))
	(set-buffer "*Messages*"))
#<buffer *Messages*>

(save-excursion
	(set-buffer "*scratch*")
	(goto-char (point-min))
	(set-buffer "*Messages*"))
#<buffer *Messages*>

(buffer-list)
(#<buffer learn1.el> #<buffer *Backtrace*> #<buffer  *Minibuf-1*> #<buffer  *Echo Area 0*> #<buffer  *Echo Area 1*> #<buffer *scratch*> #<buffer  *Minibuf-0*> #<buffer *Messages*> #<buffer  *code-conversion-work*> #<buffer indent-hint.el> #<buffer CSharp.tabuyos> #<buffer *Completions*> ...)

(setq foo (make-marker))
#<marker in no buffer>

(set-marker foo (point))
#<marker at 20897 in learn1.el>

(point-marker)
#<marker at 20945 in learn1.el>

(copy-marker 20)
#<marker at 20 in learn1.el>

(copy-marker foo)
#<marker at 20897 in learn1.el>

(marker-position foo)
20897

(marker-buffer foo)
#<buffer learn1.el>

(goto-char (point-min))

(forward-char 10)

(forward-char -10)

(char-before 10)
103

(insert "123")
123nil

(insert "123" "456")
123456nil

(defun show-region (beg end)
	(interactive
		(if (or (null transient-mark-mode)
				mark-active)
			(list (region-beginning) (region-end))
			(list (point-min) (point-max))))
	(message "Region start from %d to %d" beg end))
show-region

(show-region 100 140)
"Region start from 100 to 140"

(defun mark-whole-sexp ()
	(interactive)
	(let ((bound (bounds-of-thing-at-point 'sexp)))
		(if bound
			(progn
				(goto-char (car bound))
				(set-mark (point))
				(goto-char (cdr bound)))
			(message "No sexp found at point!"))))
mark-whole-sexp

(mark-whole-sexp)
"No sexp found at point!"

(bounds-of-thing-at-point 'sexp)
nil

;; Implement 1
(defun oowrite-table-convert (col beg end)
	(interactinve "nColumns of table: \nr")
	(setq col (1- col))
	(save-excursion
		(save-restriction
			(narrow-to-region beg end)
			(goto-char (point-min))
			(while (not (eobp))
				(dotimes (i col)
					(forward-line 1)
					(backward-delete-char 1)
					(insert-char ?\t 1))
				(forward-line 1)))))
oowrite-table-convert

;; Implement 2
(defun oowrite-table-convert (col beg end)
	(interactive "nColumns of table: \nr")
	(save-excursion
		(save-restriction
			(narrow-to-region beg end)
			(goto-char (point-min))
			(while (not (eobp))
				(subst-char-in-region
					(point) (progn (forward-line col) (1- (point)))
					?\n ?\t)))))
oowrite-table-convert

;; Implement 3
(defun oowrite-table-convert (col beg end)
	(interactive "nColumns of table: \nr")
	(save-excursion
		(save-restriction
			(narrow-to-region beg end)
			(goto-char (point-min))
			(while (not (eobp))
				(setq start (point))
				(forward-line col)
				(setq bound (copy-marker (1- (point))))
				(goto-char start)
				(while (re-search-forward "\n" bound t)
					(replace-match "\t"))
				(goto-char (1+ bound))))))
oowrite-table-convert

(oowrite-table-convert 2 23030 23140)

(point)
23130

(selected-window)
#<window 43 on learn1.el>

(split-window)
#<window 47 on learn1.el>

(window-tree)
((t (0 0 211 53) #<window 43 on learn1.el> (nil (0 27 211 53) #<window 49 on learn1.el> #<window 51 on learn1.el>)) #<window 4 on  *Minibuf-0*>)
;; nil: horizontal t: vertical
(#<window 43 on learn1.el> #<window 4 on  *Minibuf-0*>)

(current-window-configuration)
#<window-configuration>

(message "Original window: %S" (selected-window))
"Original window: #<window 43 on learn1.el>"

(save-selected-window
	(select-window (next-window))
	(goto-char (point-min)))
1

(window-list)
(#<window 55 on learn1.el> #<window 57 on learn1.el>)

(selected-window)
#<window 55 on learn1.el>

(window-list)
(#<window 55 on learn1.el> #<window 57 on learn1.el>)

(next-window)
#<window 57 on learn1.el>

(window-height)
53

(window-body-height)
51

(window-width)
104

(window-body-width)
104

(window-edges)
(0 0 106 53)

(window-inside-edges)
(0 0 106 52)

(window-buffer)
#<buffer learn1.el>

(window-buffer (next-window))
#<buffer learn1.el>

(display-buffer (get-buffer "*Messages*"))
#<window 57 on *Messages*>

(defun my-window-tree-to-list (tree)
	(if (windowp tree)
		'win
		(let ((dir (car tree))
				 (children (cddr tree)))
			(list (if dir 'vertical 'horizontal)
				(if dir
					(my-window-height (car children))
					(my-window-width (car children)))
				(my-window-tree-to-list (car children))
				(if (> (length children) 2)
					(my-window-tree-to-list (cons dir (cons nil (cdr children))))
					(my-window-tree-to-list (cadr children)))))))
my-window-tree-to-list
 
(defun my-window-width (win)
	(if (windowp win)
		(window-width win)
		(let ((edge (cadr win)))
			(- (nth 2 edge) (car edge)))))
my-window-width

(defun my-window-height (win)
	(if (windowp win)
		(window-height win)
		(let ((edge (cadr win)))
			(- (nth 3 edge) (cadr edge)))))
my-window-height

(defun my-list-to-window-tree (conf)
	(when (listp conf)
		(let (newwin)
			(setq newwin (split-window nil (cadr conf)
							 (eq (car conf) 'horizontal)))
			(my-list-to-window-tree (nth 2 conf))
			(select-window newwin)
			(my-list-to-window-tree (nth 3 conf)))))
my-list-to-window-tree

(defun my-restore-window-configuration (winconf)
	(delete-other-windows)
	(my-list-to-window-tree winconf))
my-restore-window-configuration

(defun my-current-window-configuration ()
	(my-window-tree-to-list (car (window-tree))))
my-current-window-configuration

;; test code
(setq foo (my-current-window-configuration))
(horizontal 104 win win)
;; do anthing to change this window
(my-restore-window-configuration foo)
nil

;; optimization
(defun my-window-tree-to-list (tree)
	(if (windowp tree)
		(buffer-name (window-buffer tree))
		(let ((dir (car tree))
				 (children (cddr tree)))
			(list (if dir 'vertical 'horizontal)
				(if dir
					(my-window-height (car children))
					(my-window-width (car children)))
				(my-window-tree-to-list (car children))
				(if (> (length children) 2)
					(my-window-tree-to-list (cons dir (cons nil (cdr children))))
					(my-window-tree-to-list (cadr children)))))))
my-window-tree-to-list

(defun my-list-to-window-tree (conf set-winbuf)
	(let ((newwin (split-window nil (cadr conf)
					  (eq (car conf) 'horizontal))))
		(if (eq (car conf) 'horizontal)
			(progn
				(funcall set-winbuf (selected-window) (nth 2 conf))
				(select-window newwin)
				(if (listp (nth 3 conf))
					(my-list-to-window-tree (nth 3 conf))
					(funcall set-winbuf newwin (nth 3 conf))))
			(if (listp (nth 2 conf))
				(my-list-to-window-tree (nth 2 conf))
				(funcall set-winbuf (selected-window) (nth 2 conf)))
			(select-window newwin)
			(funcall set-winbuf newwin (nth 3 conf)))))
my-list-to-window-tree

(defun my-restore-window-configuration (winconf)
	(let ((buf (current-buffer)))
		(delete-other-windows)
		(my-list-to-window-tree winconf
			(lambda (win name)
				(set-window-buffer win (or (get-buffer name) buf))))))
my-restore-window-configuration

;; test code
(setq foo (my-current-window-configuration))
(horizontal 102 "learn1.el" "learn1.el")

;; do anthing to change this window
(my-restore-window-configuration foo)
nil

(file-exists-p "~/temp/tabuyos.txt")
t

(file-readable-p "~/temp/tabuyos.txt")
t

(file-writable-p "~/temp/tabuyos.txt")
t

(file-executable-p "~/temp/tabuyos.txt")
nil

(format "%o" (file-modes "~/temp/tabuyos.txt"))
"666"

(file-regular-p "~/temp/tabuyos.txt")
t

(file-directory-p "~/temp/tabuyos.txt")
nil

(file-symlink-p "~/temp/tabuyos.txt")
nil

(file-truename "~/temp/tabuyos.txt")
"d:/Home/temp/tabuyos.txt"

(file-attributes "~/temp/tabuyos.txt")
(nil 1 1001 513 (24210 53442 0 0) (24210 53442 0 0) (24210 53442 0 0) 0 "-rw-rw-rw-" t 5066549580858090 3523998068)

(defun file-stat-type (file &optional id-format)
	(car (file-attributes file id-format)))
file-stat-type

(defun file-stat-name-number (file &optional id-format)
	(cadr (file-attributes file id-format)))
file-stat-name-number

(defun file-stat-uid (file &optional id-format)
	(nth 2 (file-attributes file id-format)))
file-stat-uid

(defun file-stat-gid (file &optional id-format)
	(nth 3 (file-attributes file id-format)))
file-stat-gid

(defun file-stat-atime (file &optional id-format)
	(nth 4 (file-attributes file id-format)))
file-stat-atime

(defun file-stat-mtime (file &optional id-format)
	(nth 5 (file-attributes file id-format)))
file-stat-mtime

(defun file-stat-ctime (file &optional id-format)
	(nth 6 (file-attributes file id-format)))
file-stat-ctime

(defun file-stat-size (file &optional id-format)
	(nth 7 (file-attributes file id-format)))
file-stat-size

(defun file-stat-modes (file &optional id-format)
	(nth 8 (file-attributes file id-format)))
file-stat-modes

(defun file-stat-guid-changep (file &optional id-format)
	(nth 9 (file-attributes file id-format)))
file-stat-guid-changep

(defun file-stat-inode-number (file &optional id-format)
	(nth 10 (file-attributes file id-format)))
file-stat-inode-number

(defun file-stat-system-number (file &optional id-format)
	(nth 11 (file-attributes file id-format)))
file-stat-system-number

(defun file-attr-type (attr)
	(car attr))
file-attr-type

(defun file-attr-name-number (attr)
	(cadr attr))
file-attr-name-number

(defun file-attr-uid (attr)
	(nth 2 attr))
file-attr-uid

(defun file-attr-gid (attr)
	(nth 3 attr))
file-attr-gid

(defun file-attr-atime (attr)
	(nth 4 attr))
file-attr-atime

(defun file-attr-mtime (attr)
	(nth 5 attr))
file-attr-mtime

(defun file-attr-ctime (attr)
	(nth 6 attr))
file-attr-ctime

(defun file-attr-size (attr)
	(nth 7 attr))
file-attr-size

(defun file-attr-modes (attr)
	(nth 8 attr))
file-attr-modes

(defun file-attr-guid-changep (attr)
	(nth 9 attr))
file-attr-guid-changep

(defun file-attr-inode-number (attr)
	(nth 10 attr))
file-attr-inode-number

(defun file-attr-system-number (attr)
	(nth 11 attr))
file-attr-system-number

(nth 4 '(1 2 3 4 5 6 7))
5

(rename-file "~/temp/tabuyos.txt" "test.txt")
nil

(file-truename "test.txt")
"f:/Projects/EmacsWorkspace/Elisp/learn1/test.txt"

(rename-file "test.txt" "~/temp/tabuyos.txt")
nil

(copy-file "~/temp/tabuyos.txt" "~/temp/t.txt")
nil

(delete-file "~/temp/t.txt")
nil

(make-directory "~/temp/test")
nil

(delete-directory "~/temp/test")
nil

(file-name-directory "~/temp/tabuyos.txt")
"~/temp/"

(file-truename (file-name-directory "~/temp/tabuyos.txt"))
"d:/Home/temp/"

(file-name-nondirectory "~/temp/tabuyos.txt")
"tabuyos.txt"

(file-truename (file-name-nondirectory "~/temp/tabuyos.txt"))
"f:/Projects/EmacsWorkspace/Elisp/learn1/tabuyos.txt"

(file-name-sans-extension "~/temp/tabuyos.txt")
"~/temp/tabuyos"

(file-name-extension "~/temp/tabuyos.txt")
"txt"

(file-name-sans-versions "~/temp/tabuyos.txt~")
"~/temp/tabuyos.txt"

(file-name-sans-versions "~/temp/tabuyos.txt.~1~")
"~/temp/tabuyos.txt"

(file-name-absolute-p "~/temp/tabuyos.txt")
t

(file-name-absolute-p "temp/tabuyos.txt")
nil

(expand-file-name "temp/tabuyos.txt")
"f:/Projects/EmacsWorkspace/Elisp/learn1/temp/tabuyos.txt"

(expand-file-name "temp/tabuyos.txt" "/home/")
"f:/home/temp/tabuyos.txt"

(file-relative-name "~/temp/tabuyos.txt")
"d:/Home/temp/tabuyos.txt"

(file-relative-name "~/temp/tabuyos.txt" "~/temp")
"tabuyos.txt"

(file-relative-name "temp/tabuyos.txt" "/home")
"../Projects/EmacsWorkspace/Elisp/learn1/temp/tabuyos.txt"

(file-relative-name "~/temp/tabuyos.txt" "/home")
"d:/Home/temp/tabuyos.txt"

(concat "temp" "/")
"temp/"

(file-name-as-directory "~/temp/tabuyos.txt")
"~/temp/tabuyos.txt/"

(directory-file-name "~/temp/tabuyos.txt/")
"~/temp/tabuyos.txt"

(convert-standard-filename "~/temp/tabuyos.txt")
"~/temp/tabuyos.txt"

(convert-standard-filename "C:/Windows")
"C:/Windows"

temporary-file-directory
"c:/Users/Tabuyos/AppData/Local/Temp/"

(make-temp-file "foo")
"c:/Users/Tabuyos/AppData/Local/Temp/fooXcbDee"
;; exsited

(make-temp-name "foo")
"fooRM66Ab"
;; non-exsited

(make-directory "~/temp/test")
nil

(directory-files "~/temp")
("." ".." "tabuyos.txt" "test")

(directory-files "~/temp" t)
("d:/Home/temp/." "d:/Home/temp/.." "d:/Home/temp/tabuyos.txt" "d:/Home/temp/test")

(directory-files "~/temp" t "t")
("d:/Home/temp/tabuyos.txt" "d:/Home/temp/test")

(directory-files "~/temp" t nil)
("d:/Home/temp/." "d:/Home/temp/.." "d:/Home/temp/tabuyos.txt" "d:/Home/temp/test")

(directory-files "~/temp" t ".txt")
("d:/Home/temp/tabuyos.txt")

(directory-files "~/temp" t "es")
("d:/Home/temp/test")

(directory-files-and-attributes "~/temp")
(("." t 1 1001 513 (24210 57414 0 0) (24210 57414 0 0) (24210 53419 0 0) 0 "drwxrwxrwx" t 3659174697304806 ...) (".." t 1 544 513 (24210 53436 0 0) (24210 53436 0 0) (23465 38518 0 0) 12288 "drwxrwxrwx" t 281474976710695 ...) ("tabuyos.txt" nil 1 1001 513 (24210 55680 0 0) (24210 53442 0 0) (24210 55680 0 0) 0 "-rw-rw-rw-" t 5348024557568746 ...) ("test" t 1 1001 513 (24210 57414 0 0) (24210 57414 0 0) (24210 57414 0 0) 0 "drwxrwxrwx" t 6755399441122028 ...))

(file-expand-wildcards "~/temp" t)
("d:/Home/temp")

file-name-handler-alist
(("\\.gpg\\(~\\|\\.~[0-9]+~\\)?\\'" . epa-file-handler) ("\\(?:\\.tzst\\|\\.zst\\|\\.dz\\|\\.txz\\|\\.xz\\|\\.lzma\\|\\.lz\\|\\.g?z\\|\\.\\(?:tgz\\|svgz\\|sifz\\)\\|\\.tbz2?\\|\\.bz2\\|\\.Z\\)\\(?:~\\|\\.~[-[:alnum:]:#@^._]+\\(?:~[[:digit:]]+\\)?~\\)?\\'" . jka-compr-handler) ("\\`/\\(-\\|[^/|:]\\{2,\\}\\):" . tramp-autoload-file-name-handler) ("\\`/:" . file-name-non-special))

(make-auto-save-file-name)
"f:/Projects/EmacsWorkspace/Elisp/learn1/#learn1.el#"

(expand-file-name "foo")
"f:/Projects/EmacsWorkspace/Elisp/learn1/foo"

(directory-files ".")
("#learn1.el#" "." ".#learn1.el" ".." "learn1.el" "learn1.elc")

(defun my-scratch-auto-file-name (operation &rest args)
	(if (and (eq operation 'expand-file-name)
			(string= (car args) "#*scratch*#"))
		(expand-file-name (concat "~/.emacs.d/backup/" (car args)))
		(let ((inhibit-file-name-handlers
				  (cons 'my-scratch-auto-save-file-name
					  (and (eq inhibit-file-name-operation operation)
						  inhibit-file-name-handlers)))
				 (inhibit-file-name-operation operation))
			(apply operation args))))
my-scratch-auto-file-name

(defvar header-regexp-list
	'(("^\\(?:\\(?:G_CONST_RETURN\\|extern\\|const\\)\\s-+\\)?[a-zA-Z][_a-zA-Z0-9]*\\\(?:\\s-*[*]*[ \t\n]+\\|\\s-+[*]*\\)\\([a-zA-Z][_a-zA-Z0-9]*\\)\\s-*(" . 1)("^\\s-*#\\s-*define\\s-+\\([a-zA-Z][_a-zA-Z0-9]*\\)" . 1)))
header-regexp-list

(defun parse-c-header (file)
	"Extract function name and declaration position using
'header-regexp-list'."
	(interactive "fHeader file: \nP")
	(let (info)
		(with-temp-buffer
			(insert-file-contents file)
			(dolist (re header-regexp-list)
				(goto-char (point-min))
				(while (re-search-forward (car re) nil t)
					(push (cons (match-string (cdr re)) (line-beginning-position)) info))))
		info))
parse-c-header

(parse-c-header "~/temp/stdio.h")
(("SYS_OPEN" . 36687) ("P_tmpdir" . 36660) ("putwc" . 35070) ("getwc" . 35037) ("putwchar" . 34832) ("getwchar" . 34799) ("wpopen" . 34340) ("WEOF" . 30381) ("pclose" . 18561) ("popen" . 18540) ("ftello" . 17670) ("fseeko" . 17254) ("stderr" . 2167) ("stdout" . 2133) ("stdin" . 2100) ("NULL" . 1288) ("NULL" . 1247) ("NULL" . 1226) ("TMP_MAX" . 1156) ("FOPEN_MAX" . 1114) ("FILENAME_MAX" . 1089) ("STDERR_FILENO" . 1064) ("STDOUT_FILENO" . 1040) ("STDIN_FILENO" . 1017) ("SEEK_SET" . 997) ("SEEK_END" . 978) ("SEEK_CUR" . 959) ("L_cuserid" . 930) ("L_ctermid" . 910) ("L_tmpnam" . 852) ("EOF" . 473) ("BUFSIZ" . 383) ("vsnwprintf" . 28437) ("snwprintf" . 28030) ("vwprintf" . 27757) ("vfwprintf" . 27508) ("wprintf" . 27151) ("fwprintf" . 26766) ("vfwscanf" . 26490) ("vwscanf" . 26272) ("vswscanf" . 25989) ("fwscanf" . 25556) ("wscanf" . 25203) ("swscanf" . 24813) ("snprintf" . 21468) ("vsnprintf" . 10686) ("snprintf" . 10294) ("vsprintf" . 10000) ("vprintf" . 9791) ("vfprintf" . 9554) ("sprintf" . 9181) ("printf" . 8836) ("fprintf" . 8463) ("vfscanf" . 8199) ("vscanf" . 7993) ("vsscanf" . 7753) ("fscanf" . 7332) ("scanf" . 6991) ("sscanf" . 6616) ("vasprintf" . 6193) ("asprintf" . 5818) ("FILE" . 1573))

(defun my-directory-all-files (dir &optional full match nosort)
	(apply 'append
		(delq nil
			(mapcar
				(lambda (file)
					(if (and (not (string-match "^[.]+$" (file-name-nondiretory file)))
							(file-directory-p (expand-file-name file dir)))
						(if full
							(my-directory-all-files file full match nosort)
							(mapcar (lambda (f)
										(concat (file-name-as-directory file) f))
								(my-directory-all-files (expand-file-name file dir)
									full match nosort)))
						(if (string-match match file)
							(list fiel))))
				(directory-files dir full nil nosort)))))
my-directory-all-files

;; learn over.
