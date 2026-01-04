; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1766761787 --problem-name spanner-s3-n3-l4-s1766761787
(define (problem spanner-s3-n3-l4-s1766761787)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_01 obj_05 obj_11 - type_3
     obj_10 obj_07 obj_08 - type_2
     obj_04 obj_02 obj_06 obj_13 - type_4
     obj_09 obj_12 - type_4
    )
 (:init 
    (pred_1 obj_03 obj_09)
    (pred_1 obj_01 obj_04)
    (pred_4 obj_01)
    (pred_1 obj_05 obj_06)
    (pred_4 obj_05)
    (pred_1 obj_11 obj_06)
    (pred_4 obj_11)
    (pred_6 obj_10)
    (pred_1 obj_10 obj_12)
    (pred_6 obj_07)
    (pred_1 obj_07 obj_12)
    (pred_6 obj_08)
    (pred_1 obj_08 obj_12)
    (pred_5 obj_09 obj_04)
    (pred_5 obj_13 obj_12)
    (pred_5 obj_04 obj_02)
    (pred_5 obj_02 obj_06)
    (pred_5 obj_06 obj_13)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_07)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
