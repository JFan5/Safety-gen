; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 197566507 --problem-name spanner-s4-n3-l4-s197566507
(define (problem spanner-s4-n3-l4-s197566507)
 (:domain spanner)
 (:objects 
     obj_13 - type_2
     obj_08 obj_07 obj_11 obj_01 - type_3
     obj_10 obj_14 obj_06 - type_5
     obj_12 obj_05 obj_03 obj_02 - type_1
     obj_04 obj_09 - type_1
    )
 (:init 
    (pred_5 obj_13 obj_04)
    (pred_5 obj_08 obj_05)
    (pred_3 obj_08)
    (pred_5 obj_07 obj_02)
    (pred_3 obj_07)
    (pred_5 obj_11 obj_12)
    (pred_3 obj_11)
    (pred_5 obj_01 obj_03)
    (pred_3 obj_01)
    (pred_1 obj_10)
    (pred_5 obj_10 obj_09)
    (pred_1 obj_14)
    (pred_5 obj_14 obj_09)
    (pred_1 obj_06)
    (pred_5 obj_06 obj_09)
    (pred_2 obj_04 obj_12)
    (pred_2 obj_02 obj_09)
    (pred_2 obj_12 obj_05)
    (pred_2 obj_05 obj_03)
    (pred_2 obj_03 obj_02)
)
 (:goal
  (and
   (pred_4 obj_10)
   (pred_4 obj_14)
   (pred_4 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_14))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
