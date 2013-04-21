(use concurrent-native-callbacks lolevel srfi-18)

(define-concurrent-native-callback (foo (int x))
  (print "foo: " x))

(define-synchronous-concurrent-native-callback (bar (int x)) int
  (print "bar: " x)
  (* x x))

(thread-start!
 (lambda ()
   (print "starting spin ...")
   (do () (#f) 
     (print* "_")
     (thread-sleep! 0.25))))

(print "started")
(thread-sleep! 1000000)
(print "timeout")
(return-to-host)			; should not execute