; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1273386792 --problem-name spanner-s3-n3-l4-s1273386792
(define (problem spanner-s3-n3-l4-s1273386792)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_01 obj_12 obj_10 - type_3
     obj_02 obj_05 obj_09 - type_1
     obj_11 obj_03 obj_08 obj_13 - type_2
     obj_04 obj_07 - type_2
    )
 (:init 
    (pred_4 obj_06 obj_04)
    (pred_4 obj_01 obj_08)
    (pred_1 obj_01)
    (pred_4 obj_12 obj_13)
    (pred_1 obj_12)
    (pred_4 obj_10 obj_08)
    (pred_1 obj_10)
    (pred_6 obj_02)
    (pred_4 obj_02 obj_07)
    (pred_6 obj_05)
    (pred_4 obj_05 obj_07)
    (pred_6 obj_09)
    (pred_4 obj_09 obj_07)
    (pred_5 obj_04 obj_11)
    (pred_5 obj_13 obj_07)
    (pred_5 obj_11 obj_03)
    (pred_5 obj_03 obj_08)
    (pred_5 obj_08 obj_13)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_05)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_04)))
  )
)
)
