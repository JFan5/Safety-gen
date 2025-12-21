; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2012380313 --problem-name spanner-s3-n3-l4-s2012380313
(define (problem spanner-s3-n3-l4-s2012380313)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_11 obj_08 obj_05 - type_3
     obj_12 obj_07 obj_02 - type_1
     obj_13 obj_10 obj_04 obj_01 - type_2
     obj_06 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_09 obj_06)
    (pred_6 obj_11 obj_10)
    (pred_5 obj_11)
    (pred_6 obj_08 obj_04)
    (pred_5 obj_08)
    (pred_6 obj_05 obj_04)
    (pred_5 obj_05)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_03)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_03)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_03)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_01 obj_03)
    (pred_3 obj_13 obj_10)
    (pred_3 obj_10 obj_04)
    (pred_3 obj_04 obj_01)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_07)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
