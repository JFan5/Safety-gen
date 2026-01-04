; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 912182885 --problem-name spanner-s3-n3-l4-s912182885
(define (problem spanner-s3-n3-l4-s912182885)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_13 obj_01 obj_06 - type_2
     obj_12 obj_03 obj_08 - type_3
     obj_02 obj_04 obj_10 obj_07 - type_1
     obj_05 obj_11 - type_1
    )
 (:init 
    (pred_5 obj_09 obj_05)
    (pred_5 obj_13 obj_04)
    (pred_1 obj_13)
    (pred_5 obj_01 obj_04)
    (pred_1 obj_01)
    (pred_5 obj_06 obj_04)
    (pred_1 obj_06)
    (pred_4 obj_12)
    (pred_5 obj_12 obj_11)
    (pred_4 obj_03)
    (pred_5 obj_03 obj_11)
    (pred_4 obj_08)
    (pred_5 obj_08 obj_11)
    (pred_3 obj_05 obj_02)
    (pred_3 obj_07 obj_11)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_04 obj_10)
    (pred_3 obj_10 obj_07)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_03)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_05)))
  )
)
)
