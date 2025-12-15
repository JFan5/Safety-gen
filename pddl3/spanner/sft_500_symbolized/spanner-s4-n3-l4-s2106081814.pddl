; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2106081814 --problem-name spanner-s4-n3-l4-s2106081814
(define (problem spanner-s4-n3-l4-s2106081814)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_02 obj_05 obj_14 obj_04 - type_1
     obj_09 obj_12 obj_08 - type_3
     obj_06 obj_01 obj_03 obj_07 - type_4
     obj_13 obj_10 - type_4
    )
 (:init 
    (pred_4 obj_11 obj_13)
    (pred_4 obj_02 obj_03)
    (pred_3 obj_02)
    (pred_4 obj_05 obj_06)
    (pred_3 obj_05)
    (pred_4 obj_14 obj_06)
    (pred_3 obj_14)
    (pred_4 obj_04 obj_03)
    (pred_3 obj_04)
    (pred_1 obj_09)
    (pred_4 obj_09 obj_10)
    (pred_1 obj_12)
    (pred_4 obj_12 obj_10)
    (pred_1 obj_08)
    (pred_4 obj_08 obj_10)
    (pred_2 obj_13 obj_06)
    (pred_2 obj_07 obj_10)
    (pred_2 obj_06 obj_01)
    (pred_2 obj_01 obj_03)
    (pred_2 obj_03 obj_07)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_12)
   (pred_5 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_13)))
  )
)
)
