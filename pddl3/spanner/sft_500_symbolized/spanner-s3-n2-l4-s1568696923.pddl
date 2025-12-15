; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1568696923 --problem-name spanner-s3-n2-l4-s1568696923
(define (problem spanner-s3-n2-l4-s1568696923)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_07 obj_12 obj_04 - type_4
     obj_06 obj_09 - type_5
     obj_08 obj_01 obj_02 obj_03 - type_3
     obj_05 obj_11 - type_3
    )
 (:init 
    (pred_1 obj_10 obj_05)
    (pred_1 obj_07 obj_03)
    (pred_2 obj_07)
    (pred_1 obj_12 obj_01)
    (pred_2 obj_12)
    (pred_1 obj_04 obj_02)
    (pred_2 obj_04)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_11)
    (pred_4 obj_09)
    (pred_1 obj_09 obj_11)
    (pred_5 obj_05 obj_08)
    (pred_5 obj_03 obj_11)
    (pred_5 obj_08 obj_01)
    (pred_5 obj_01 obj_02)
    (pred_5 obj_02 obj_03)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_09))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
