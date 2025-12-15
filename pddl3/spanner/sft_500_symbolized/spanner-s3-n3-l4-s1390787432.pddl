; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1390787432 --problem-name spanner-s3-n3-l4-s1390787432
(define (problem spanner-s3-n3-l4-s1390787432)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_02 obj_04 obj_06 - type_4
     obj_11 obj_10 obj_05 - type_5
     obj_12 obj_09 obj_07 obj_08 - type_3
     obj_13 obj_01 - type_3
    )
 (:init 
    (pred_1 obj_03 obj_13)
    (pred_1 obj_02 obj_07)
    (pred_4 obj_02)
    (pred_1 obj_04 obj_12)
    (pred_4 obj_04)
    (pred_1 obj_06 obj_09)
    (pred_4 obj_06)
    (pred_3 obj_11)
    (pred_1 obj_11 obj_01)
    (pred_3 obj_10)
    (pred_1 obj_10 obj_01)
    (pred_3 obj_05)
    (pred_1 obj_05 obj_01)
    (pred_5 obj_13 obj_12)
    (pred_5 obj_08 obj_01)
    (pred_5 obj_12 obj_09)
    (pred_5 obj_09 obj_07)
    (pred_5 obj_07 obj_08)
)
 (:goal
  (and
   (pred_6 obj_11)
   (pred_6 obj_10)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_05))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_13)))
  )
)
)
