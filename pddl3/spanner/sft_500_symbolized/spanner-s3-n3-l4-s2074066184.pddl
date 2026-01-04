; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2074066184 --problem-name spanner-s3-n3-l4-s2074066184
(define (problem spanner-s3-n3-l4-s2074066184)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_04 obj_06 obj_01 - type_2
     obj_03 obj_09 obj_13 - type_3
     obj_07 obj_10 obj_08 obj_05 - type_1
     obj_12 obj_02 - type_1
    )
 (:init 
    (pred_5 obj_11 obj_12)
    (pred_5 obj_04 obj_08)
    (pred_6 obj_04)
    (pred_5 obj_06 obj_07)
    (pred_6 obj_06)
    (pred_5 obj_01 obj_07)
    (pred_6 obj_01)
    (pred_2 obj_03)
    (pred_5 obj_03 obj_02)
    (pred_2 obj_09)
    (pred_5 obj_09 obj_02)
    (pred_2 obj_13)
    (pred_5 obj_13 obj_02)
    (pred_3 obj_12 obj_07)
    (pred_3 obj_05 obj_02)
    (pred_3 obj_07 obj_10)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_08 obj_05)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_09)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_12)))
  )
)
)
