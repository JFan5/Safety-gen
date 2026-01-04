; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1096125926 --problem-name spanner-s3-n3-l4-s1096125926
(define (problem spanner-s3-n3-l4-s1096125926)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_12 obj_05 obj_01 - type_5
     obj_02 obj_07 obj_09 - type_3
     obj_13 obj_10 obj_11 obj_03 - type_2
     obj_06 obj_04 - type_2
    )
 (:init 
    (pred_3 obj_08 obj_06)
    (pred_3 obj_12 obj_11)
    (pred_4 obj_12)
    (pred_3 obj_05 obj_10)
    (pred_4 obj_05)
    (pred_3 obj_01 obj_11)
    (pred_4 obj_01)
    (pred_2 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_2 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_2 obj_09)
    (pred_3 obj_09 obj_04)
    (pred_6 obj_06 obj_13)
    (pred_6 obj_03 obj_04)
    (pred_6 obj_13 obj_10)
    (pred_6 obj_10 obj_11)
    (pred_6 obj_11 obj_03)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_07)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
