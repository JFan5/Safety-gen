; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1685490373 --problem-name spanner-s3-n3-l4-s1685490373
(define (problem spanner-s3-n3-l4-s1685490373)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_11 obj_03 obj_07 - type_3
     obj_08 obj_05 obj_09 - type_1
     obj_13 obj_02 obj_04 obj_10 - type_2
     obj_06 obj_12 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_06)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_6 obj_03 obj_04)
    (pred_5 obj_03)
    (pred_6 obj_07 obj_13)
    (pred_5 obj_07)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_12)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_12)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_12)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_10 obj_12)
    (pred_3 obj_13 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_04 obj_10)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_05)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
