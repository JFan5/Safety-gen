; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1568696923 --problem-name spanner-s3-n2-l4-s1568696923
(define (problem spanner-s3-n2-l4-s1568696923)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_06 obj_12 obj_08 - type_3
     obj_11 obj_07 - type_4
     obj_03 obj_02 obj_05 obj_01 - type_2
     obj_10 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_04 obj_10)
    (pred_2 obj_06 obj_01)
    (pred_3 obj_06)
    (pred_2 obj_12 obj_02)
    (pred_3 obj_12)
    (pred_2 obj_08 obj_05)
    (pred_3 obj_08)
    (pred_4 obj_11)
    (pred_2 obj_11 obj_09)
    (pred_4 obj_07)
    (pred_2 obj_07 obj_09)
    (pred_1 obj_10 obj_03)
    (pred_1 obj_01 obj_09)
    (pred_1 obj_03 obj_02)
    (pred_1 obj_02 obj_05)
    (pred_1 obj_05 obj_01)
)
 (:goal
  (and
   (pred_5 obj_11)
   (pred_5 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_11)) (not (pred_5 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
