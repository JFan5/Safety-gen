; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 293297452 --problem-name spanner-s3-n2-l4-s293297452
(define (problem spanner-s3-n2-l4-s293297452)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_05 obj_01 obj_02 - type_3
     obj_06 obj_10 - type_1
     obj_09 obj_04 obj_07 obj_11 - type_2
     obj_12 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_08 obj_12)
    (pred_6 obj_05 obj_09)
    (pred_5 obj_05)
    (pred_6 obj_01 obj_09)
    (pred_5 obj_01)
    (pred_6 obj_02 obj_09)
    (pred_5 obj_02)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_03)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_03)
    (pred_3 obj_12 obj_09)
    (pred_3 obj_11 obj_03)
    (pred_3 obj_09 obj_04)
    (pred_3 obj_04 obj_07)
    (pred_3 obj_07 obj_11)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
