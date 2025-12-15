; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1510091810 --problem-name spanner-s3-n3-l4-s1510091810
(define (problem spanner-s3-n3-l4-s1510091810)
 (:domain spanner)
 (:objects 
     obj_13 - type_1
     obj_07 obj_08 obj_03 - type_5
     obj_06 obj_09 obj_11 - type_4
     obj_02 obj_10 obj_05 obj_12 - type_2
     obj_01 obj_04 - type_2
    )
 (:init 
    (pred_5 obj_13 obj_01)
    (pred_5 obj_07 obj_10)
    (pred_3 obj_07)
    (pred_5 obj_08 obj_12)
    (pred_3 obj_08)
    (pred_5 obj_03 obj_02)
    (pred_3 obj_03)
    (pred_2 obj_06)
    (pred_5 obj_06 obj_04)
    (pred_2 obj_09)
    (pred_5 obj_09 obj_04)
    (pred_2 obj_11)
    (pred_5 obj_11 obj_04)
    (pred_1 obj_01 obj_02)
    (pred_1 obj_12 obj_04)
    (pred_1 obj_02 obj_10)
    (pred_1 obj_10 obj_05)
    (pred_1 obj_05 obj_12)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_09)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_09))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
