; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1613267611 --problem-name spanner-s3-n3-l4-s1613267611
(define (problem spanner-s3-n3-l4-s1613267611)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_02 obj_05 obj_13 - type_5
     obj_12 obj_09 obj_06 - type_1
     obj_07 obj_04 obj_11 obj_01 - type_4
     obj_08 obj_03 - type_4
    )
 (:init 
    (pred_1 obj_10 obj_08)
    (pred_1 obj_02 obj_04)
    (pred_6 obj_02)
    (pred_1 obj_05 obj_04)
    (pred_6 obj_05)
    (pred_1 obj_13 obj_04)
    (pred_6 obj_13)
    (pred_5 obj_12)
    (pred_1 obj_12 obj_03)
    (pred_5 obj_09)
    (pred_1 obj_09 obj_03)
    (pred_5 obj_06)
    (pred_1 obj_06 obj_03)
    (pred_4 obj_08 obj_07)
    (pred_4 obj_01 obj_03)
    (pred_4 obj_07 obj_04)
    (pred_4 obj_04 obj_11)
    (pred_4 obj_11 obj_01)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_09)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_08)))
  )
)
)
