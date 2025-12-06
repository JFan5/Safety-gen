(define (problem spanner-s3-n2-l4-s1560146864)
 (:domain spanner)
 (:objects 
     o9 - man
     o10 o3 o1 - spanner
     o4 o8 - nut
     o2 o7 o12 o11 - location
     o6 o5 - location
    )
 (:init 
    (p4 o9 o6)
    (p4 o10 o11)
    (p5 o10)
    (p4 o3 o12)
    (p5 o3)
    (p4 o1 o2)
    (p5 o1)
    (p1 o4)
    (p4 o4 o5)
    (p1 o8)
    (p4 o8 o5)
    (p3 o6 o2)
    (p3 o11 o5)
    (p3 o2 o7)
    (p3 o7 o12)
    (p3 o12 o11)
)
 (:goal
  (and
   (p6 o4)
   (p6 o8)
))
(:constraints
  (and
    (always (imply (not (p6 o4)) (not (p6 o8))))
    (forall (?m - man) (p4-most-once (p4 ?m o6)))
  )
)
)
