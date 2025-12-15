; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 943601314 --problem-name spanner-s4-n3-l4-s943601314
(define (problem spanner-s4-n3-l4-s943601314)
 (:domain spanner)
 (:objects 
     obj_14 - type_1
     obj_06 obj_11 obj_05 obj_12 - type_4
     obj_07 obj_03 obj_08 - type_2
     obj_02 obj_04 obj_10 obj_01 - type_5
     obj_09 obj_13 - type_5
    )
 (:init 
    (pred_2 obj_14 obj_09)
    (pred_2 obj_06 obj_10)
    (pred_1 obj_06)
    (pred_2 obj_11 obj_04)
    (pred_1 obj_11)
    (pred_2 obj_05 obj_04)
    (pred_1 obj_05)
    (pred_2 obj_12 obj_02)
    (pred_1 obj_12)
    (pred_6 obj_07)
    (pred_2 obj_07 obj_13)
    (pred_6 obj_03)
    (pred_2 obj_03 obj_13)
    (pred_6 obj_08)
    (pred_2 obj_08 obj_13)
    (pred_5 obj_09 obj_02)
    (pred_5 obj_01 obj_13)
    (pred_5 obj_02 obj_04)
    (pred_5 obj_04 obj_10)
    (pred_5 obj_10 obj_01)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_03)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
