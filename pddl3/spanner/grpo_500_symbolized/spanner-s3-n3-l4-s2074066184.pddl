; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2074066184 --problem-name spanner-s3-n3-l4-s2074066184
(define (problem spanner-s3-n3-l4-s2074066184)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_11 obj_01 obj_13 - type_3
     obj_04 obj_09 obj_12 - type_1
     obj_10 obj_06 obj_02 obj_08 - type_2
     obj_05 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_05)
    (pred_6 obj_11 obj_02)
    (pred_5 obj_11)
    (pred_6 obj_01 obj_10)
    (pred_5 obj_01)
    (pred_6 obj_13 obj_10)
    (pred_5 obj_13)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_03)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_03)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_03)
    (pred_3 obj_05 obj_10)
    (pred_3 obj_08 obj_03)
    (pred_3 obj_10 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_02 obj_08)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_09)
   (pred_1 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
