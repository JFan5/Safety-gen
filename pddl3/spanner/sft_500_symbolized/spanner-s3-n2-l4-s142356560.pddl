; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 142356560 --problem-name spanner-s3-n2-l4-s142356560
(define (problem spanner-s3-n2-l4-s142356560)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_02 obj_08 obj_04 - type_1
     obj_05 obj_10 - type_2
     obj_01 obj_12 obj_03 obj_11 - type_5
     obj_09 obj_06 - type_5
    )
 (:init 
    (pred_2 obj_07 obj_09)
    (pred_2 obj_02 obj_12)
    (pred_5 obj_02)
    (pred_2 obj_08 obj_01)
    (pred_5 obj_08)
    (pred_2 obj_04 obj_03)
    (pred_5 obj_04)
    (pred_3 obj_05)
    (pred_2 obj_05 obj_06)
    (pred_3 obj_10)
    (pred_2 obj_10 obj_06)
    (pred_4 obj_09 obj_01)
    (pred_4 obj_11 obj_06)
    (pred_4 obj_01 obj_12)
    (pred_4 obj_12 obj_03)
    (pred_4 obj_03 obj_11)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
