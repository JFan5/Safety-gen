; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 905430018 --problem-name spanner-s3-n3-l4-s905430018
(define (problem spanner-s3-n3-l4-s905430018)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_09 obj_04 obj_06 - type_1
     obj_11 obj_05 obj_12 - type_2
     obj_02 obj_01 obj_10 obj_07 - type_5
     obj_13 obj_03 - type_5
    )
 (:init 
    (pred_3 obj_08 obj_13)
    (pred_3 obj_09 obj_10)
    (pred_2 obj_09)
    (pred_3 obj_04 obj_02)
    (pred_2 obj_04)
    (pred_3 obj_06 obj_10)
    (pred_2 obj_06)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_03)
    (pred_6 obj_05)
    (pred_3 obj_05 obj_03)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_03)
    (pred_4 obj_13 obj_02)
    (pred_4 obj_07 obj_03)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_01 obj_10)
    (pred_4 obj_10 obj_07)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_05)
   (pred_1 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_13)))
  )
)
)
