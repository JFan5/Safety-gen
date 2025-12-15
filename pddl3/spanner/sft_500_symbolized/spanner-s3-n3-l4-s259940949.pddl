; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 259940949 --problem-name spanner-s3-n3-l4-s259940949
(define (problem spanner-s3-n3-l4-s259940949)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_08 obj_13 obj_09 - type_5
     obj_07 obj_06 obj_10 - type_1
     obj_01 obj_02 obj_12 obj_04 - type_3
     obj_03 obj_05 - type_3
    )
 (:init 
    (pred_5 obj_11 obj_03)
    (pred_5 obj_08 obj_12)
    (pred_1 obj_08)
    (pred_5 obj_13 obj_02)
    (pred_1 obj_13)
    (pred_5 obj_09 obj_02)
    (pred_1 obj_09)
    (pred_2 obj_07)
    (pred_5 obj_07 obj_05)
    (pred_2 obj_06)
    (pred_5 obj_06 obj_05)
    (pred_2 obj_10)
    (pred_5 obj_10 obj_05)
    (pred_6 obj_03 obj_01)
    (pred_6 obj_04 obj_05)
    (pred_6 obj_01 obj_02)
    (pred_6 obj_02 obj_12)
    (pred_6 obj_12 obj_04)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_06)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
