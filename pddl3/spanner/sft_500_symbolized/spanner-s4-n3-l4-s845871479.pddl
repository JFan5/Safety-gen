; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 845871479 --problem-name spanner-s4-n3-l4-s845871479
(define (problem spanner-s4-n3-l4-s845871479)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_08 obj_05 obj_04 obj_07 - type_1
     obj_02 obj_09 obj_13 - type_5
     obj_01 obj_03 obj_11 obj_14 - type_2
     obj_06 obj_12 - type_2
    )
 (:init 
    (pred_1 obj_10 obj_06)
    (pred_1 obj_08 obj_11)
    (pred_2 obj_08)
    (pred_1 obj_05 obj_14)
    (pred_2 obj_05)
    (pred_1 obj_04 obj_01)
    (pred_2 obj_04)
    (pred_1 obj_07 obj_11)
    (pred_2 obj_07)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_12)
    (pred_4 obj_09)
    (pred_1 obj_09 obj_12)
    (pred_4 obj_13)
    (pred_1 obj_13 obj_12)
    (pred_5 obj_06 obj_01)
    (pred_5 obj_14 obj_12)
    (pred_5 obj_01 obj_03)
    (pred_5 obj_03 obj_11)
    (pred_5 obj_11 obj_14)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_09)
   (pred_6 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_09)) (not (pred_6 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_06)))
  )
)
)
