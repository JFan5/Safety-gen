; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 292407928 --problem-name spanner-s4-n3-l4-s292407928
(define (problem spanner-s4-n3-l4-s292407928)
 (:domain spanner)
 (:objects 
     obj_07 - type_4
     obj_12 obj_04 obj_08 obj_10 - type_5
     obj_03 obj_09 obj_13 - type_1
     obj_06 obj_01 obj_05 obj_11 - type_3
     obj_02 obj_14 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_02)
    (pred_3 obj_12 obj_05)
    (pred_1 obj_12)
    (pred_3 obj_04 obj_11)
    (pred_1 obj_04)
    (pred_3 obj_08 obj_01)
    (pred_1 obj_08)
    (pred_3 obj_10 obj_06)
    (pred_1 obj_10)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_14)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_14)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_14)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_11 obj_14)
    (pred_4 obj_06 obj_01)
    (pred_4 obj_01 obj_05)
    (pred_4 obj_05 obj_11)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_09)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
