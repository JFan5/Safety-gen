; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 595016557 --problem-name spanner-s4-n3-l4-s595016557
(define (problem spanner-s4-n3-l4-s595016557)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_08 obj_10 obj_06 obj_14 - type_5
     obj_13 obj_12 obj_03 - type_4
     obj_01 obj_05 obj_11 obj_02 - type_2
     obj_04 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_07 obj_04)
    (pred_2 obj_08 obj_02)
    (pred_1 obj_08)
    (pred_2 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_2 obj_06 obj_02)
    (pred_1 obj_06)
    (pred_2 obj_14 obj_02)
    (pred_1 obj_14)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_09)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_09)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_09)
    (pred_6 obj_04 obj_01)
    (pred_6 obj_02 obj_09)
    (pred_6 obj_01 obj_05)
    (pred_6 obj_05 obj_11)
    (pred_6 obj_11 obj_02)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_12)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
