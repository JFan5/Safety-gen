; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 875941947 --problem-name spanner-s4-n3-l4-s875941947
(define (problem spanner-s4-n3-l4-s875941947)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_01 obj_12 obj_11 obj_03 - type_4
     obj_14 obj_04 obj_02 - type_5
     obj_10 obj_08 obj_09 obj_13 - type_1
     obj_07 obj_05 - type_1
    )
 (:init 
    (pred_2 obj_06 obj_07)
    (pred_2 obj_01 obj_09)
    (pred_1 obj_01)
    (pred_2 obj_12 obj_08)
    (pred_1 obj_12)
    (pred_2 obj_11 obj_13)
    (pred_1 obj_11)
    (pred_2 obj_03 obj_09)
    (pred_1 obj_03)
    (pred_6 obj_14)
    (pred_2 obj_14 obj_05)
    (pred_6 obj_04)
    (pred_2 obj_04 obj_05)
    (pred_6 obj_02)
    (pred_2 obj_02 obj_05)
    (pred_4 obj_07 obj_10)
    (pred_4 obj_13 obj_05)
    (pred_4 obj_10 obj_08)
    (pred_4 obj_08 obj_09)
    (pred_4 obj_09 obj_13)
)
 (:goal
  (and
   (pred_3 obj_14)
   (pred_3 obj_04)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_07)))
  )
)
)
