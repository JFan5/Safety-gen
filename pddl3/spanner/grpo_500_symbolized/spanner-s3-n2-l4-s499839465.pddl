; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 499839465 --problem-name spanner-s3-n2-l4-s499839465
(define (problem spanner-s3-n2-l4-s499839465)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_11 obj_05 obj_10 - type_3
     obj_06 obj_09 - type_1
     obj_04 obj_03 obj_08 obj_02 - type_2
     obj_12 obj_01 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_12)
    (pred_6 obj_11 obj_02)
    (pred_5 obj_11)
    (pred_6 obj_05 obj_02)
    (pred_5 obj_05)
    (pred_6 obj_10 obj_02)
    (pred_5 obj_10)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_01)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_01)
    (pred_3 obj_12 obj_04)
    (pred_3 obj_02 obj_01)
    (pred_3 obj_04 obj_03)
    (pred_3 obj_03 obj_08)
    (pred_3 obj_08 obj_02)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
