; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 943601314 --problem-name spanner-s4-n3-l4-s943601314
(define (problem spanner-s4-n3-l4-s943601314)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_13 obj_02 obj_09 obj_05 - type_3
     obj_08 obj_07 obj_10 - type_1
     obj_11 obj_01 obj_14 obj_06 - type_2
     obj_04 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_12 obj_04)
    (pred_6 obj_13 obj_14)
    (pred_5 obj_13)
    (pred_6 obj_02 obj_01)
    (pred_5 obj_02)
    (pred_6 obj_09 obj_01)
    (pred_5 obj_09)
    (pred_6 obj_05 obj_11)
    (pred_5 obj_05)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_03)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_03)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_03)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_06 obj_03)
    (pred_3 obj_11 obj_01)
    (pred_3 obj_01 obj_14)
    (pred_3 obj_14 obj_06)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_07)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
