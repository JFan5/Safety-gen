; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 481547233 --problem-name spanner-s3-n2-l4-s481547233
(define (problem spanner-s3-n2-l4-s481547233)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_08 obj_03 obj_04 - type_4
     obj_07 obj_12 - type_3
     obj_01 obj_02 obj_06 obj_09 - type_1
     obj_11 obj_10 - type_1
    )
 (:init 
    (pred_1 obj_05 obj_11)
    (pred_1 obj_08 obj_09)
    (pred_3 obj_08)
    (pred_1 obj_03 obj_01)
    (pred_3 obj_03)
    (pred_1 obj_04 obj_09)
    (pred_3 obj_04)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_10)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_10)
    (pred_4 obj_11 obj_01)
    (pred_4 obj_09 obj_10)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_06 obj_09)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_07)) (not (pred_5 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
