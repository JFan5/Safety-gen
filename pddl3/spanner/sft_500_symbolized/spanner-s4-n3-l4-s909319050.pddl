; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 909319050 --problem-name spanner-s4-n3-l4-s909319050
(define (problem spanner-s4-n3-l4-s909319050)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_07 obj_11 obj_01 obj_04 - type_2
     obj_12 obj_08 obj_06 - type_3
     obj_13 obj_10 obj_09 obj_03 - type_4
     obj_14 obj_05 - type_4
    )
 (:init 
    (pred_1 obj_02 obj_14)
    (pred_1 obj_07 obj_13)
    (pred_2 obj_07)
    (pred_1 obj_11 obj_09)
    (pred_2 obj_11)
    (pred_1 obj_01 obj_10)
    (pred_2 obj_01)
    (pred_1 obj_04 obj_09)
    (pred_2 obj_04)
    (pred_4 obj_12)
    (pred_1 obj_12 obj_05)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_05)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_05)
    (pred_3 obj_14 obj_13)
    (pred_3 obj_03 obj_05)
    (pred_3 obj_13 obj_10)
    (pred_3 obj_10 obj_09)
    (pred_3 obj_09 obj_03)
)
 (:goal
  (and
   (pred_5 obj_12)
   (pred_5 obj_08)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_14)))
  )
)
)
