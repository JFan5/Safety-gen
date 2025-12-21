; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 322407604 --problem-name spanner-s4-n3-l4-s322407604
(define (problem spanner-s4-n3-l4-s322407604)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_07 obj_08 obj_13 obj_03 - type_5
     obj_09 obj_05 obj_01 - type_4
     obj_12 obj_11 obj_06 obj_14 - type_2
     obj_10 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_02 obj_10)
    (pred_2 obj_07 obj_06)
    (pred_1 obj_07)
    (pred_2 obj_08 obj_11)
    (pred_1 obj_08)
    (pred_2 obj_13 obj_06)
    (pred_1 obj_13)
    (pred_2 obj_03 obj_11)
    (pred_1 obj_03)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_04)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_04)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_04)
    (pred_6 obj_10 obj_12)
    (pred_6 obj_14 obj_04)
    (pred_6 obj_12 obj_11)
    (pred_6 obj_11 obj_06)
    (pred_6 obj_06 obj_14)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_05)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
