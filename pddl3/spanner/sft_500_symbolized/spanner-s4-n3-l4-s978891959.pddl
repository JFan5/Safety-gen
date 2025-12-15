; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 978891959 --problem-name spanner-s4-n3-l4-s978891959
(define (problem spanner-s4-n3-l4-s978891959)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_07 obj_06 obj_12 obj_14 - type_4
     obj_04 obj_13 obj_03 - type_1
     obj_11 obj_01 obj_09 obj_08 - type_2
     obj_05 obj_02 - type_2
    )
 (:init 
    (pred_3 obj_10 obj_05)
    (pred_3 obj_07 obj_09)
    (pred_6 obj_07)
    (pred_3 obj_06 obj_01)
    (pred_6 obj_06)
    (pred_3 obj_12 obj_09)
    (pred_6 obj_12)
    (pred_3 obj_14 obj_11)
    (pred_6 obj_14)
    (pred_4 obj_04)
    (pred_3 obj_04 obj_02)
    (pred_4 obj_13)
    (pred_3 obj_13 obj_02)
    (pred_4 obj_03)
    (pred_3 obj_03 obj_02)
    (pred_2 obj_05 obj_11)
    (pred_2 obj_08 obj_02)
    (pred_2 obj_11 obj_01)
    (pred_2 obj_01 obj_09)
    (pred_2 obj_09 obj_08)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_13)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_05)))
  )
)
)
