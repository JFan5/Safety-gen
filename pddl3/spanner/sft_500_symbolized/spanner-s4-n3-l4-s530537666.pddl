; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 530537666 --problem-name spanner-s4-n3-l4-s530537666
(define (problem spanner-s4-n3-l4-s530537666)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_06 obj_11 obj_01 obj_13 - type_1
     obj_10 obj_07 obj_12 - type_5
     obj_03 obj_02 obj_08 obj_04 - type_2
     obj_14 obj_09 - type_2
    )
 (:init 
    (pred_1 obj_05 obj_14)
    (pred_1 obj_06 obj_03)
    (pred_5 obj_06)
    (pred_1 obj_11 obj_03)
    (pred_5 obj_11)
    (pred_1 obj_01 obj_04)
    (pred_5 obj_01)
    (pred_1 obj_13 obj_02)
    (pred_5 obj_13)
    (pred_2 obj_10)
    (pred_1 obj_10 obj_09)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_09)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_09)
    (pred_6 obj_14 obj_03)
    (pred_6 obj_04 obj_09)
    (pred_6 obj_03 obj_02)
    (pred_6 obj_02 obj_08)
    (pred_6 obj_08 obj_04)
)
 (:goal
  (and
   (pred_4 obj_10)
   (pred_4 obj_07)
   (pred_4 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_14)))
  )
)
)
