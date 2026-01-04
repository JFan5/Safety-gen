; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1274572435 --problem-name spanner-s3-n3-l4-s1274572435
(define (problem spanner-s3-n3-l4-s1274572435)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_05 obj_10 obj_03 - type_5
     obj_07 obj_06 obj_01 - type_3
     obj_02 obj_13 obj_04 obj_09 - type_1
     obj_08 obj_12 - type_1
    )
 (:init 
    (pred_2 obj_11 obj_08)
    (pred_2 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_2 obj_10 obj_13)
    (pred_1 obj_10)
    (pred_2 obj_03 obj_02)
    (pred_1 obj_03)
    (pred_4 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_4 obj_06)
    (pred_2 obj_06 obj_12)
    (pred_4 obj_01)
    (pred_2 obj_01 obj_12)
    (pred_6 obj_08 obj_02)
    (pred_6 obj_09 obj_12)
    (pred_6 obj_02 obj_13)
    (pred_6 obj_13 obj_04)
    (pred_6 obj_04 obj_09)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_06)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_07)) (not (pred_5 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
