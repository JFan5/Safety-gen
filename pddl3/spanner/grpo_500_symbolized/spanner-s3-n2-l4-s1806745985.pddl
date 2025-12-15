; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1806745985 --problem-name spanner-s3-n2-l4-s1806745985
(define (problem spanner-s3-n2-l4-s1806745985)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_11 obj_07 obj_05 - type_5
     obj_04 obj_08 - type_1
     obj_03 obj_12 obj_10 obj_01 - type_3
     obj_06 obj_02 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_06)
    (pred_3 obj_11 obj_01)
    (pred_1 obj_11)
    (pred_3 obj_07 obj_12)
    (pred_1 obj_07)
    (pred_3 obj_05 obj_10)
    (pred_1 obj_05)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_02)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_02)
    (pred_4 obj_06 obj_03)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_03 obj_12)
    (pred_4 obj_12 obj_10)
    (pred_4 obj_10 obj_01)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
