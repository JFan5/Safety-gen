; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2106081814 --problem-name spanner-s4-n3-l4-s2106081814
(define (problem spanner-s4-n3-l4-s2106081814)
 (:domain spanner)
 (:objects 
     obj_12 - type_2
     obj_14 obj_03 obj_08 obj_10 - type_5
     obj_13 obj_07 obj_05 - type_4
     obj_04 obj_09 obj_02 obj_06 - type_3
     obj_11 obj_01 - type_3
    )
 (:init 
    (pred_3 obj_12 obj_11)
    (pred_3 obj_14 obj_02)
    (pred_1 obj_14)
    (pred_3 obj_03 obj_04)
    (pred_1 obj_03)
    (pred_3 obj_08 obj_04)
    (pred_1 obj_08)
    (pred_3 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_01)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_01)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_01)
    (pred_2 obj_11 obj_04)
    (pred_2 obj_06 obj_01)
    (pred_2 obj_04 obj_09)
    (pred_2 obj_09 obj_02)
    (pred_2 obj_02 obj_06)
)
 (:goal
  (and
   (pred_6 obj_13)
   (pred_6 obj_07)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_05))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
