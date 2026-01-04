; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1849218894 --problem-name spanner-s3-n3-l4-s1849218894
(define (problem spanner-s3-n3-l4-s1849218894)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_10 obj_04 obj_09 - type_5
     obj_06 obj_13 obj_01 - type_4
     obj_11 obj_02 obj_12 obj_07 - type_1
     obj_08 obj_05 - type_1
    )
 (:init 
    (pred_6 obj_03 obj_08)
    (pred_6 obj_10 obj_02)
    (pred_4 obj_10)
    (pred_6 obj_04 obj_07)
    (pred_4 obj_04)
    (pred_6 obj_09 obj_02)
    (pred_4 obj_09)
    (pred_2 obj_06)
    (pred_6 obj_06 obj_05)
    (pred_2 obj_13)
    (pred_6 obj_13 obj_05)
    (pred_2 obj_01)
    (pred_6 obj_01 obj_05)
    (pred_1 obj_08 obj_11)
    (pred_1 obj_07 obj_05)
    (pred_1 obj_11 obj_02)
    (pred_1 obj_02 obj_12)
    (pred_1 obj_12 obj_07)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_13)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_13))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
