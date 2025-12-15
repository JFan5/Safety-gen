; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 142356560 --problem-name spanner-s3-n2-l4-s142356560
(define (problem spanner-s3-n2-l4-s142356560)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_10 obj_11 obj_03 - type_1
     obj_09 obj_08 - type_5
     obj_04 obj_07 obj_02 obj_12 - type_3
     obj_01 obj_05 - type_3
    )
 (:init 
    (pred_4 obj_06 obj_01)
    (pred_4 obj_10 obj_07)
    (pred_6 obj_10)
    (pred_4 obj_11 obj_04)
    (pred_6 obj_11)
    (pred_4 obj_03 obj_02)
    (pred_6 obj_03)
    (pred_5 obj_09)
    (pred_4 obj_09 obj_05)
    (pred_5 obj_08)
    (pred_4 obj_08 obj_05)
    (pred_3 obj_01 obj_04)
    (pred_3 obj_12 obj_05)
    (pred_3 obj_04 obj_07)
    (pred_3 obj_07 obj_02)
    (pred_3 obj_02 obj_12)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
