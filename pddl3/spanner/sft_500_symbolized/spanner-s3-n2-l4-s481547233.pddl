; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 481547233 --problem-name spanner-s3-n2-l4-s481547233
(define (problem spanner-s3-n2-l4-s481547233)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_11 obj_07 obj_01 - type_5
     obj_06 obj_10 - type_3
     obj_08 obj_12 obj_05 obj_03 - type_1
     obj_02 obj_09 - type_1
    )
 (:init 
    (pred_4 obj_04 obj_02)
    (pred_4 obj_11 obj_03)
    (pred_2 obj_11)
    (pred_4 obj_07 obj_08)
    (pred_2 obj_07)
    (pred_4 obj_01 obj_03)
    (pred_2 obj_01)
    (pred_5 obj_06)
    (pred_4 obj_06 obj_09)
    (pred_5 obj_10)
    (pred_4 obj_10 obj_09)
    (pred_3 obj_02 obj_08)
    (pred_3 obj_03 obj_09)
    (pred_3 obj_08 obj_12)
    (pred_3 obj_12 obj_05)
    (pred_3 obj_05 obj_03)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_02)))
  )
)
)
