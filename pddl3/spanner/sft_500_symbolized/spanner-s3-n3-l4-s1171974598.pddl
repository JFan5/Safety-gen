; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1171974598 --problem-name spanner-s3-n3-l4-s1171974598
(define (problem spanner-s3-n3-l4-s1171974598)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_05 obj_04 obj_01 - type_5
     obj_10 obj_08 obj_07 - type_3
     obj_09 obj_03 obj_13 obj_12 - type_4
     obj_06 obj_02 - type_4
    )
 (:init 
    (pred_5 obj_11 obj_06)
    (pred_5 obj_05 obj_09)
    (pred_2 obj_05)
    (pred_5 obj_04 obj_12)
    (pred_2 obj_04)
    (pred_5 obj_01 obj_13)
    (pred_2 obj_01)
    (pred_1 obj_10)
    (pred_5 obj_10 obj_02)
    (pred_1 obj_08)
    (pred_5 obj_08 obj_02)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_02)
    (pred_4 obj_06 obj_09)
    (pred_4 obj_12 obj_02)
    (pred_4 obj_09 obj_03)
    (pred_4 obj_03 obj_13)
    (pred_4 obj_13 obj_12)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_08)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_06)))
  )
)
)
