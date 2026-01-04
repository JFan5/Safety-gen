; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 835533311 --problem-name spanner-s3-n3-l4-s835533311
(define (problem spanner-s3-n3-l4-s835533311)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_13 obj_02 obj_04 - type_1
     obj_08 obj_11 obj_06 - type_3
     obj_07 obj_12 obj_03 obj_09 - type_5
     obj_01 obj_10 - type_5
    )
 (:init 
    (pred_2 obj_05 obj_01)
    (pred_2 obj_13 obj_03)
    (pred_4 obj_13)
    (pred_2 obj_02 obj_07)
    (pred_4 obj_02)
    (pred_2 obj_04 obj_12)
    (pred_4 obj_04)
    (pred_3 obj_08)
    (pred_2 obj_08 obj_10)
    (pred_3 obj_11)
    (pred_2 obj_11 obj_10)
    (pred_3 obj_06)
    (pred_2 obj_06 obj_10)
    (pred_5 obj_01 obj_07)
    (pred_5 obj_09 obj_10)
    (pred_5 obj_07 obj_12)
    (pred_5 obj_12 obj_03)
    (pred_5 obj_03 obj_09)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_11)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
