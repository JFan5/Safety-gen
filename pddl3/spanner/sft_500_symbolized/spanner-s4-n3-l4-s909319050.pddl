; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 909319050 --problem-name spanner-s4-n3-l4-s909319050
(define (problem spanner-s4-n3-l4-s909319050)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_04 obj_12 obj_07 obj_03 - type_4
     obj_13 obj_09 obj_08 - type_3
     obj_11 obj_06 obj_01 obj_05 - type_1
     obj_10 obj_14 - type_1
    )
 (:init 
    (pred_2 obj_02 obj_10)
    (pred_2 obj_04 obj_11)
    (pred_4 obj_04)
    (pred_2 obj_12 obj_01)
    (pred_4 obj_12)
    (pred_2 obj_07 obj_06)
    (pred_4 obj_07)
    (pred_2 obj_03 obj_01)
    (pred_4 obj_03)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_14)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_14)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_14)
    (pred_3 obj_10 obj_11)
    (pred_3 obj_05 obj_14)
    (pred_3 obj_11 obj_06)
    (pred_3 obj_06 obj_01)
    (pred_3 obj_01 obj_05)
)
 (:goal
  (and
   (pred_6 obj_13)
   (pred_6 obj_09)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_13)) (not (pred_6 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
