; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 835533311 --problem-name spanner-s3-n3-l4-s835533311
(define (problem spanner-s3-n3-l4-s835533311)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_03 obj_08 obj_13 - type_4
     obj_06 obj_11 obj_05 - type_1
     obj_12 obj_02 obj_09 obj_04 - type_3
     obj_01 obj_07 - type_3
    )
 (:init 
    (pred_1 obj_10 obj_01)
    (pred_1 obj_03 obj_09)
    (pred_3 obj_03)
    (pred_1 obj_08 obj_12)
    (pred_3 obj_08)
    (pred_1 obj_13 obj_02)
    (pred_3 obj_13)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_07)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_07)
    (pred_4 obj_05)
    (pred_1 obj_05 obj_07)
    (pred_2 obj_01 obj_12)
    (pred_2 obj_04 obj_07)
    (pred_2 obj_12 obj_02)
    (pred_2 obj_02 obj_09)
    (pred_2 obj_09 obj_04)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_11)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
