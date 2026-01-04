; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1690661123 --problem-name spanner-s4-n3-l4-s1690661123
(define (problem spanner-s4-n3-l4-s1690661123)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_14 obj_10 obj_02 obj_05 - type_1
     obj_08 obj_01 obj_03 - type_2
     obj_13 obj_06 obj_11 obj_12 - type_3
     obj_04 obj_09 - type_3
    )
 (:init 
    (pred_1 obj_07 obj_04)
    (pred_1 obj_14 obj_06)
    (pred_5 obj_14)
    (pred_1 obj_10 obj_12)
    (pred_5 obj_10)
    (pred_1 obj_02 obj_11)
    (pred_5 obj_02)
    (pred_1 obj_05 obj_13)
    (pred_5 obj_05)
    (pred_6 obj_08)
    (pred_1 obj_08 obj_09)
    (pred_6 obj_01)
    (pred_1 obj_01 obj_09)
    (pred_6 obj_03)
    (pred_1 obj_03 obj_09)
    (pred_4 obj_04 obj_13)
    (pred_4 obj_12 obj_09)
    (pred_4 obj_13 obj_06)
    (pred_4 obj_06 obj_11)
    (pred_4 obj_11 obj_12)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_01)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_08)) (not (pred_2 obj_01))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
