; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 845871479 --problem-name spanner-s4-n3-l4-s845871479
(define (problem spanner-s4-n3-l4-s845871479)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_03 obj_04 obj_11 obj_01 - type_5
     obj_05 obj_07 obj_08 - type_3
     obj_14 obj_12 obj_09 obj_10 - type_2
     obj_02 obj_13 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_02)
    (pred_2 obj_03 obj_09)
    (pred_5 obj_03)
    (pred_2 obj_04 obj_10)
    (pred_5 obj_04)
    (pred_2 obj_11 obj_14)
    (pred_5 obj_11)
    (pred_2 obj_01 obj_09)
    (pred_5 obj_01)
    (pred_4 obj_05)
    (pred_2 obj_05 obj_13)
    (pred_4 obj_07)
    (pred_2 obj_07 obj_13)
    (pred_4 obj_08)
    (pred_2 obj_08 obj_13)
    (pred_6 obj_02 obj_14)
    (pred_6 obj_10 obj_13)
    (pred_6 obj_14 obj_12)
    (pred_6 obj_12 obj_09)
    (pred_6 obj_09 obj_10)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_07)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
