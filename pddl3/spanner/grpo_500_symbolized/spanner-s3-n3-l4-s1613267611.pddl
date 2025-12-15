; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1613267611 --problem-name spanner-s3-n3-l4-s1613267611
(define (problem spanner-s3-n3-l4-s1613267611)
 (:domain spanner)
 (:objects 
     obj_07 - type_4
     obj_10 obj_08 obj_12 - type_5
     obj_09 obj_02 obj_13 - type_1
     obj_11 obj_04 obj_03 obj_01 - type_3
     obj_06 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_06)
    (pred_3 obj_10 obj_04)
    (pred_1 obj_10)
    (pred_3 obj_08 obj_04)
    (pred_1 obj_08)
    (pred_3 obj_12 obj_04)
    (pred_1 obj_12)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_05)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_05)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_05)
    (pred_4 obj_06 obj_11)
    (pred_4 obj_01 obj_05)
    (pred_4 obj_11 obj_04)
    (pred_4 obj_04 obj_03)
    (pred_4 obj_03 obj_01)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_02)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
