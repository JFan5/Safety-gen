; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 259940949 --problem-name spanner-s3-n3-l4-s259940949
(define (problem spanner-s3-n3-l4-s259940949)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_05 obj_04 obj_08 - type_5
     obj_03 obj_06 obj_09 - type_4
     obj_10 obj_07 obj_02 obj_12 - type_2
     obj_01 obj_11 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_01)
    (pred_2 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_2 obj_04 obj_07)
    (pred_1 obj_04)
    (pred_2 obj_08 obj_07)
    (pred_1 obj_08)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_11)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_11)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_11)
    (pred_6 obj_01 obj_10)
    (pred_6 obj_12 obj_11)
    (pred_6 obj_10 obj_07)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_02 obj_12)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_06)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
