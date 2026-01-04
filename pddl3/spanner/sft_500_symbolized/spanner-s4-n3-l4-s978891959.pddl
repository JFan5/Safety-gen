; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 978891959 --problem-name spanner-s4-n3-l4-s978891959
(define (problem spanner-s4-n3-l4-s978891959)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_12 obj_10 obj_13 obj_14 - type_5
     obj_11 obj_05 obj_02 - type_2
     obj_06 obj_04 obj_01 obj_09 - type_4
     obj_08 obj_03 - type_4
    )
 (:init 
    (pred_6 obj_07 obj_08)
    (pred_6 obj_12 obj_01)
    (pred_1 obj_12)
    (pred_6 obj_10 obj_04)
    (pred_1 obj_10)
    (pred_6 obj_13 obj_01)
    (pred_1 obj_13)
    (pred_6 obj_14 obj_06)
    (pred_1 obj_14)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_03)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_03)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_03)
    (pred_3 obj_08 obj_06)
    (pred_3 obj_09 obj_03)
    (pred_3 obj_06 obj_04)
    (pred_3 obj_04 obj_01)
    (pred_3 obj_01 obj_09)
)
 (:goal
  (and
   (pred_5 obj_11)
   (pred_5 obj_05)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
