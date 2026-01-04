; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1044496791 --problem-name spanner-s3-n3-l4-s1044496791
(define (problem spanner-s3-n3-l4-s1044496791)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_13 obj_06 obj_05 - type_3
     obj_10 obj_09 obj_04 - type_1
     obj_07 obj_03 obj_08 obj_11 - type_4
     obj_01 obj_12 - type_4
    )
 (:init 
    (pred_5 obj_02 obj_01)
    (pred_5 obj_13 obj_03)
    (pred_1 obj_13)
    (pred_5 obj_06 obj_11)
    (pred_1 obj_06)
    (pred_5 obj_05 obj_07)
    (pred_1 obj_05)
    (pred_6 obj_10)
    (pred_5 obj_10 obj_12)
    (pred_6 obj_09)
    (pred_5 obj_09 obj_12)
    (pred_6 obj_04)
    (pred_5 obj_04 obj_12)
    (pred_2 obj_01 obj_07)
    (pred_2 obj_11 obj_12)
    (pred_2 obj_07 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_2 obj_08 obj_11)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_09)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
