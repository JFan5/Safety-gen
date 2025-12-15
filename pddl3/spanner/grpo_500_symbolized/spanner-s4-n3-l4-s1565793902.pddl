; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1565793902 --problem-name spanner-s4-n3-l4-s1565793902
(define (problem spanner-s4-n3-l4-s1565793902)
 (:domain spanner)
 (:objects 
     obj_07 - type_4
     obj_01 obj_05 obj_03 obj_12 - type_5
     obj_06 obj_09 obj_02 - type_1
     obj_11 obj_13 obj_08 obj_10 - type_3
     obj_14 obj_04 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_14)
    (pred_3 obj_01 obj_13)
    (pred_1 obj_01)
    (pred_3 obj_05 obj_10)
    (pred_1 obj_05)
    (pred_3 obj_03 obj_13)
    (pred_1 obj_03)
    (pred_3 obj_12 obj_11)
    (pred_1 obj_12)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_04)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_04)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_4 obj_14 obj_11)
    (pred_4 obj_10 obj_04)
    (pred_4 obj_11 obj_13)
    (pred_4 obj_13 obj_08)
    (pred_4 obj_08 obj_10)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_09)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_14)))
  )
)
)
