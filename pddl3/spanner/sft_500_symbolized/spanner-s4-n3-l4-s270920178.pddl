; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 270920178 --problem-name spanner-s4-n3-l4-s270920178
(define (problem spanner-s4-n3-l4-s270920178)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_05 obj_10 obj_07 obj_13 - type_3
     obj_02 obj_14 obj_11 - type_1
     obj_04 obj_01 obj_06 obj_12 - type_4
     obj_08 obj_09 - type_4
    )
 (:init 
    (pred_6 obj_03 obj_08)
    (pred_6 obj_05 obj_04)
    (pred_4 obj_05)
    (pred_6 obj_10 obj_04)
    (pred_4 obj_10)
    (pred_6 obj_07 obj_01)
    (pred_4 obj_07)
    (pred_6 obj_13 obj_06)
    (pred_4 obj_13)
    (pred_1 obj_02)
    (pred_6 obj_02 obj_09)
    (pred_1 obj_14)
    (pred_6 obj_14 obj_09)
    (pred_1 obj_11)
    (pred_6 obj_11 obj_09)
    (pred_3 obj_08 obj_04)
    (pred_3 obj_12 obj_09)
    (pred_3 obj_04 obj_01)
    (pred_3 obj_01 obj_06)
    (pred_3 obj_06 obj_12)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_14)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_14))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
