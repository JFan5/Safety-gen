; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 846782846 --problem-name spanner-s4-n3-l4-s846782846
(define (problem spanner-s4-n3-l4-s846782846)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_04 obj_08 obj_14 obj_02 - type_3
     obj_13 obj_07 obj_12 - type_1
     obj_11 obj_05 obj_01 obj_10 - type_2
     obj_06 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_06)
    (pred_6 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_6 obj_08 obj_11)
    (pred_5 obj_08)
    (pred_6 obj_14 obj_05)
    (pred_5 obj_14)
    (pred_6 obj_02 obj_01)
    (pred_5 obj_02)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_09)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_09)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_09)
    (pred_3 obj_06 obj_11)
    (pred_3 obj_10 obj_09)
    (pred_3 obj_11 obj_05)
    (pred_3 obj_05 obj_01)
    (pred_3 obj_01 obj_10)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_07)
   (pred_1 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
