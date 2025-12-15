; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 745472483 --problem-name spanner-s3-n3-l4-s745472483
(define (problem spanner-s3-n3-l4-s745472483)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_12 obj_04 obj_05 - type_5
     obj_09 obj_01 obj_11 - type_1
     obj_06 obj_03 obj_10 obj_02 - type_3
     obj_13 obj_07 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_13)
    (pred_3 obj_12 obj_03)
    (pred_1 obj_12)
    (pred_3 obj_04 obj_03)
    (pred_1 obj_04)
    (pred_3 obj_05 obj_10)
    (pred_1 obj_05)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_07)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_07)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_07)
    (pred_4 obj_13 obj_06)
    (pred_4 obj_02 obj_07)
    (pred_4 obj_06 obj_03)
    (pred_4 obj_03 obj_10)
    (pred_4 obj_10 obj_02)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_01)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_13)))
  )
)
)
